#!/bin/sh

# 检查参数数量是否正确
if [ $# -ne 2 ]; then
    echo "请提供两个参数: 用户名(Git提交记录中显示的名称) 和 你的邮箱"
    echo "使用方法: $0 <username> <email>"
    exit 1
fi

# 从参数获取用户名和邮箱
USER_NAME="$1"
MY_EMAIL="$2"

cd ~
USER_HOME_DIR="$PWD"
PROFILE_PATH="$USER_HOME_DIR/.profile"

function setupSSHKey() {

	echo "\n####################"
	echo "Generate ssh key ......"

	SSH_DIR="$USER_HOME_DIR/.ssh"
	SSH_CONFIG_PATH="$SSH_DIR/config"

	if [ -f "$SSH_DIR/id_rsa" ]; then
		echo "$SSH_DIR/id_rsa already exists, so skips generating ssh key"
		return
	fi

	# Generate ssh key, and add it to ssh agent
	ssh-keygen -t rsa -C "$MY_EMAIL"
	ssh-add ~/.ssh/id_rsa

	# Let ssh key loaded automatically: add identity file to ~/.ssh/config
	if [ ! -f "$SSH_CONFIG_PATH" ]; then
		touch "$SSH_CONFIG_PATH"
  	echo "Host *\nAddKeysToAgent yes\nUseKeychain yes" > $SSH_CONFIG_PATH
	fi

    # Append text to the end of file.
	echo "IdentityFile ~/.ssh/id_rsa" >> $SSH_CONFIG_PATH

	echo "SSH key done."
}

function setupGit() {

	echo "Configurate git ....."

	git config --global user.name "$USER_NAME"
	git config --global user.email "$MY_EMAIL"
	git config --global color.ui true

	# 关闭 Git 对非 ASCII 字符的转义（解决中文文件名显示为类似 \344\275\240\345\245\275 的问题）
	git config --global core.quotepath false

	# 给常用命令设置别名，高效输入
	sudo git config --system alias.st status
	sudo git config --system alias.ci commit
	sudo git config --system alias.co checkout
	sudo git config --system alias.br branch
	sudo git config --system alias.cp cherry-pick

	# Git command completion
	curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	cp git-completion.bash ~/.git-completion.bash
	rm git-completion.bash

	if [ ! -f "$PROFILE_PATH" ]; then
		touch "$PROFILE_PATH"
	fi

	echo "source ~/.git-completion.bash" > $PROFILE_PATH
	echo "Git config done.\n"
}

function startAutoSetup() {
	echo "Automatical setup starts, it will cost you some time, just leave it doing tasks. Maybe some operations need you enter user account password."
	
	setupSSHKey
	setupGit

	echo "All setups done."
}

startAutoSetup