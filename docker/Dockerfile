# 基于Nginx Alpine镜像构建
FROM nginx:alpine

# 设置维护者信息
LABEL maintainer="Your Name <your.email@example.com>"
LABEL description="商品多维度分析工具 - Docker镜像"

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制项目文件到容器
COPY . .

# 复制Nginx配置文件
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80

# 启动命令
CMD ["nginx", "-g", "daemon off;"]
