SRCDIR	?= /usr/share/verse-hadith
SUBDIRS	?= database/tr

build: $(SUBDIRS)
$(SUBDIRS):
	sh build/requirements.sh
	ln -f build/Makefile build/build.sh build/schema.sql $@
	$(MAKE) -C $@ build

install:
	mkdir -p $(SRCDIR)
	for dir in $(SUBDIRS) ; do $(MAKE) -C $$dir install SRCDIR=$(SRCDIR) ; done

uninstall:
	rm -rf $(SRCDIR)


.PHONY: build install $(SUBDIRS)