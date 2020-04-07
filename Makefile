DESTDIR =
PREFIX = /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man
CONFDIR = /etc
CACHE_DIR = /var/cache/upkg
PORT_DIR = /usr/ports

all: upkg-build upkg-add

upkg-add: upkg-add

upkg-build: pkgmk.in

upkg.conf: conf/upkg.conf.in

install: all
	mkdir -pv $(DESTDIR)$(BINDIR)
	mkdir -pv $(DESTDIR)$(CONFDIR)
	mkdir -pv $(DESTDIR)$(PORT_DIR)
	mkdir -pv $(DESTDIR)$(CACHE_DIR)/sources
	mkdir -pv $(DESTDIR)$(CACHE_DIR)/packages
	mkdir -pv $(DESTDIR)$(CACHE_DIR)/log
	mkdir -pv $(DESTDIR)$(CACHE_DIR)/work
	install -m755 upkg-build $(DESTDIR)$(BINDIR)
  install -m755 upkg-add $(DESTDIR)$(BINDIR) 
	install -m644 conf/upkg.conf $(DESTDIR)$(CONFDIR)
	install -dm777 $(DESTDIR)$(CACHE_DIR)/{packages,sources,log,work}
