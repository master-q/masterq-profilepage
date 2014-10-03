all: build

hakyll: hakyll.hs
	ghc --make -Wall hakyll.hs -o hakyll

build: hakyll
	./hakyll build

server: build
	./hakyll preview -p 9000

publish: build
	cp -pr _site/* ~/doc/master-q.github.io/

lint: hakyll.hs
	hlint -c hakyll.hs

clean:
	-./hakyll clean
	rm -rf hakyll
	rm -rf *.hi *.o
	rm -rf *~

.PHONY: lint clean
