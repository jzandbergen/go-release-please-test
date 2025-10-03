package main

import "fmt"

var version string = "dev"

func main() {
	// This is a fake AWS access key for testing Trivy secret detection
	// AKIAIOSFODNN7EXAMPLE
	fmt.Println("This is go-release-please version: " + version)
	fmt.Println("Look at this awesome feature...")
}
