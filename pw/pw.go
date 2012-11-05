package pgen

import (
	"math"
	"crypto/sha256"
	"strconv"
)

func singleSha(in []byte) []byte {
	sha := sha256.New()
	sha.Write(in)
	var out []byte
	return sha.Sum(out)
}

func repeatedSha(in []byte, times int) (out []byte) {
	if times == 1 {
		out = singleSha(in)
	} else {
		out = repeatedSha(singleSha(in), times - 1)
	}
	return
}

func toAlpha(bs []byte, alpha string) string {
	l := len(alpha)
	var s string
	for _,b := range bs {
		n := int(b)
		for n > 0 {
			index := n%l
			s += string(alpha[index])
			n = int(math.Floor(float64(n/l)))
		}
	}
	return s
}

func GetPassword(master, service, alphabet string, length int) string {
	iterations := 1001
	pw := ""
	for len(pw) < length {
		iterations++
		bs := repeatedSha([]byte(master+service+strconv.Itoa(iterations)), iterations)
		pw = toAlpha(bs, alphabet)
	}
	return pw[:length]
}
