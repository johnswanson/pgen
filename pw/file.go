package pgen

import (
	"encoding/gob"
	"os"
)

func (a PasswordGenerator) Equals(b PasswordGenerator) bool {
	return (
		a.Allowed == b.Allowed &&
		a.Service == b.Service &&
		a.Length  == b.Length)
}

type PasswordGenerator struct {
	Allowed string
	Service string
	Length int
}

func getFile(trunc bool) (f *os.File, err error) {
	path := os.Getenv("HOME") + string(os.PathSeparator) + ".pwlist"
	flag := os.O_RDWR|os.O_CREATE
	if trunc {
		flag = flag|os.O_TRUNC
	}
	f, err = os.OpenFile(path, flag, 0666)
	return
}

func readPassFile() map[string][]PasswordGenerator {
	file, _ := getFile(false)
	defer file.Close()

	// enc := gob.NewEncoder(&file)
	var passwords map[string][]PasswordGenerator
	dec := gob.NewDecoder(file)
	dec.Decode(&passwords)
	return passwords
}

func writePassFile(pws map[string][]PasswordGenerator) {
	file, _ := getFile(true)
	defer file.Close()
	enc := gob.NewEncoder(file)
	enc.Encode(pws)
}

func NumOfPasswords(service string) int {
	passwords := readPassFile()
	return len(passwords[service])
}

func GetPasswordList(service string) (pws []PasswordGenerator, ok bool) {
	pws, ok = readPassFile()[service]
	return
}

func GetExistingPassword(service string) (pw PasswordGenerator, ok bool) {
	passwords := readPassFile()
	list, ok := passwords[service]
	if !ok {
		pw = PasswordGenerator{}
	} else {
		pw = list[len(list)-1]
	}
	return
}

func GetExistingPasswordN(service string, n int) (pw PasswordGenerator, ok bool) {
	list, ok := readPassFile()[service]
	if ok {
		if len(list) - (1+n) < 0 {
			n = len(list) - 1
		}
		pw = list[len(list)-(1+n)]
	} else {
		pw = PasswordGenerator{}
	}
	return
}

func (pw *PasswordGenerator) Delete() {
	passwords := readPassFile()
	delete(passwords, pw.Service)
	writePassFile(passwords)
}

func (pw PasswordGenerator) Save() {
	passwords := readPassFile()
	if passwords != nil {
		list := passwords[pw.Service]
		if len(list) == 0 || !(list[len(list)-1].Equals(pw)) {
			list = append(list, pw)
		}
		passwords[pw.Service] = list
	} else {
		passwords = make(map[string][]PasswordGenerator)
		passwords[pw.Service] = []PasswordGenerator{pw}
	}
	writePassFile(passwords)
}
