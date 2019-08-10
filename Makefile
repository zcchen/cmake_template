BUILD_DIR   = build

pwd         = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
MAKEFLAGS  += --no-print-directory

all: $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake $(pwd) && make

clean: $(BUILD_DIR)
	cd $(BUILD_DIR) && make clean

cleanall:
	-rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $@
