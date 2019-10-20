BUILD_DIR   = build

pwd         = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
MAKEFLAGS  += --no-print-directory

all: $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(pwd) && make VERBOSE=2

install: ${BUILD_DIR} all
	cd $(BUILD_DIR) && make $@

clean: $(BUILD_DIR)
	cd $(BUILD_DIR) && make $@

cleanall:
	-rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $@
