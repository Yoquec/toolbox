package superscript_test

import (
	"testing"

	"github.com/yoquec/toolbox/texttransform/pkg/cmd/superscript"
)

func TestInvoke(t *testing.T) {
	tests := []struct {
		name        string
		in          string
		expectedOut string
	}{
		{
			name:        "GIVEN alphabetical text THEN Invoke SHALL NOT modify characters",
			in:          "hi!",
			expectedOut: "hi!",
		},
		{
			name:        "GIVEN alphanumerical text THEN Invoke SHALL modify only numerical characters",
			in:          "This is a simple sum: 12345 + 67890 = 80235",
			expectedOut: "This is a simple sum: ¹²³⁴⁵ + ⁶⁷⁸⁹⁰ = ⁸⁰²³⁵",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			actual := superscript.Invoke(tt.in)
			if tt.expectedOut != actual {
				t.Fatalf("Expected %q, got %q", tt.expectedOut, actual)
			}
		})
	}
}
