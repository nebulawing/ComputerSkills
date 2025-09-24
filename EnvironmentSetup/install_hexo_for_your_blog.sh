#!/bin/sh -e

# 如果你不想使用命令安装，也可以去到官网下载安装包进行安装: https://nodejs.org/zh-cn/download/current
#

# 安装 nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 安装最新 LTS 版本
nvm install --lts

node -v
npm -v

# 安装 hexo,　也可以直接参考官网：https://hexo.io/zh-cn/docs/
npm install hexo-cli -g

#　更新 hexo
npm update hexo hexo-cli -g