.PHONY: all
all: build

.PHONY: build
build: 
	# 编译
	go get -u github.com/yudaiyan/...
	go mod tidy


# 获取当前tag，并计算出下个tag
latest_tag = $(shell git describe --abbrev=0 --tags 2>/dev/null || echo "v0.0.0")
tag_prefix := $(shell echo $(latest_tag) | sed -n 's/^\(v[0-9]\.[0-9]\.\).*/\1/p')
last_version := $(shell echo $(latest_tag) | sed -n 's/^v[0-9]*\.[0-9]*.\([0-9]*\)/\1/p')
next_version = $(shell expr $(last_version) + 1)
new_tag = $(tag_prefix)$(next_version)
tag_commit := $(shell git rev-list -n 1 $(latest_tag))
commit := $(shell git rev-parse HEAD)
.PHONY: tag
tag: 
ifeq ($(tag_commit), $(commit))
	@echo "当前tag [$(latest_tag)] 是最新的commit, 无需更新"
else
	git tag $(new_tag)
	git push --tags
	# 包含了创建release
	gh release create $(new_tag) -t "$(new_tag)" -n ""
endif


	
