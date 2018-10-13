OS ?= $(shell uname)
PROJECT_ROOT ?= $(shell pwd)

all: install

install: show-os dot-files dot-directories config-directories marks os-specific

clean: show-os clean-dot-files clean-dot-directories clean-config-directories clean-marks clean-os-specific

show-os: 
	@echo "Current OS is (${OS})"

project-root:
	@cd ${OS} && make project-root && cd ..

dot-files:
	@echo "(all) Installing Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh links_create.sh
	@echo "(all) Installing Dot Files Done!"

dot-directories:
	@echo "(all) Installing Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh links_create.sh
	@echo "(all) Installing Dot Directories Done!"

config-directories:
	@echo "(all) Installing .config Directories"	
	@SOURCE_DIR=${PWD}/all/config TARGET_DIR=${HOME}/.config FILE_LEADER="" sh links_create.sh
	@echo "(all) Installing .config Directories Done!"

marks:
	@echo "(all) Installing Marks"
	@SOURCE_DIR=${PWD}/all/marks TARGET_DIR=${HOME}/.marks FILE_LEADER="" sh install_marks.sh
	@echo "(all) Installing Marks Done!"

clean-dot-files:
	@echo "(all) Cleaning Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh links_remove.sh
	@echo "(all) Cleaning Dot Files Done!"

clean-dot-directories:
	@echo "(all) Cleaning Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh links_remove.sh
	@echo "(all) Cleaning Dot Directories Done!"

clean-config-directories:
	@echo "(all) Cleaning .config Directories"
	@SOURCE_DIR=${PWD}/all/config TARGET_DIR=${HOME}/.config FILE_LEADER="" sh links_remove.sh
	@echo "(all) Cleaning .config Directories Done!"

clean-marks:
	@rm -rf ${HOME}/.marks

os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@$(MAKE) -C $(shell uname) install
	@echo "(${OS}) Running OS Specific Install Steps Done!"

clean-os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@$(MAKE) -C $(shell uname) uninstall
	@echo "(${OS}) Running OS Specific Install Steps Done!"
