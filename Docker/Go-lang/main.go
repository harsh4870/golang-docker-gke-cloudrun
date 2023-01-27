package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

func hello(w http.ResponseWriter, r *http.Request) {
	host, _ := os.Hostname()
	log.Printf("Serving request: %s", r.URL.Path)
	io.WriteString(w, "Hello Rajkot...!\n")
	fmt.Fprintf(w, "Version: 1.0.0\n")
	fmt.Fprintf(w, "Hostname: %s\n", host)
}

func main() {
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8080", nil)
}
