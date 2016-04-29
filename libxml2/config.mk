#
# rumprun-packages "configuration"
#

# Set the language specific configuration options for libxml2 
PHP5_ENABLE_CONFIGURE_OPTS := --with-libxml-dir=$(RUMPRUN_PKGS_DIR)
PHP5_DISABLE_CONFIGURE_OPTS := --disable-libxml --disable-dom --disable-simplexml --disable-xml --disable-xmlreader --disable-xmlwriter --without-pear
