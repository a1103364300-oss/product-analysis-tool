# 商品多维度分析工具 (Product Multi-Dimensional Analysis Tool)

<p align="center">
  <img src="https://img.shields.io/badge/Version-2.0.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white" alt="HTML5">
  <img src="https://img.shields.io/badge/Chart.js-FF6384?style=flat-square&logo=chart.js&logoColor=white" alt="Chart.js">
</p>

<p align="center">
  <strong>一个专业的商品销售数据分析工具，支持多种分析方法</strong>
</p>

<p align="center">
  <a href="#功能特性">功能特性</a> •
  <a href="#快速开始">快速开始</a> •
  <a href="#使用方法">使用方法</a> •
  <a href="#部署指南">部署指南</a> •
  <a href="#贡献指南">贡献指南</a>
</p>

![商品分析工具界面预览](docs/images/preview.png)

## 📊 工具简介

商品多维度分析工具是一款基于Web的商务智能分析工具，专门为零售、电商、批发等行业的商品管理人员设计。该工具能够对商品销售数据进行多维度分析，帮助企业从毛利和销量两个核心维度全面评估商品价值，优化商品结构，提升经营效益。

本工具完全运行在浏览器端，无需安装任何软件，无需服务器支持，数据安全有保障。支持Excel文件上传，提供四种强大的分析方法：四象限分析、综合评分法、ABC分类法、聚类分析，以及直观的可视化图表展示。

### 核心价值

本工具的设计理念是帮助企业回答一个核心问题："从商品毛利和销量两个方面评估一个商品的好坏"。传统的单一指标分析往往无法全面反映商品的真实价值，例如高毛利商品可能销量很低，而高销量商品可能毛利微薄。通过本工具的多维度分析方法，您可以：

- **精准定位商品价值**：快速识别明星商品、潜力商品、流量商品和问题商品
- **优化商品结构**：基于数据驱动的决策，优化SKU组合
- **提升经营效益**：识别高价值商品，提高资源投入效率
- **降低库存风险**：发现滞销商品，及时调整库存策略

## ✨ 功能特性

### 1. 四象限分析法

四象限分析法是经典的商品分类方法，基于毛利和销量的中位数将商品分为四个象限：

- **高毛高销（明星商品）**：既有高毛利又有高销量，是企业的核心盈利商品，应重点维护和推广
- **高毛低销（潜力商品）**：毛利高但销量有限，具有发展潜力，可通过营销活动提升销量
- **低毛高销（流量商品）**：销量大但毛利较低，是引流商品，可搭配高毛商品销售
- **低毛低销（问题商品）**：既没有销量也没有毛利，需要深入分析原因，考虑淘汰

图表特点：坐标原点设置在毛利和销量的中位数点，使数据分布更加合理清晰。

### 2. 综合评分法

综合评分法将毛利和销量两个指标进行标准化处理，然后根据权重计算综合得分：

- **标准化处理**：使用Min-Max标准化算法，将毛利和销量映射到0-100的评分区间
- **权重自定义**：用户可根据业务需求调整毛利和销量的权重比例（默认6:4）
- **等级评定**：根据综合得分划分为S/A/B/C/D五个等级
  - **S级（≥90分）**：顶级商品，综合表现最优
  - **A级（75-89分）**：优秀商品，具有较强竞争力
  - **B级（60-74分）**：良好商品，表现稳定
  - **C级（40-59分）**：一般商品，需要关注提升
  - **D级（<40分）**：待优化商品，需要重点关注

### 3. ABC分类法

ABC分类法基于帕累托法则（80/20法则），对商品进行分类管理：

- **毛利ABC分类**：
  - A类：贡献前70%毛利的商品（重点维护）
  - B类：贡献70%-90%毛利的商品（稳定经营）
  - C类：贡献后10%毛利的商品（优化调整）
- **销量ABC分类**：
  - 同样的分类逻辑应用于销量维度

**交叉分析矩阵**：将毛利分类和销量分类组合成9宫格，帮助识别不同类型的商品：

|          | 毛利A | 毛利B | 毛利C |
|----------|-------|-------|-------|
| **销量A** | 明星商品 | 潜力商品 | 流量商品 |
| **销量B** | 高利产品 | 稳定商品 | 待优化商品 |
| **销量C** | 高利滞销 | 边缘商品 | 淘汰商品 |

### 4. 聚类分析

聚类分析使用K-means算法，无需预设分界线，自动发现商品的自然分组：

- **自动发现分组**：算法自动将商品分为4个簇群
- **动态识别特征**：每个簇群代表一种典型的商品特征组合
- **直观命名**：自动将簇群命名为核心商品、潜力商品、流量商品、问题商品
- **灵活调整**：支持自定义聚类数量，适应不同分析需求

### 5. 多维度雷达图分析

雷达图提供商品的6个关键指标对比：

- **盈利能力**：毛利标准化得分（0-100）
- **销售热度**：销量标准化得分（0-100）
- **综合评分**：加权计算的综合得分（0-100）
- **利润占比**：单品毛利占总毛利的百分比
- **销量占比**：单品销量占总销量的百分比
- **价值系数**：单位销量产生的利润价值

支持三种查看模式：
- **TOP10商品对比**：查看排名前10商品的多维度对比
- **各等级平均表现**：对比S/A/B/C/D五个等级的平均水平
- **自定义单商品**：选择特定商品查看详细指标

### 6. 数据导出与分析报告

- **CSV报告导出**：一键导出完整分析数据，包含所有评估指标
- **多种图表展示**：散点图、直方图、雷达图等多种可视化形式
- **响应式设计**：支持桌面端和移动端使用
- **实时分析**：数据处理在本地完成，保护数据隐私

## 🚀 快速开始

### 环境要求

本工具是一个纯前端Web应用，运行环境要求简单：

- 现代浏览器（Chrome、Firefox、Safari、Edge最新版本）
- 支持HTML5和JavaScript ES6+
- 无需服务器端支持
- 无需数据库

### 方式一：直接使用（推荐）

1. 克隆或下载项目到本地
2. 直接用浏览器打开 `index.html` 文件
3. 上传Excel文件开始分析

```bash
# 克隆项目
git clone https://github.com/a1103364300-oss/product-analysis-tool.git

# 进入项目目录
cd product-analysis-tool

# 直接在浏览器中打开
# macOS: open index.html
# Windows: start index.html
# Linux: xdg-open index.html
```

### 方式二：使用Docker部署

如果您需要在服务器上部署或分享给他人使用，推荐使用Docker：

```bash
# 方式一：使用Docker Compose（推荐）
docker-compose up -d

# 方式二：手动构建运行
docker build -t product-analysis .
docker run -d -p 8080:80 --name product-analysis product-analysis

# 访问 http://localhost:8080
```

### 方式三：使用Nginx部署

对于生产环境，建议使用Nginx进行部署：

```bash
# 安装Nginx
sudo apt install nginx  # Ubuntu/Debian
# 或
sudo yum install nginx  # CentOS

# 复制项目文件到Web目录
sudo cp -r . /var/www/product-analysis/
sudo chown -R www-data:www-data /var/www/product-analysis/

# 配置Nginx并启动
sudo systemctl restart nginx
```

访问 `http://your-server-ip` 即可使用。

## 📖 使用方法

### 数据准备

#### 支持的数据格式

工具支持标准的Excel文件（.xlsx格式），文件需要包含以下列：

| 列名 | 数据类型 | 必填 | 说明 |
|------|----------|------|------|
| 商品名称 | 文本 | 是 | 商品的唯一标识名称 |
| 规格 | 文本 | 否 | 商品的规格型号信息 |
| SKU | 文本 | 否 | 商品的库存单位编码 |
| 总销量 | 数值 | 是 | 商品的销售数量（整数或小数） |
| 商品毛利额 | 数值 | 是 | 商品产生的毛利金额（单位：元） |

#### Excel文件模板

您可以创建一个示例Excel文件测试工具功能：

| 商品名称 | 规格 | SKU | 总销量 | 商品毛利额 |
|----------|------|-----|--------|-----------|
| 商品A | 500ml | SKU001 | 1000 | 5000.00 |
| 商品B | 250ml | SKU002 | 500 | 3000.00 |
| 商品C | 1L | SKU003 | 200 | 800.00 |

#### 注意事项

- 文件大小建议不超过10MB
- 数据行数建议不超过10,000行
- 确保数值列没有文本格式的干扰
- 建议在分析前清理无效数据行

### 操作步骤

#### 第一步：选择分析方法

工具提供四种分析方法，您可以根据分析目的选择：

1. **四象限分析**：快速了解商品的整体分布情况
2. **综合评分法**：对商品进行综合排名和等级评定
3. **ABC分类法**：基于帕累托法则的精细化分类管理
4. **综合分析**：同时展示所有分析方法的结果

#### 第二步：设置参数（可选）

如果选择"综合评分法"或"综合分析"，可以调整评分权重：

- **毛利权重**：反映商品盈利能力的重要性（默认60%）
- **销量权重**：反映商品市场热度的重要性（默认40%）

建议根据行业特点调整权重：
- 高毛利行业（如奢侈品）：提高毛利权重至70-80%
- 薄利多销行业（如日用品）：提高销量权重至60-70%

#### 第三步：上传数据

拖拽Excel文件到上传区域，或点击"选择文件"按钮浏览文件。

#### 第四步：查看分析结果

分析完成后，可以查看：

- **统计概览**：商品总数、总销量、总毛利、平均值、中位数等
- **排名列表**：按综合得分排序的商品列表
- **可视化图表**：四象限图、直方图、散点图、雷达图等
- **详细数据表**：完整的分析数据，支持搜索和排序

#### 第五步：导出报告

点击"下载分析报告"按钮，可以导出CSV格式的完整分析数据。

## 📁 项目结构

```
product-analysis-tool/
├── index.html              # 主应用文件，包含所有功能模块
├── src/
│   ├── css/                # 样式文件目录
│   │   └── style.css       # 主样式文件
│   ├── js/                 # JavaScript文件目录
│   │   └── app.js          # 主应用逻辑
│   └── libs/               # 第三方库目录
│       ├── chart.min.js    # Chart.js图表库
│       └── xlsx.full.min.js # SheetJS Excel处理库
├── docs/
│   ├── images/             # 文档图片目录
│   │   └── preview.png     # 工具预览图
│   ├── API.md              # API文档
│   └── CHANGELOG.md        # 更新日志
├── examples/               # 示例数据目录
│   └── sample-data.xlsx    # 示例Excel文件
├── docker/
│   ├── Dockerfile          # Docker镜像构建文件
│   └── nginx.conf          # Nginx配置文件
├── scripts/
│   └── deploy.sh           # 部署脚本
├── .gitignore              # Git忽略规则
├── LICENSE                 # 开源许可证（MIT）
├── README.md               # 项目说明文档
├── CONTRIBUTING.md         # 贡献指南
├── CHANGELOG.md            # 更新日志
├── docker-compose.yml      # Docker Compose配置
└── .dockerignore           # Docker忽略规则
```

### 主要文件说明

#### 核心文件

- **index.html**：项目的入口文件，包含完整的HTML结构、CSS样式和JavaScript逻辑。这是唯一需要在浏览器中打开的文件。

#### 源代码目录（src/）

- **src/css/style.css**：自定义样式文件，包含响应式布局、美观的UI组件和动画效果。
- **src/js/app.js**：应用的主要JavaScript逻辑，包括数据解析、分析算法和图表渲染。
- **src/libs/chart.min.js**：Chart.js图表库，用于绘制各种可视化图表。
- **src/libs/xlsx.full.min.js**：SheetJS库，用于在浏览器端解析Excel文件。

#### 文档目录（docs/）

- **docs/images/preview.png**：README文档中使用的工具预览截图。
- **docs/API.md**：详细的API接口说明（供开发者扩展使用）。
- **docs/CHANGELOG.md**：版本更新历史记录。

#### 示例数据（examples/）

- **examples/sample-data.xlsx**：包含示例商品数据的Excel文件，可用于快速测试工具功能。

#### Docker配置（docker/）

- **docker/Dockerfile**：定义Docker镜像的构建步骤，基于Nginx镜像。
- **docker/nginx.conf**：自定义Nginx服务器配置，优化静态文件服务。
- **docker-compose.yml**：定义多容器Docker应用配置，简化部署流程。

#### 脚本目录（scripts/）

- **scripts/deploy.sh**：自动化部署脚本，支持一键部署到服务器。

#### 配置文件

- **.gitignore**：指定Git版本控制忽略的文件和目录。
- **.dockerignore**：指定构建Docker镜像时忽略的文件。
- **LICENSE**：MIT开源许可证文件。
- **README.md**：项目的README文档，包含详细的使用说明。
- **CONTRIBUTING.md**：贡献指南，说明如何参与项目开发。
- **CHANGELOG.md**：版本更新日志，记录每个版本的变更内容。

## 🐳 Docker部署指南

### 使用Docker Compose（推荐）

#### 前置条件

确保您的系统已安装Docker和Docker Compose：

```bash
# 检查Docker版本
docker --version

# 检查Docker Compose版本
docker-compose --version
```

#### 部署步骤

1. **克隆项目**
   ```bash
   git clone https://github.com/yourusername/product-analysis-tool.git
   cd product-analysis-tool
   ```

2. **启动服务**
   ```bash
   # 启动容器（后台运行）
   docker-compose up -d
   
   # 查看容器状态
   docker-compose ps
   
   # 查看日志
   docker-compose logs -f
   ```

3. **访问应用**
   打开浏览器访问：`http://localhost:8080`

4. **停止服务**
   ```bash
   docker-compose down
   ```

#### 自定义配置

编辑 `docker-compose.yml` 自定义端口和其他配置：

```yaml
version: '3.8'
services:
  product-analysis:
    build: .
    ports:
      - "8080:80"  # 修改映射端口
    volumes:
      - ./data:/data  # 挂载数据目录
    restart: unless-stopped
    environment:
      - TZ=Asia/Shanghai
```

### 手动构建Docker镜像

#### 构建镜像

```bash
# 进入项目目录
cd product-analysis-tool

# 构建Docker镜像
docker build -t product-analysis:latest .

# 查看镜像
docker images | grep product-analysis
```

#### 运行容器

```bash
# 运行容器
docker run -d \
  --name product-analysis-app \
  -p 8080:80 \
  -v $(pwd)/data:/data \
  --restart unless-stopped \
  product-analysis:latest

# 访问应用
# http://localhost:8080
```

#### 管理容器

```bash
# 停止容器
docker stop product-analysis-app

# 启动容器
docker start product-analysis-app

# 重启容器
docker restart product-analysis-app

# 删除容器
docker rm product-analysis-app
```

### 生产环境部署

对于生产环境，建议使用反向代理和HTTPS：

#### Nginx反向代理配置示例

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

#### 配置HTTPS（Let's Encrypt）

```bash
# 安装certbot
sudo apt install certbot python3-certbot-nginx

# 获取SSL证书
sudo certbot --nginx -d your-domain.com

# 自动续期
sudo crontab -e
# 添加：0 0,12 * * * certbot renew --quiet
```

## 🤝 贡献指南

我们欢迎社区贡献来改进这个项目！如果您想贡献代码，请遵循以下步骤：

### 贡献方式

1. **报告Bug**：在GitHub Issues中报告Bug，提供详细的问题描述和复现步骤
2. **提出建议**：在GitHub Issues中提出新功能建议或改进意见
3. **提交代码**：Fork项目，修改代码，提交Pull Request

### 代码贡献流程

1. **Fork项目**：点击GitHub页面右上角的Fork按钮
2. **克隆项目**：
   ```bash
   git clone https://github.com/YOUR-USERNAME/product-analysis-tool.git
   cd product-analysis-tool
   ```
3. **创建分支**：
   ```bash
   git checkout -b feature/amazing-new-feature
   ```
4. **提交更改**：
   ```bash
   git add .
   git commit -m "Add amazing new feature"
   git push origin feature/amazing-new-feature
   ```
5. **提交Pull Request**：在GitHub上提交Pull Request，等待代码审核

### 代码规范

- 遵循HTML5和ES6+标准
- 使用有意义的变量和函数命名
- 添加必要的代码注释
- 保持代码风格一致
- 编写测试用例（如果有）

### 文档贡献

改进文档也是重要的贡献方式，包括：
- 修正拼写和语法错误
- 添加更清晰的说明
- 补充示例代码
- 翻译文档到其他语言

## 📄 开源许可证

本项目采用MIT许可证开源。

### 许可证说明

MIT许可证是一种非常宽松的开源许可证，允许您：

- ✅ 自由使用、修改、分发本软件
- ✅ 将本软件用于商业目的
- ✅ 获得专利授权
- ✅ 私用使用

条件仅包括：

- ⚠️ 保留原始版权声明
- ⚠️ 在分发时包含许可证文本

这种许可证的选择理由：

1. **商业友好**：允许无限制的商业使用，降低使用门槛
2. **简单易懂**：条款简洁明了，易于理解和遵守
3. **广泛认可**：是开源社区最受欢迎的许可证之一
4. **促进传播**：鼓励项目被广泛使用和二次开发

完整许可证文本请参阅 [LICENSE](LICENSE) 文件。

## 📈 更新日志

版本更新历史请参阅 [CHANGELOG.md](docs/CHANGELOG.md)。

## 📧 联系方式

- **项目维护者**：Metrotopeace
- **GitHub**：https://github.com/a1103364300-oss/product-analysis-tool
- **问题反馈**：https://github.com/a1103364300-oss/product-analysis-tool/issues

## 🙏 致谢

感谢以下开源项目：

- [Chart.js](https://www.chartjs.org/) - 强大的图表库
- [SheetJS](https://sheetjs.com/) - Excel文件处理库
- [Docker](https://www.docker.com/) - 容器化平台
- [Nginx](https://nginx.org/) - 高性能Web服务器

---

<p align="center">
  如果这个工具对您有帮助，请给我们一个⭐️星标支持！
</p>
