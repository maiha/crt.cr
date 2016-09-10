SHELL = /bin/bash
LINK_FLAGS = --link-flags "-static"
SRCS = ${wildcard examples/*.cr}
PROGS = $(SRCS:examples/%.cr=%)

.PHONY : all static examples clean bin hello hello-static spec test
.PHONY : ${PROGS}

all: build

test: all examples static spec

static: hello-static

build: bin ${PROGS}

bin:
	@mkdir -p bin

hello: examples/hello.cr
	crystal build --release $^ -o bin/$@

hello-static: examples/hello.cr
	crystal build --release $^ -o bin/$@ ${LINK_FLAGS}

spec:
	crystal spec -v

examples:
	@for x in examples/*.cr ; do\
	  crystal build "$$x" -o /dev/null ;\
	done

clean:
	@rm -rf bin
