.PHONY: build-cli
build-cli:
	CGO_ENABLED=0 go build -o build/filmstash-cli cmd/filmstash-cli/main.go


.PHONY: build
build: build-cli


.PHONY: report
report:
	gofmt -s -l ./
	go vet ./...
	ineffassign ./...
	gocyclo -over 15 ./
	misspell ./


.PHONY: fix-fmt
fix-fmt:
	gofmt -s -w ./


.PHONY: fix-misspelling
fix-misspelling:
	misspell -w ./


.PHONY: fix-all
fix-all: fix-fmt fix-misspelling


.PHONY: clean
clean:
	rm -rf build/* || true
	rm -rf vendor/ || true
