#
# rumprun-packages "configuration"
#

# Set the language specific configuration options for libxml2 
PHP5_CONFIGURE_OPTS := --with-libxml-dir=$(RUMPRUN_PKGS_DIR)
