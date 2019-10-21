BUILD_DIR   = build

pwd         = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
MAKEFLAGS  += --no-print-directory

all: $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(pwd) && make

install: ${BUILD_DIR}
	cd $(BUILD_DIR) && make $@

test: $(BUILD_DIR)
	cd $(BUILD_DIR) && make $@

memcheck: $(BUILD_DIR)
	cd $(BUILD_DIR) && ctest -D ExperimentalMemCheck

clean: $(BUILD_DIR)
	cd $(BUILD_DIR) && make $@

cleanall:
	-rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $@
