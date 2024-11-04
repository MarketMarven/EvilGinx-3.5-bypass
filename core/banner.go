package core

import (
	"fmt"
	"strings"

	"github.com/fatih/color"
)

const (
	VERSION = "3.5"
)

func putAsciiArt(s string) {
	for _, c := range s {
		d := string(c)
		switch string(c) {
		case " ":
			color.Set(color.BgRed)
			d = " "
		case "@":
			color.Set(color.BgBlack)
			d = " "
		case "#":
			color.Set(color.BgHiRed)
			d = " "
		case "W":
			color.Set(color.BgWhite)
			d = " "
		case "_":
			color.Unset()
			d = " "
		case "\n":
			color.Unset()
		}
		fmt.Print(d)
	}
	color.Unset()
}

func printLogo(s string) {
	for _, c := range s {
		d := string(c)
		switch string(c) {
		case "_":
			color.Set(color.FgWhite)
		case "\n":
			color.Unset()
		default:
			color.Set(color.FgHiBlack)
		}
		fmt.Print(d)
	}
	color.Unset()
}

func printUpdateName() {
	nameClr := color.New(color.FgHiWhite)
	txt := nameClr.Sprintf("               - --")
	fmt.Fprintf(color.Output, "%s", txt)
}


func printOneliner1() {
	handleClr := color.New(color.FgHiBlue)
	versionClr := color.New(color.FgGreen)
	textClr := color.New(color.FgHiBlack)
	spc := strings.Repeat(" ", 10-len(VERSION))
	txt := textClr.Sprintf("      Telegram (") + handleClr.Sprintf("@Belphs") + textClr.Sprintf(")") + spc + textClr.Sprintf("version ") + versionClr.Sprintf("%s", "3.5 +bypass")
	fmt.Fprintf(color.Output, "%s", txt)
}

func printOneliner2() {
	textClr := color.New(color.FgHiGreen)
	versionClr := color.New(color.FgGreen)
	txt := textClr.Sprintf(      textClr.Sprintf("Bypass Enabled: ") + versionClr.Sprintf("%s", "0"))
	fmt.Fprintf(color.Output, "%s", txt)
}

func printOneliner3() {
	textClr := color.New(color.FgHiRed)

	txt := textClr.Sprintf(      textClr.Sprintf("Cloudflare, Botguard, hCaptcha, reCaptcha, GeeTest, CustomJS"))
	fmt.Fprintf(color.Output, "%s", txt)
}



func printOneliner4() {
	textClr := color.New(color.FgHiGreen)
	versionClr := color.New(color.FgGreen)
	txt := textClr.Sprintf(      textClr.Sprintf("Cloaker Enabled: ") + versionClr.Sprintf("%s", "0"))
	fmt.Fprintf(color.Output, "%s", txt)
}

func printOneliner5() {
	textClr := color.New(color.FgHiRed)

	txt := textClr.Sprintf(      textClr.Sprintf("BlackTDS, Cloudflare Pages/Workers, Custom JS, Custom php, Custom Firewall, Js Identifier"))
	fmt.Fprintf(color.Output, "%s", txt)
}





func Banner() {
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	fmt.Println()
	printOneliner1()
	fmt.Println()
	fmt.Println()
	printOneliner2()
	fmt.Println()
	printOneliner3()
	fmt.Println()
	fmt.Println()
	printOneliner4()
	fmt.Println()
	printOneliner5()
	fmt.Println()
}
