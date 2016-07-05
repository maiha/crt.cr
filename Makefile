SHELL = /bin/bash
LINK_FLAGS = --link-flags "-static"
SRCS = ${wildcard examples/*.cr}
PROGS = $(SRCS:examples/%.cr=%)

.PHONY : all static compile clean bin hello spec
.PHONY : ${PROGS}

all: build

build: bin ${PROGS}

bin:
	@mkdir -p bin

hello: examples/hello.cr
	crystal compile --release $^ -o bin/$@

hello-static: examples/hello.cr
	crystal compile --release $^ -o bin/$@ ${LINK_FLAGS}

spec:
	crystal spec -v

compile:
	@for x in examples/*.cr ; do\
	  crystal compile "$$x" -o /dev/null ;\
	done

clean:
	@rm -rf bin
