DESTDIR = 
PREFIX = /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man
CONFDIR = /etc
CACHE_DIR = /var/cache/upkg
PORT_DIR = /usr/ports

OBJECTS = null

OBJECTS_DIST = upkg-add upkg-build conf/upkg.conf

MANPAGES = null

all: upkg-build upkg-add upkg.conf

clean:
	rm -f .depend
	rm -f $(OBJECTS)
	rm -f $(MANPAGES)
	rm -f $(MANPAGES:=.txt)

distclean: clean
	rm -f $(OBJECTS_DIST)

upkg-add: upkg-add.in
	cp upkg-add.in upkg-add

upkg-build: upkg-build.in
	cp upkg-build.in upkg-build

upkg.conf: conf/upkg.conf.in
	cp conf/upkg.conf.in conf/upkg.conf

install: all
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(CONFDIR)
	install -d $(DESTDIR)$(PORT_DIR)
	install -d $(DESTDIR)$(CACHE_DIR)/{packages,sources,log,work}
	install -D -m755 upkg-build $(DESTDIR)$(BINDIR)/upkg-build
	install -D -m755 upkg-add $(DESTDIR)$(BINDIR)/upkg-add
	install -D -m644 conf/upkg.conf $(DESTDIR)$(CONFDIR)/upkg.conf
