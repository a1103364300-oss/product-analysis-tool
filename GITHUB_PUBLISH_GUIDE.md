# GitHub 发布指南

本指南将帮助您将商品多维度分析工具发布到GitHub。由于发布过程需要您的GitHub账户认证，以下提供两种方式完成发布。

## 📋 发布前准备

### 方式一：使用自动化脚本（推荐）

我们已经为您准备了自动化发布脚本：

```bash
# 进入项目目录
cd /Users/macos/Downloads/product-analysis-tool

# 运行发布脚本
./scripts/publish-to-github.sh
```

脚本会自动引导您完成以下步骤：
1. 输入GitHub用户名
2. 设置仓库名称（默认为product-analysis-tool）
3. 选择协议类型（HTTPS或SSH）
4. 添加远程仓库并推送

### 方式二：手动发布

如果自动化脚本出现问题，请按以下步骤手动操作：

#### 步骤1：创建GitHub仓库

1. 打开浏览器，访问 https://github.com/new
2. 登录您的GitHub账户
3. 填写仓库信息：
   - **Repository name**: `product-analysis-tool`
   - **Description**: 商品多维度分析工具 - 一个专业的商品销售数据分析工具
   - **Visibility**: Public（公开）或 Private（私有）
   - **Initialize this repository with**: 不勾选任何选项
4. 点击"Create repository"按钮

#### 步骤2：添加远程仓库并推送

在终端中执行以下命令：

```bash
# 进入项目目录
cd /Users/macos/Downloads/product-analysis-tool

# 添加远程仓库（将YOUR_USERNAME替换为您的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/product-analysis-tool.git

# 推送到GitHub（首次推送需要设置上游分支）
git push -u origin main
```

#### 步骤3：输入认证信息

首次推送时，Git会要求您认证：

**使用HTTPS方式**：
- 如果使用密码认证，需要输入GitHub密码（但GitHub已不再支持密码认证）
- **解决方案**：使用Personal Access Token (PAT)替代密码
  1. 访问 https://github.com/settings/tokens
  2. 点击"Generate new token (classic)"
  3. 设置Token名称，选择 scopes: `repo`
  4. 点击"Generate token"
  5. **保存好Token字符串**，这是您唯一的认证凭证
  6. 在推送时，使用Token作为密码输入

**使用SSH方式**：
- 需要先配置SSH密钥对
- 参考：https://docs.github.com/en/authentication/connecting-to-github-with-ssh

## 🔧 GitHub仓库配置

发布成功后，建议进行以下配置：

### 1. 添加主题标签

在仓库主页，点击右侧"Topics"，添加以下标签：
- analytics
- business-intelligence
- data-visualization
- chart
- visualization
- data-analysis
- excel
- chinese

### 2. 配置仓库信息

编辑README文件中的链接和联系方式：
- 将`https://github.com/yourusername/product-analysis-tool`替换为实际仓库URL
- 更新维护者信息

### 3. 启用GitHub Pages（可选）

如果希望在线展示工具：
1. 进入仓库 Settings -> Pages
2. Source 选择 "main" 分支
3. 点击 Save
4. 访问生成的URL（通常需要几分钟生效）

### 4. 创建Release版本

1. 进入仓库 -> Releases
2. 点击"Draft a new release"
3. Tag version: `v2.0.0`
4. Release title: `v2.0.0 - 初始发布`
5. 描述新版本特性
6. 点击"Publish release"

## 📁 项目结构确认

您的项目应该包含以下文件和目录：

```
product-analysis-tool/
├── .dockerignore              # Docker构建忽略规则
├── .gitignore                 # Git忽略规则
├── CONTRIBUTING.md            # 贡献指南
├── LICENSE                    # MIT开源许可证
├── README.md                  # 项目说明文档
├── docker-compose.yml         # Docker Compose配置
├── docker/
│   ├── Dockerfile             # Docker镜像构建文件
│   └── nginx.conf             # Nginx服务器配置
├── docs/
│   └── CHANGELOG.md           # 更新日志
├── examples/
│   └── sample-data.xlsx       # 示例数据文件
├── index.html                 # 主应用文件（整合后）
├── scripts/
│   └── publish-to-github.sh   # GitHub发布脚本
└── src/
    └── libs/
        ├── chart.min.js       # Chart.js图表库
        └── xlsx.full.min.js   # SheetJS Excel处理库
```

## 🚀 后续步骤

### 立即可做

1. **测试本地功能**
   ```bash
   # 在浏览器中打开
   open /Users/macos/Downloads/product-analysis-tool/index.html
   ```

2. **测试Docker部署**
   ```bash
   cd /Users/macos/Downloads/product-analysis-tool
   docker-compose up -d
   # 访问 http://localhost:8080
   ```

3. **发布到GitHub**（按照上方指南操作）

### 长期维护

1. **定期更新**：添加新功能或修复问题时，更新版本号和CHANGELOG
2. **社区互动**：回复Issue，参与讨论
3. **监控Star增长**：了解项目受欢迎程度

## ❓ 常见问题

### 问题1：推送时提示"Authentication failed"

**原因**：GitHub已不再支持密码认证

**解决方案**：
1. 使用Personal Access Token作为密码
2. 或配置SSH密钥认证

详细步骤参考：https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

### 问题2：文件过大，推送失败

**原因**：库文件（chart.min.js和xlsx.full.min.js）较大

**解决方案**：
- GitHub单文件限制100MB，通常不会出现问题
- 如果遇到，可以考虑使用Git LFS：
  ```bash
  git lfs install
  git lfs track "src/libs/*"
  git add .gitattributes
  git add src/libs/*
  git commit -m "Add LFS tracking for large files"
  git push origin main
  ```

### 问题3：如何更新已发布的项目

```bash
# 修改代码后
git add .
git commit -m "描述您的更改"
git push origin main
```

### 问题4：如何贡献自己的代码

如果是他人的项目想要贡献：
1. Fork项目到您的GitHub
2. 克隆您的Fork副本
3. 创建功能分支
4. 修改代码
5. 提交并推送
6. 创建Pull Request

## 📞 获取帮助

如果在发布过程中遇到问题：

1. **GitHub官方文档**：https://docs.github.com/
2. **Git文档**：https://git-scm.com/doc
3. **创建Issue**：在仓库中创建问题报告

## ✅ 发布清单

发布前确认以下项目：

- [ ] GitHub账户已登录
- [ ] 已创建远程仓库（或准备创建）
- [ ] 已决定认证方式（HTTPS Token或SSH）
- [ ] 本地代码已提交（`git status`显示干净）
- [ ] 了解如何处理推送错误

完成发布后：

- [ ] 仓库已成功创建
- [ ] 代码已推送
- [ ] README中的链接已更新
- [ ] 可选：添加了主题标签
- [ ] 可选：创建了Release版本
- [ ] 可选：启用了GitHub Pages
