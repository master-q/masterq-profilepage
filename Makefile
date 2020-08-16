all: build

build:
	stack build
	stack run masterq-prof build

server: build
	stack run masterq-prof server

publish: build
	cp -pr _site/* ~/doc/master-q.github.io/

lint: hakyll.hs
	hlint -c hakyll.hs

clean:
	stack run ikmsm-web clean
	stack clean
	rm -rf *.hi *.o
	rm -f `find . -name "*~"`

.PHONY: build lint clean
