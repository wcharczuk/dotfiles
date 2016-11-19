OS ?= Linux
PROJECT_ROOT ?= $(shell cd ${PWD}/.. && pwd)
VSCODE_USER_DIR ?= ${HOME}/.config/Code/User

install: project-root install-dot-files install-dot-directories install-vscode

project-root:
	@echo "(${OS}) Project Root ${PROJECT_ROOT}"

install-dot-files:
	@echo "Installing ${OS} Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "Installing ${OS} Dot Files Done!"

install-dot-directories:
	@echo "Installing ${OS} Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "Installing ${OS} Dot Directories Done!"

install-vscode:
	@echo "(${OS}) Installing VSCode Files"
	@mkdir -p ${VSCODE_USER_DIR}
	@if [ -e "${VSCODE_USER_DIR}/settings.json" ]; then rm ${VSCODE_USER_DIR}/settings.json; fi
	@ln -s ${PROJECT_ROOT}/all/config/vscode/settings.json ${VSCODE_USER_DIR}/settings.json
	@echo "(${OS}) Installing VSCode Files Done!"