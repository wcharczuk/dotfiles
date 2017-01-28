OS ?= $(shell uname)
PROJECT_ROOT ?= $(shell pwd)

all: install

install: show-os install-common-dot-files install-common-dot-directories install-os-specific

clean: show-os clean-common-dot-files clean-common-dot-directories

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

clean-common-dot-files:
	@echo "(all) Cleaning Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh bin/remove_linked_files.sh
	@echo "(all) Cleaning Dot Files Done!"

clean-common-dot-directories:
	@echo "(all) Cleaning Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh bin/remove_linked_files.sh
	@echo "(all) Cleaning Dot Directories Done!"

install-os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@$(MAKE) -C $(shell uname) install
	@echo "(${OS}) Running OS Specific Install Steps Done!"
