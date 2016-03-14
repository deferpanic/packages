
include ../Makefile.inc
UPSTREAM=https://github.com/libgd/libgd/releases/download/gd-2.1.1/libgd-2.1.1.tar.gz
TARBALL=$(notdir $(UPSTREAM))

all: bin/libgd

bin/libgd: build/objs/libgd

build/objs/libgd: build/Makefile
	$(MAKE) -C build
	$(MAKE) install -C build

libgd_CONF_OPTS += \
	--with-gnu-ld \
	--prefix=$(RUMPRUN_PKGS_DIR) \
	--disable-shared

build/Makefile: build/configure
	(cd build; \
	./configure --host=$(RUMPRUN_TOOLCHAIN_TUPLE) $(libgd_CONF_OPTS);)

dl/$(TARBALL):
	mkdir -p dl
	../scripts/fetch.sh ${UPSTREAM} dl/$(TARBALL)

build/configure: | dl/$(TARBALL)
	mkdir -p build
	(cd build && tar -zx --strip-components 1 -f ../dl/$(TARBALL))

.PHONY: clean
clean:
	-$(MAKE) -C build clean
        
.PHONY: distclean
distclean: clean
	rm -rf build
