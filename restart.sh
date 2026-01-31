#!/bin/sh

# 设置变量
PROJECT_DIR= $ (cd " $ (dirname " $ 0")" && pwd)
CONTAINER_NAME="product-analysis-tool"
IMAGE_NAME="product-analysis-tool-product-analysis"
PORT_HOST=10875
PORT_CONTAINER=80

echo "🔄 正在更新并重启  $ CONTAINER_NAME..."

# 1. 拉取最新代码
echo "📥 拉取最新代码..."
cd " $ PROJECT_DIR"
git pull origin main || git pull origin master

# 2. 停止并删除旧容器
echo "⏹️  停止旧容器..."
if docker ps -a --format '{{.Names}}' | grep -q "^ $ {CONTAINER_NAME} $ "; then
    docker stop " $ CONTAINER_NAME" >/dev/null 2>&1
    docker rm " $ CONTAINER_NAME" >/dev/null 2>&1
    echo "✅ 旧容器已移除"
else
    echo "⚠️  容器  $ CONTAINER_NAME 不存在，跳过删除"
fi

# 3. 重新构建镜像
echo "📦 重新构建 Docker 镜像..."
docker build -t " $ IMAGE_NAME" .

# 4. 启动新容器
echo "🚀 启动新容器（端口  $ PORT_HOST →  $ PORT_CONTAINER）..."
docker run -d \
  --name " $ CONTAINER_NAME" \
  -p " $ PORT_HOST: $ PORT_CONTAINER" \
  " $ IMAGE_NAME"

echo "✅ 服务已重启！访问地址：http://localhost: $ PORT_HOST"

# 5. 显示最近日志
echo "📄 最近 10 行日志："
docker logs --tail 10 " $ CONTAINER_NAME"
