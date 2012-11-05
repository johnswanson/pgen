package pgen

import (
	"testing"
	"encoding/hex"
	"fmt"
)

var bytes []byte
const emptyStringHash string = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
const doubleEmptyHash string = "5df6e0e2761359d30a8275058e299fcc0381534545f55cf43e41983f5d4c9456"
const toA string = "cgbbafaeeceegccfcffbbcedbeecfccfcgcgffbdbbeddecgebgcbgcbaafbgbggegbbccbfadacbcgbgdbbadcfb"
const pw string = "ggdcafdfbbbedcd"

func TestInit(t *testing.T) {
	bytes = []byte("")
}

func TestSingleSha(t *testing.T) {
	res := hex.EncodeToString(singleSha(bytes))
	if hex.EncodeToString(singleSha(bytes)) != emptyStringHash {
		t.Error("SingleSha output incorrect.\n")
		diff(emptyStringHash, res)
	}
}

func TestRepeatedSha(t *testing.T) {
	res := hex.EncodeToString(repeatedSha(bytes, 2))
	if res != doubleEmptyHash {
		t.Error("Double sha output incorrect.\n")
		diff(doubleEmptyHash, res)
	}
}

func TestToAlpha(t *testing.T){
	res := toAlpha(repeatedSha(bytes, 2), "abcdefg")
	if res != toA {
		t.Error()
		diff(toA, res)
	}
}

func TestGetPassword(t *testing.T){
	res := GetPassword("", "", "abcdefg", 15)
	if res != pw {
		t.Error()
		diff(pw, res)
	}
}

func diff(a, b string){
	fmt.Println("FAILED:")
	fmt.Printf("\nexpected:%s\nactual:%s\n", a, b)
}
