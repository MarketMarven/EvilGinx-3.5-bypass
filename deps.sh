#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- Variables ---
DOTNET_VERSION="8.0" # Specify the desired major.minor .NET version
APACHE_PACKAGE="apache2"
SSH_PACKAGE="openssh-server"
GO_PACKAGE="golang-go" # Use 'golang' or 'golang-go' depending on the Ubuntu/Debian version
GRAPH_RUNNER_REPO="https://github.com/dafthack/GraphRunner.git"
GRAPH_RUNNER_DIR="/opt/GraphRunner" # The directory to clone the repository into

# Function to check for and run a command with sudo
run_with_sudo() {
    echo "--- Running: $* ---"
    if sudo "$@"; then
        echo "--- Command successful: $* ---"
    else
        echo "!!! ERROR: Command failed: $* !!!" >&2
        exit 1
    fi
}

echo "Starting installation script for Apache2, .NET Core, PowerShell, OpenSSH Server, Golang, Cloudflared, and Git..."

# 1. Update package lists and install basic dependencies (including git)
run_with_sudo apt update
run_with_sudo apt install -y curl wget apt-transport-https lsb-release ca-certificates gnupg software-properties-common git

# 2. Install Apache2 and OpenSSH Server
echo "Installing Apache2 and OpenSSH Server..."
run_with_sudo apt install -y $APACHE_PACKAGE $SSH_PACKAGE

# Check and enable/start services
run_with_sudo systemctl enable $APACHE_PACKAGE || true
run_with_sudo systemctl start $APACHE_PACKAGE || true
run_with_sudo systemctl enable ssh || true
run_with_sudo systemctl start ssh || true

# 3. Install Golang
echo "Installing Golang (Go)..."
run_with_sudo apt install -y $GO_PACKAGE
echo "Setting up basic Go environment variables for current user (~/.profile). Log out and back in for this to take effect."
# Note: These environment variables are for the current user and need a new shell session to be active.
echo 'export GOPATH=$HOME/go' >> "$HOME/.profile"
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >> "$HOME/.profile"

# 4. Install .NET Hosting Bundle (ASP.NET Core Runtime)
echo "Installing .NET Hosting Runtime $DOTNET_VERSION..."
# Download and register the Microsoft package signing key
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
run_with_sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
run_with_sudo apt update
# Install the ASP.NET Core Runtime for hosting
run_with_sudo apt install -y aspnetcore-runtime-"$DOTNET_VERSION"

# 5. Install PowerShell
echo "Installing PowerShell using Snap..."
# Ensure snapd is installed
if ! command -v snap &> /dev/null; then
    echo "Installing snapd..."
    run_with_sudo apt install -y snapd
fi
# Install PowerShell
run_with_sudo snap install powershell --classic

# 6. Install Cloudflared
echo "Installing Cloudflared using the official Cloudflare repository..."
# Add Cloudflare GPG key
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | run_with_sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
# Add Cloudflared repository
# The $(lsb_release -cs) command dynamically gets the distribution codename (e.g., jammy, bullseye)
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | run_with_sudo tee /etc/apt/sources.list.d/cloudflared.list > /dev/null
# Install cloudflared
run_with_sudo apt update
run_with_sudo apt install -y cloudflared

# 7. Clone GraphRunner Repository
echo "Cloning GraphRunner from GitHub to $GRAPH_RUNNER_DIR..."
run_with_sudo mkdir -p "$GRAPH_RUNNER_DIR"
run_with_sudo git clone "$GRAPH_RUNNER_REPO" "$GRAPH_RUNNER_DIR"

# 8. Configure Apache for .NET Core (Basic Proxy)
echo "Configuring Apache for .NET Core reverse proxy..."
# Install Apache proxy modules
run_with_sudo a2enmod proxy proxy_http proxy_wstunnel || true

# Create a basic virtual host file for a .NET application proxy (assuming a Kestrel port 5000)
VHOST_CONF="/etc/apache2/sites-available/dotnet-app.conf"
run_with_sudo bash -c "cat > $VHOST_CONF" << EOF
<VirtualHost *:80>
    ServerName localhost
    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:5000/
    ProxyPassReverse / http://127.0.0.1:5000/
    ErrorLog \${APACHE_LOG_DIR}/dotnet-error.log
    CustomLog \${APACHE_LOG_DIR}/dotnet-access.log combined
</VirtualHost>
EOF

# Enable the new site and restart Apache
run_with_sudo a2ensite dotnet-app.conf || true
run_with_sudo a2dissite 000-default.conf || true # Disable the default welcome page
run_with_sudo systemctl restart apache2

echo "Installation complete."
echo "--------------------------------------------------------"
echo "To use Golang, log out and back in, then run: go version"
echo "To use PowerShell, run: pwsh"
echo "GraphRunner cloned to: $GRAPH_RUNNER_DIR"
echo "To set up Cloudflared, run: sudo cloudflared tunnel login (requires a Cloudflare account)."
echo "--------------------------------------------------------"
