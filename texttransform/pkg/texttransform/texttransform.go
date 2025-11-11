package texttransform

type Subcommand string

const (
	SUPERSCRIPT Subcommand = "superscript"
	HELP        Subcommand = "help"
)

type Command interface {
	Invoke(text string) string
	Help() string
}
