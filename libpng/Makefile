
include ../Makefile.inc
UPSTREAM=https://sourceforge.net/projects/libpng/files/libpng16/1.6.21/libpng-1.6.21.tar.gz/download
TARBALL=$(notdir $(UPSTREAM))

all: bin/libpng

bin/libpng: build/objs/libpng

build/objs/libpng: build/Makefile
    $(MAKE) -C build
    $(MAKE) install -C build

libpng_CONF_OPTS += \
    --with-gnu-ld \
    --prefix=$(RUMPRUN_PKGS_DIR) \
    --disable-shared

build/Makefile: build/configure
    (cd build; \
    ./configure --host=$(RUMPRUN_TOOLCHAIN_TUPLE) $(libpng_CONF_OPTS);)

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
