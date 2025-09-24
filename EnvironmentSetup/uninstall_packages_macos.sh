#!/bin/sh

# macos 卸载 brew　安装的第三方库

# 列出 brew　在本机中已安装的库
brew list

# uninstall Hexo
npm uninstall hexo-cli -g

# uninstall Node.js, npm
brew uninstall node

sudo rm -rf $(which npm)
sudo rm -rf $(which node)

# 执行以下命令，若均提示 "command not found" 则表示卸载成功
node -v
npm -v

# uninstall Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"