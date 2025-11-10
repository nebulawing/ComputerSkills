#!/bin/sh -e

# 如果你不想使用命令安装，也可以去到官网下载安装包进行安装: 
# https://nodejs.org/zh-cn/download

echo "setup hexo..."

# 下载并安装 nvm：
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# 代替重启 shell
\. "$HOME/.nvm/nvm.sh"

# 下载并安装 Node.js：
nvm install --lts

# 验证 Node.js 版本：
node -v

# 验证 npm 版本：
npm -v

echo "install hexo..."

# 安装 hexo,　也可以直接参考官网：https://hexo.io/zh-cn/docs/
npm install hexo-cli -g

hexo -v

echo "Congratulations, hexo setup all done."
