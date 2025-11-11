package main

import (
	"flag"
	"fmt"
	"io"
	"log"
	"os"

	"github.com/yoquec/toolbox/texttransform/pkg/cmd"
	"github.com/yoquec/toolbox/texttransform/pkg/cmd/superscript"
	tt "github.com/yoquec/toolbox/texttransform/pkg/texttransform"
)

func init() {
	flag.Parse()
}

func main() {
	logger := log.New(os.Stderr, "", log.Lmsgprefix)

	if flag.NArg() < 1 {
		logger.Fatalln(cmd.HelpMessage)
	}

	var command tt.Command
	subcommand := tt.Subcommand(flag.Args()[0])
	switch subcommand {
	case tt.SUPERSCRIPT:
		command = superscript.Command{}
	case tt.HELP:
		logger.Println(cmd.HelpMessage)
		return
	default:
		logger.Fatalln(cmd.HelpMessage)
	}

	if inputBytes, err := io.ReadAll(os.Stdin); err != nil {
		logger.Fatalln(err)
	} else {
		input := string(inputBytes)
		fmt.Println(command.Invoke(input))
	}
}
