package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "GO working !")
	})

	http.ListenAndServe(":8081", nil)
}
