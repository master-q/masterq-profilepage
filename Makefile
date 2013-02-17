all: build

hakyll: hakyll.hs
	ghc --make -Wall hakyll.hs -o hakyll

build: hakyll
	./hakyll build

server: build
	./hakyll server

publish: build
	ssh sakura.masterq.net rm -rf ~/vhosts/_site
	scp -pr _site sakura.masterq.net:~/vhosts/
	ssh sakura.masterq.net rm -rf ~/vhosts/profilepage
	ssh sakura.masterq.net mv ~/vhosts/_site ~/vhosts/profilepage

lint: hakyll.hs
	hlint -c hakyll.hs

clean:
	-./hakyll clean
	rm -rf hakyll
	rm -rf *.hi *.o
	rm -rf *~

.PHONY: lint clean
