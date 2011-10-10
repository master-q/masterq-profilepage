all: build

hakyll: hakyll.hs
	ghc --make -Wall hakyll.hs -o hakyll

build: hakyll
	./hakyll build

server: build
	./hakyll server

publish: build
	rm -rf ../website/*
	cp -pr _site/* ../website/
	cp dot.htaccess.index_noauth ../website/.htaccess
	cp dot.htaccess.index_noauth ../website/books/.htaccess
	cp dot.htaccess.index_noauth ../website/css/.htaccess
	cp dot.htaccess.index_noauth ../website/images/.htaccess
	cp dot.htaccess              ../website/owner/c80/.htaccess 


lint: hakyll.hs
	hlint -c hakyll.hs

clean:
	-./hakyll clean
	rm -rf hakyll
	rm -rf *.hi *.o
	rm -rf *~

.PHONY: lint clean
