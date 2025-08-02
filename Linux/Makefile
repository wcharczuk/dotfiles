OS ?= Linux
PROJECT_ROOT ?= $(shell cd ${PWD} && pwd)
VSCODE_USER_DIR ?= ${HOME}/.config/Code/User
USER_FONT_DIR ?= /usr/share/fonts

install: install-dot-files install-dot-directories install-config-directories

uninstall: clean-dot-files clean-dot-directories clean-config-directories

project-root:
	@echo "(${OS}) Project Root ${PROJECT_ROOT}"

install-dot-files:
	@echo "(${OS}) Installing Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} TARGET_LEADER="." sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Dot Files Done!"

install-dot-directories:
	@echo "(${OS}) Installing Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_directories TARGET_DIR=${HOME} TARGET_LEADER="." sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing Dot Directories Done!"

install-config-directories:
	@echo "(${OS}) Installing .config Directories"
	@mkdir -p ${HOME}/.config
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/config TARGET_DIR=${HOME}/.config sh ${PROJECT_ROOT}/links_create.sh
	@echo "(${OS}) Installing .config Directories Done!"	

clean-dot-files:
	@echo "(${OS}) Cleaning Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} TARGET_LEADER="." sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning Dot Files Done!"

clean-dot-directories:
	@echo "(${OS}) Cleaning Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_directories TARGET_DIR=${HOME} TARGET_LEADER="." sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning Dot Directories Done!"

clean-config-directories:
	@echo "(${OS}) Cleaning .config Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/config TARGET_DIR=${HOME}/.config sh ${PROJECT_ROOT}/links_remove.sh
	@echo "(${OS}) Cleaning .config Directories Done!"	

################################################################################
# app installation
################################################################################

apt-install:
	@echo "(${OS}) Installing apt packages"
	@sudo apt update
	@sudo apt upgrade -y
	@sudo apt install -y vim wget curl software-properties-common zsh
	@sudo apt install -y i3 rofi feh i3blocks i3status dmenu i3lock xbacklight conky
	@sudo apt install -y terminator

install-chrome:
	@wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	@sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	@sudo apt update
	@sudo apt install -y google-chrome-stable

install-vscode:
	@curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	@sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	@sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	@sudo apt update
	@sudo apt install -y code

install-docker:
	@sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	@sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
	@sudo apt-get update
	@sudo apt-cache policy docker-engine
	@sudo apt-get install -y docker-engine
