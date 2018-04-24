
#
# Global Settings
#

INSTALL = install
COPY = cp -r

DESTDIR ?= /opt
PREFIX  ?= $(DESTDIR)/textemplate

PATH_EXEC = $(PREFIX)/textpl
PATH_TEMPLATES = $(PREFIX)/templates

EXEC_FILE = src/textpl.sh
TEMPLEATES_DIR = src/templates

#
# Targets
#

all:
	@echo "Nothing to do"

install:
	$(INSTALL) -d $(PATH_TEMPLATES)
	$(INSTALL) -m0755 $(EXEC_FILE) $(PATH_EXEC)
	$(INSTALL) -m0755 $(TEMPLEATES_DIR)/* $(PATH_TEMPLATES)

uninstall:
	rm -rf $(PREFIX)

.PHONY: all install uninstall