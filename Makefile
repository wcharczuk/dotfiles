OS ?= $(shell uname)
PROJECT_ROOT ?= $(shell pwd)

all: install

test: 
	@docker build -f Dockerfile.test -t dotfiles/test:latest .
	@docker run -it dotfiles/test:latest

verify:
	@echo "OK!"

install: show-os bin-scripts dot-files dot-directories config-directories os-specific

clean: show-os clean-bin-scripts clean-dot-files clean-dot-directories clean-config-directories clean-os-specific

show-os: 
	@echo "Current OS is (${OS})"

project-root:
	@cd ${OS} && make project-root && cd ..

bin-scripts:
	@echo "(all) Installing Bin Scripts"
	@SOURCE_DIR=${PWD}/all/bin TARGET_DIR=${HOME}/bin sh links_create.sh
	@echo "(all) Installing Bin Scripts Done!"

dot-files:
	@echo "(all) Installing Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} TARGET_LEADER="." sh links_create.sh
	@echo "(all) Installing Dot Files Done!"

dot-directories:
	@echo "(all) Installing Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} TARGET_LEADER="." sh links_create.sh
	@echo "(all) Installing Dot Directories Done!"

config-directories:
	@echo "(all) Installing .config Directories"	
	@SOURCE_DIR=${PWD}/all/config TARGET_DIR=${HOME}/.config sh links_create.sh
	@echo "(all) Installing .config Directories Done!"

clean-dot-bin:
	@echo "(all) Cleaning Bin"
	@SOURCE_DIR=${PWD}/all/bin TARGET_DIR=${HOME}/bin sh links_remove.sh
	@echo "(all) Cleaning Bin Done!"

clean-dot-files:
	@echo "(all) Cleaning Dot Files"
	@SOURCE_DIR=${PWD}/all/dot_files TARGET_DIR=${HOME} TARGET_LEADER="." sh links_remove.sh
	@echo "(all) Cleaning Dot Files Done!"

clean-dot-directories:
	@echo "(all) Cleaning Dot Directories"
	@SOURCE_DIR=${PWD}/all/dot_directories TARGET_DIR=${HOME} TARGET_LEADER="." sh links_remove.sh
	@echo "(all) Cleaning Dot Directories Done!"

clean-config-directories:
	@echo "(all) Cleaning .config Directories"
	@SOURCE_DIR=${PWD}/all/config TARGET_DIR=${HOME}/.config sh links_remove.sh
	@echo "(all) Cleaning .config Directories Done!"

os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@$(MAKE) -C $(shell uname) install
	@echo "(${OS}) Running OS Specific Install Steps Done!"

clean-os-specific:
	@echo "(${OS}) Running OS Specific Install Steps"
	@$(MAKE) -C $(shell uname) uninstall
	@echo "(${OS}) Running OS Specific Install Steps Done!"
