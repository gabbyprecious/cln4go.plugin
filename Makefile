CC=go
FMT=gofmt
NAME=cln4go-plugin
BASE_DIR=/script
OS=linux
ARCH=386
ARM=

default: fmt lint
	$(CC) build -o $(NAME) cmd/plugin.go

fmt:
	$(CC) fmt ./...

lint:
	golangci-lint run

check:
	$(CC) test -v ./...

build_plugin:
	env GOOS=$(OS) GOARCH=$(ARCH) GOARM=$(ARM) $(CC) build -o $(NAME)-$(OS)-$(ARCH) cmd/plugin.go

dep:
	$(CC) mod vendor
