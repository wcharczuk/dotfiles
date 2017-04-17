OS ?= Linux
PROJECT_ROOT ?= $(shell cd ${PWD} && pwd)
VSCODE_USER_DIR ?= ${HOME}/.config/Code/User
USER_FONT_DIR ?= /usr/share/fonts

install: install-dot-files install-dot-directories install-vscode install-fonts apt-install

project-root:
	@echo "(${OS}) Project Root ${PROJECT_ROOT}"

clean: clean-dot-files clean-dot-directories clean-vscode clean-fonts

install-dot-files:
	@echo "(${OS}) Installing Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "(${OS}) Installing Dot Files Done!"

install-dot-directories:
	@echo "(${OS}) Installing Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@echo "(${OS}) Installing Dot Directories Done!"

clean-dot-files:
	@echo "(${OS}) Cleaning Dot Files"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_files TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/remove_linked_files.sh
	@echo "(${OS}) Cleaning Dot Files Done!"

clean-dot-directories:
	@echo "(${OS}) Cleaning Dot Directories"
	@SOURCE_DIR=${PROJECT_ROOT}/${OS}/dot_directories TARGET_DIR=${HOME} FILE_LEADER="." sh ${PROJECT_ROOT}/bin/remove_linked_files.sh
	@echo "(${OS}) Cleaning Dot Directories Done!"

install-vscode:
	@echo "(${OS}) Installing VSCode Files"
	@mkdir -p ${VSCODE_USER_DIR}
	@if [ -e "${VSCODE_USER_DIR}/settings.json" ] || [ -L "${VSCODE_USER_DIR}/settings.json" ]; then rm ${VSCODE_USER_DIR}/settings.json; fi
	@ln -s ${PROJECT_ROOT}/all/config/vscode/settings.json ${VSCODE_USER_DIR}/settings.json
	@echo "(${OS}) Installing VSCode Files Done!"

clean-vscode:
	@echo "(${OS}) Cleaning VSCode Files"
	@mkdir -p ${VSCODE_USER_DIR}
	@if [ -e "${VSCODE_USER_DIR}/settings.json" ]; then rm ${VSCODE_USER_DIR}/settings.json; fi
	@echo "(${OS}) Cleaning VSCode Files Done!"

install-fonts:
	@echo "(${OS}) Installing Fonts"
	@sudo SOURCE_DIR=${PROJECT_ROOT}/all/assets/fonts TARGET_DIR=${USER_FONT_DIR} FILE_LEADER="" sh ${PROJECT_ROOT}/bin/link_all_files.sh
	@sudo fc-cache -f --verbose &> /dev/null
	@echo "(${OS}) Installing Fonts Done!"

clean-fonts:
	@echo "(${OS}) Installing Fonts"
	@if [ $(id -u) -neq 0 ]; then; echo "(${OS}) Cannot clean fonts unless root, aborting."; exit 0; fi
	@SOURCE_DIR=${PROJECT_ROOT}/all/assets/fonts TARGET_DIR=${USER_FONT_DIR} FILE_LEADER="" sh ${PROJECT_ROOT}/bin/remove_linked_files.sh
	@fc-cache -f --verbose &> /dev/null
	@echo "(${OS}) Installing Fonts Done!"

apt-install: 
	@echo "(${OS}) Installing apt packages"
	@sudo apt update
	@sudo apt upgrade
	@sudo apt install -y git vim wget curl

i3-install:
	@/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
	@sudo apt install ./keyring.deb
	@rm keyring.deb
	@sudo apt update
	@sudo apt install -y i3 rofi feh i3blocks i3status dmenu i3lock xbacklight conky

chrome-install:
	@wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	@sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	@sudo apt update
	@sudo apt install -y google-chrome-stable
