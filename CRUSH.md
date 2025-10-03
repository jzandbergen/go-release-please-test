# CRUSH.md - Go Release Please Test

## Build/Test/Lint Commands
```bash
# Build the application
go build -o go-release-please-test .

# Run the application
go run main.go

# Test all packages
go test ./...

# Test a single package/file
go test -run TestFunctionName ./path/to/package

# Format code
go fmt ./...

# Vet code for common mistakes
go vet ./...

# Clean build cache
go clean
```

## Code Style Guidelines
- **Imports**: Standard library first, then third-party, then local packages with blank lines between groups
- **Formatting**: Use `go fmt` - tabs for indentation, spaces for alignment
- **Naming**: CamelCase for exported, camelCase for unexported, use descriptive names
- **Variables**: Declare close to usage, use short names in short scopes (i, err, etc.)
- **Error Handling**: Always check errors, return early on error, wrap with context when needed
- **Types**: Use built-in types when possible, define custom types for domain concepts
- **Functions**: Keep functions small and focused, return errors as last value
- **Comments**: Document exported functions/types, use complete sentences starting with the name
- **Package Structure**: One package per directory, main package for executables only