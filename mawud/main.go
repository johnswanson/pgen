package main

import (
	"errors"
	"syscall"
	"fmt"
	"pgen/pw"
	"os"
	"flag"
	"bufio"
	"os/exec"
	"strings"
	"runtime"
)

var pwlen int
var allow, serv, secr, alphabet string
var showtyping, showpass, flagsSet bool
var flags *flag.FlagSet

const PREVIOUS_PASSWORD_PROMPT string = `Previous password found, but you entered params.
Save new parameters? y/N`

func clip(data string){
	if runtime.GOOS != "darwin" {
		return
	}
	cmd := exec.Command("pbcopy", "")
	input, err := cmd.StdinPipe()
	if err != nil {
		fmt.Println(err)
	} else {
		cmd.Start()
		input.Write([]byte(data))
		input.Close()
		cmd.Wait()
	}
}

func init() {
	flags = flag.NewFlagSet("flags", flag.ExitOnError)
	flags.IntVar(&pwlen, "l", 15, "max length")
	flags.StringVar(&allow, "a", "ans", "allowed code: a[lphabetic], n[umeric], s[ymbolic]")
	flags.StringVar(&alphabet, "alpha", "", "allowed alphabet. WARNING: OVERRIDES REGULAR CODE")
	flags.BoolVar(&showtyping, "f", false, "force visible password--useful for creating a new password")
	flags.BoolVar(&showpass, "p", false, "force visible result instead of just c&p")
}

func getAllowed(pw pgen.PasswordGenerator, a string) pgen.PasswordGenerator {
	pw.Allowed = ""
	if strings.Contains(a, "a") {
		pw.Allowed += "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	}
	if strings.Contains(a, "n") {
		pw.Allowed += "0123456789"
	}
	if strings.Contains(a, "s") {
		pw.Allowed += "~`!@#$%^&*()_+-={}|[]\\:\";'<>?,./"
	}
	if pw.Allowed == "" {
		pw.Allowed = "abcdefghijklnopqrstuvwxyz"
	}
	return pw
}

func getPasswordFromArgs() (pwgen pgen.PasswordGenerator, ok bool) {
	if !(len(os.Args) > 1) {
		return
	}
	serv = os.Args[1]
	if len(os.Args) > 2 {
		flags.Parse(os.Args[2:])
		pwgen = pgen.PasswordGenerator{
			Service: serv,
			Length: pwlen,
		}
		pwgen = getAllowed(pwgen, allow)
		if allow == "ans" &&
			alphabet == "" &&
			pwlen == 15 {
				ok = false
			} else {
				ok = true
			}
	} else {
		pwgen = pgen.PasswordGenerator{
			Service: serv,
			Length: pwlen,
		}
		pwgen = getAllowed(pwgen, allow)
		ok = false
	}
	return
}

func main() {
	pPassword, argsExists := getPasswordFromArgs()
	sPassword, savedExists := getSavedPassword()
	if argsExists && savedExists {
		fmt.Println(PREVIOUS_PASSWORD_PROMPT)
		var r string
		fmt.Scanf("%s", &r)
		if r != "y" {
			argsExists = false
		} else {
			savedExists = false
		}
	}
	if savedExists {
		getPassword(sPassword)
	} else {
		getPassword(pPassword)
		pPassword.Save()
	}
	return
}

func pwinput(prompt string) (pw string, err error) {
	fmt.Print(prompt)
	cmd := "/bin/stty"
	args := []string{"stty", "-echo"}
	fd := []uintptr{uintptr(syscall.Stdin), uintptr(syscall.Stdout), uintptr(syscall.Stderr)}
	proc := new(syscall.ProcAttr)
	proc.Files = fd
	_, err = syscall.ForkExec(cmd, args, proc)
	if err != nil {
		return pw, errors.New("failed forkexec")
	}
	bytes := make([]byte, 1000)
	os.Stdin.Read(bytes)
	pw = strings.TrimRight(string(bytes), string([]byte{0}))
	pw = strings.TrimRight(pw, "\n")
	return
}

func getPassword(pw pgen.PasswordGenerator) {
	var secr string
	if showtyping {
		fmt.Print("(visible) Enter your master passphrase: ")
		in := bufio.NewReader(os.Stdin)
		secr, _ = in.ReadString('\n')
		secr = strings.TrimRight(secr, "\n")
	} else {
		secr, _ = pwinput("Enter your master passphrase\n")
	}
	pass := pgen.GetPassword(secr, pw.Service, pw.Allowed, pw.Length)
	clip(pass)
	if showpass {
		fmt.Println(pass)
	}
}


func getSavedPassword() (pwgen pgen.PasswordGenerator, ok bool) {
	prev, ok := pgen.GetExistingPassword(serv)
	if !ok {
		pwgen = pgen.PasswordGenerator{}
		ok = false
	} else {
		pwgen = prev
		ok = true
	}
	return
}
