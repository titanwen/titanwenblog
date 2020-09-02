# Makefile for blog

build:
	gitbook build
	cp -r _book docs

run:
	gitbook serve

clean:
	rm -rf ./docs ./_book
