package superscript

type Command struct{}

func (_ Command) Invoke(text string) string {
	output := make([]rune, len(text))

	for i, c := range text {
		output[i] = transform(c)
	}

	return string(output)
}

func (_ Command) Help() string {
	return ""
}

func transform(c rune) rune {
	var offset rune

	switch {
	// number 0
	case c == 48:
		return 8304
	// number 1
	case c == 49:
		return 185
	// numbers 2 and 3
	case 50 <= c && c <= 51:
		offset = 128
		return c + offset
	// numbers from 4 to 9
	case 52 <= c && c <= 57:
		offset = 8256
		return c + offset
	default:
		return c
	}
}
