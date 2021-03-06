DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
LINK=$(HOME)/.emacs.d

.DEFAULT_GOAL:=install
.PHONY: build clean install uninstall default fetch-deps fetch-updates update

# WARNING: Only run the build target after launching emacs for the first time so
# that dependencies exist for the byte-compiler.
build:
	emacs --batch -L use-package -f batch-byte-compile init.el

clean:
	git reset --hard

install: update
	ln -s $(DIR) $(LINK)

uninstall:
	unlink $(LINK)

fetch-deps:
	wget http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
	unzip -ju -d markdown Markdown_1.0.1.zip ; rm Markdown_1.0.1.zip

fetch-updates:
	git pull --rebase --prune
	git submodule update --init --recursive

update: clean fetch-updates fetch-deps build
