.PHONY: all
all: build

.PHONY: build
build: 
	# 编译
	go get -u github.com/yudaiyan/...
	go mod tidy
