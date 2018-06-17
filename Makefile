
#
# Global Settings
#

INSTALL = install
COPY = cp -r

DESTDIR ?= /opt
PREFIX  ?= $(DESTDIR)/scripts

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
	$(INSTALL) -m0755 $(TEMPLEATES_DIR)/*.sh $(PATH_TEMPLATES)
	$(COPY) $(TEMPLEATES_DIR)/*_extra $(PATH_TEMPLATES)

uninstall:
	rm -rf $(PATH_TEMPLATES)
	rm -rf $(PATH_EXEC)

.PHONY: all install uninstall
