OS ?= Darwin
PROJECT_ROOT ?= $(shell cd ${PWD} && pwd)
KEYBINDINGS_DIR ?= ${HOME}/Library/KeyBindings
VSCODE_USER_DIR ?= "${HOME}/Library/Application Support/Code/User"

install: project-root install-default-keybindings install-fonts install-dot-files install-dot-directories install-config-directories

uninstall: clean-dot-files clean-dot-directories clean-default-keybindings

project-root:
	@echo "(${OS}) Project Root ${PROJECT_ROOT}"

install-homebrew:
	@echo "(${OS}) Installing Homebrew"
	@if [ -z "$(shell which brew)" ]; then ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@echo "(${OS}) Installing Homebrew Done!"

install-fonts:
	@echo "(${OS}) Installing Fonts"
	@SOURCE_DIR="${PROJECT_ROOT}/all/assets/fonts" TARGET_DIR="/Library/Fonts" FILE_LEADER="" sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Fonts Done!"	

install-default-keybindings:
	@echo "(${OS}) Installing Default Key Bindings"
	@if [ -e "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict" ] || [ -L "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict" ]; then rm "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict"; fi
	@mkdir -p ${KEYBINDINGS_DIR}
	@ln -s "${PROJECT_ROOT}/${OS}/assets/DefaultKeyBinding.dict" "${KEYBINDINGS_DIR}/DefaultKeyBinding.dict"
	@echo "(${OS}) Installing Default Key Bindings Done!"

install-dot-files:
	@echo "(${OS}) Installing Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Dot Files Done!"

install-dot-directories:
	@echo "(${OS}) Installing Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Dot Directories Done!"

install-config-directories:
	@echo "(${OS}) Installing Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/config TARGET_DIR=${HOME}/.config FILE_LEADER="." sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Dot Directories Done!"

clean-dot-files:
	@echo "(${OS}) Cleaning Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning Dot Files Done!"

clean-dot-directories:
	@echo "(${OS}) Cleaning Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning Dot Directories Done!"

clean-config-directories:
	@echo "(${OS}) Cleaning Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/config TARGET_DIR=${HOME}/.config FILE_LEADER="." sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning Dot Directories Done!"

clean-default-keybindings:
	@rm -f ${KEYBINDINGS_DIR}/DefaultKeyBinding.dict
