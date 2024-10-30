package main

import (
	"fmt"
	"net/http"
)

func main() {
	// Application endpoint
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, you've requested: %s\n", r.URL.Path)
	})
	// Health check endpoint
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("OK"))
	})
	fmt.Println("Web app running on localhost:3000")
	http.ListenAndServe(":3000", nil)
}
