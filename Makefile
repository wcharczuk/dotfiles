OS ?= $(shell uname)

all: install

install: show-os install-common-dot-files install-common-dot-directories install-os-specific

show-os: 
	@echo "Current OS is (${OS})"

project-root:
	@cd ${OS} && make project-root && cd ..

install-common-dot-files:
	@echo "(all) Installing Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh bin/link_all_files.sh
	@echo "(all) Installing Dot Files Done!"

install-common-dot-directories:
	@echo "(all) Installing Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh bin/link_all_files.sh
	@echo "(all) Installing Dot Directories Done!"

install-os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@cd ${OS} && make install && cd ..