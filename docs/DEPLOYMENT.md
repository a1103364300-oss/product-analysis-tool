# Product Analysis Tool 部署与修复记录

**项目名称：** product-analysis-tool (商品多维度分析工具)  
**GitHub 仓库：** https://github.com/a1103364300-oss/product-analysis-tool  
**线上地址：** http://43.128.147.27:10875  
**最后更新：** 2026-01-31

---

## 📋 部署信息

### 服务器配置
| 项目 | 值 |
|------|-----|
| 云服务商 | 腾讯云 |
| 公网 IP | 43.128.147.27 |
| 系统 | Ubuntu 24.04 LTS |
| 用户名 | ubuntu |
| SSH 私钥 | ~/Downloads/clawdbot.pem |

### Docker 部署
| 项目 | 值 |
|------|-----|
| 容器名称 | product-analysis-tool |
| 镜像 | product-analysis-tool-product-analysis |
| 端口映射 | 10875:80 |
| 重启策略 | unless-stopped |
| 源码目录 | /root/product-analysis-tool |

### 连接命令
```bash
ssh -i ~/Downloads/clawdbot.pem ubuntu@43.128.147.27
```

---

## 🐛 Bug 修复记录

### 2026-01-31: xlsx is not defined

**问题描述：**
- 用户上传 Excel 文件时报错：`Uncaught ReferenceError: xlsx is not defined`
- 本地运行正常，部署到云端后出现问题

**根本原因：**
- index.html 中 JavaScript 库的引用路径错误
- 原路径：`libs/xlsx.full.min.js`
- 正确路径：`src/libs/xlsx.full.min.js`

**修复内容：**
```html
<!-- 修复前 -->
<script src="libs/xlsx.full.min.js"></script>
<script src="libs/chart.min.js"></script>

<!-- 修复后 -->
<script src="src/libs/xlsx.full.min.js"></script>
<script src="src/libs/chart.min.js"></script>
```

**修复步骤：**
1. 本地修改 index.html（第 897-898 行）
2. 提交并推送到 GitHub
3. 服务器拉取最新代码
4. 在 Docker 容器内直接修复（临时）
5. 重新构建 Docker 镜像（永久）

**Git 提交记录：**
```
1f53058 fix: 修复 xlsx 库路径错误导致的 'xlsx is not defined' 问题
```

---

## 🔧 运维命令参考

### 查看容器状态
```bash
sudo docker ps -a
```

### 查看容器日志
```bash
sudo docker logs product-analysis-tool
```

### 重新部署（使用 docker-compose）
```bash
cd /root/product-analysis-tool
sudo docker-compose down
sudo docker-compose up -d --build
```

### 手动重新构建
```bash
cd /root/product-analysis-tool
sudo docker build -t product-analysis-tool -f docker/Dockerfile .
sudo docker stop product-analysis-tool
sudo docker rm product-analysis-tool
sudo docker run -d --name product-analysis-tool -p 10875:80 --restart unless-stopped product-analysis-tool
```

### 更新代码
```bash
cd /root/product-analysis-tool
sudo git fetch origin
sudo git reset --hard origin/main
```

### 容器内直接修改（临时修复）
```bash
sudo docker exec product-analysis-tool sed -i 's|旧内容|新内容|g' /usr/share/nginx/html/index.html
```

---

## ⚠️ 已知问题

### AppArmor 权限问题
- **现象：** `cannot stop container: permission denied`
- **原因：** Ubuntu 的 AppArmor 安全模块阻止 Docker 操作
- **解决方案：** 重启服务器或重启 Docker 服务
  ```bash
  sudo systemctl restart docker
  # 或
  sudo reboot
  ```

---

## 📝 待优化项

1. **文件大小限制** - 添加上传文件大小检查（建议 50MB）
2. **上传进度提示** - 大文件上传时显示进度条
3. **列名容错** - 清理列名中的空格和特殊字符
4. **数值解析** - 支持千分位分隔符和货币符号

---

*文档由 Clawdbot AI Assistant 自动生成*
