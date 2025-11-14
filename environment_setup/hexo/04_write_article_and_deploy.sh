#!/bin/sh

# 首先进入到你的 hexo blog 根目录，然后再开始以下操作


# 新建 markdown 文档
hexo new <your_article_title> # hexo new my_first_article

# 发布，可以参考这里：https://hexo.io/zh-cn/docs/one-command-deployment
# 不过在这之前，你需要在你的blog根目录中的 _config.yml 配置好发布站点
hexo generate --deploy

