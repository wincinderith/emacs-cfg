DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
LINK=$(HOME)/.emacs.d

install:
	ln -s $(DIR) $(LINK)

uninstall: $(LINK)
	rm $(LINK)
