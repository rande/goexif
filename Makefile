.PHONY: test run explorer build


install:
	go list -f '{{range .Imports}}{{.}} {{end}}' ./... | xargs go get -v
	go list -f '{{range .TestImports}}{{.}} {{end}}' ./... | xargs go get -v

format:
	gofmt -l -w -s .
	go fix ./...

test:
	go test ./...
	go vet ./...
