#!/bin/sh

# 使用反引号 ` ` 来执行命令，并且赋值时等号后不能有空格
PROJECT_DIR=`cd "\`dirname " $ 0"\`" && pwd`
CONTAINER_NAME="product-analysis-tool"
IMAGE_NAME="product-analysis-tool-product-analysis"
PORT_HOST=10875
PORT_CONTAINER=80

echo "🔄 正在更新并重启  $ CONTAINER_NAME..."

# 1. 进入项目目录
cd  $ PROJECT_DIR

# 2. 停止并删除旧容器（如果存在）
docker stop  $ CONTAINER_NAME > /dev/null 2>&1
docker rm  $ CONTAINER_NAME > /dev/null 2>&1

# 3. 拉取最新代码
echo "📥 正在拉取最新代码..."
git pull origin main

# 4. 重新构建并运行（这里假设你需要映射端口 80）
echo "🚀 正在启动新容器..."
docker run -d --name  $ CONTAINER_NAME -p  $ PORT_HOST: $ PORT_CONTAINER  $ IMAGE_NAME

echo "✅ 部署完成！"
