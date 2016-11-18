OS ?= Darwin
PROJECT_ROOT ?= $(shell cd ${PWD}/.. && pwd)
KEYBINDINGS_DIR ?= ${HOME}/Library/KeyBindings
VSCODE_USER_DIR ?= ${HOME}/Library/Application\ Support/Code/User

install: project-root install-homebrew install-default-keybindings install-fonts install-dot-files install-dot-directories install-vscode 

project-root:
	@echo "(${OS}) Project Root ${PROJECT_ROOT}"

install-homebrew:
	@echo "(${OS}) Installing Homebrew"
	@if [ -z "$(shell which brew)" ]; then ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@echo "(${OS}) Installing Homebrew Done!"

install-fonts:
	@echo "(${OS}) Installing Fonts"
	@SOURCE_DIR="${PROJECT_ROOT}/all/assets/fonts" TARGET_DIR="/Library/Fonts" FILE_LEADER="" sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "(${OS}) Installing Fonts Done!"	

install-default-keybindings:
	@echo "(${OS}) Installing Default Key Bindings"
	@if [ -z $(stat ${KEYBINDINGS_DIR}/DefaultKeyBinding.dict) ]; then rm "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict"; fi
	@mkdir -p ${KEYBINDINGS_DIR}
	@ln -s "${PROJECT_ROOT}/${OS}/config/DefaultKeyBinding.dict" "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict"
	@echo "(${OS}) Installing Default Key Bindings Done!"

install-vscode:
	@echo "(${OS}) Installing VSCode Files"
	@mkdir -p ${VSCODE_USER_DIR}
	@if [ -z $(stat ${VSCODE_USER_DIR}/settings.json) ]; then rm ${VSCODE_USER_DIR}/settings.json; fi
	@ln -s ${PROJECT_ROOT}/all/config/vscode/settings.json ${VSCODE_USER_DIR}/settings.json
	@echo "(${OS}) Installing VSCode Files Done!"

install-dot-files:
	@echo "(${OS}) Installing Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "(${OS}) Installing Dot Files Done!"

install-dot-directories:
	@echo "(${OS}) Installing Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "(${OS}) Installing Dot Directories Done!"
