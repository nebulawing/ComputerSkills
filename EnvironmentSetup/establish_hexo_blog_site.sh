#!/bin/sh -e

# 以下命令是创建一个博客站点的各个步骤，执行此脚本，减少命令的输入

# 检查参数数量是否正确
if [ $# -ne 1 ]; then
    echo "请提供你的博客名称"
    echo "使用方法: $0 <your_hexo_blog_name>"
    exit 1
fi

# 去除输入参数的首尾空格
hexo_blog_name=$(echo "$1" | xargs)

# 检查去除空格后是否为空
if [ -z "$hexo_blog_name" ]; then
    echo "错误：博客名称不能为空（或仅包含空格）"
    exit 1
fi

# 参数验证通过
echo "博客名称验证通过：$hexo_blog_name"

# 在用户当前运行此脚本的目录中新建博客目录
echo "当前目录: $PWD"

# 在本机电脑上创建博客站点
hexo init "$hexo_blog_name"

cd "$hexo_blog_name"

# 安装 hexo 依赖库
npm install

# 启动 hexo 服务
hexo server &
