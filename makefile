DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
LINK=$(HOME)/.emacs.d

.PHONY: install uninstall default

install:
	ln -s $(DIR) $(LINK)

uninstall: $(LINK)
	rm $(LINK)

default: install
