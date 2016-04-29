include ../Makefile.inc

UPSTREAM=http://de1.php.net/get/php-5.6.18.tar.bz2/from/this/mirror
TARBALL=php.tar.bz2

# Fileinfo, iconv and opcache are disabled for now (patches needed).
all: CONFIGURE_OPTS := --with-openssl=$(RUMPRUN_SYSROOT) \
        --with-zlib=$(RUMPRUN_SYSROOT) \
        --with-mysql --with-pdo-mysql \
        --disable-fileinfo --disable-opcache --without-iconv \
        --disable-libxml --disable-dom --disable-simplexml --disable-xml --disable-xmlreader --disable-xmlwriter --without-pear

all: bin/php

# "Minimal" build.
minimal: CONFIGURE_OPTS := --disable-all --enable-cli

minimal: bin/php

bin/php: build/sapi/cli/php
	mkdir -p bin
	cp $< $@

build/sapi/cgi/php-cgi: build/Makefile
	$(MAKE) -C build sapi/cgi/php-cgi

build/sapi/cli/php: build/Makefile build/sapi/cgi/php-cgi
	$(MAKE) -C build sapi/cli/php

build/Makefile: build/configure
	(cd build && ./configure --host=$(RUMPRUN_TOOLCHAIN_TUPLE) \
	    --disable-shared $(CONFIGURE_OPTS))

dl/$(TARBALL):
	mkdir -p dl
	../scripts/fetch.sh ${UPSTREAM} dl/$(TARBALL)

build/configure: | dl/$(TARBALL)
	mkdir -p build
	(cd build && tar -xj --strip-components 1 -f ../dl/$(TARBALL))

.PHONY: clean
clean:
	-$(MAKE) -C build clean
	rm -f bin/*

.PHONY: distclean
distclean: clean
	rm -rf build/
	rm -r dl/
