OS ?= $(shell uname,,)

all: install

install: install-homebrew install-fonts install-dot-files install-dot-directories install-vscode install-default-keybindings

install-homebrew:
	ifeq ($OS, "darwin")
		@echo "Installing Homebrew"
		@sh bin/install_homebrew.sh
		@echo "Installing Homebrew Done!"
	endif

install-fonts:
	@echo "Installing Fonts"
	@sh bin/install_fonts.sh
	@echo "Installing Fonts Done!"	

install-dot-files:
	@echo "Installing Dot Files"
	@sh bin/install_dot_files.sh
	@echo "Installing Dot Files Done!"

install-dot-directories:
	@echo "Installing Dot Directories"
	@sh bin/install_dot_directories.sh
	@echo "Installing Dot Directories Done!"

install-vscode:
	@echo "Installing VSCode Files"
	@sh bin/install_vscode.sh
	@echo "Installinv VSCode Files Done!"

install-default-keybindings:
	@echo "Installing Default Key Bindings"
	@sh bin/install_default_key_bindings.sh
	@echo "Installing Default Key Bindings Done!"
