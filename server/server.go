package main

import (
	"net/http"
	"html/template"
)

type server struct{}

func main() {
	var handler server
	http.ListenAndServe("localhost:80", handler)
}

func (s server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	tmpl, err := template.ParseFiles("form.tpl")
	if err != nil {
		return
	}
	data := struct{}{}
	tmpl.Execute(w, data)
}
