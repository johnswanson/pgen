package main

import (
	"net/http"
	"html/template"
)

func main() {
	http.HandleFunc("/", normalHandler)
	http.HandleFunc("dev.mawud.com/", devHandler)
	http.Handle("dev.mawud.com/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	http.ListenAndServe(":80", nil)
}

func normalHandler(w http.ResponseWriter, r *http.Request) {
	template.Must(template.ParseFiles("form.tpl")).Execute(w, nil)
}

func devHandler(w http.ResponseWriter, r *http.Request) {
	template.Must(template.ParseFiles("devform.tpl")).Execute(w, nil)
}
