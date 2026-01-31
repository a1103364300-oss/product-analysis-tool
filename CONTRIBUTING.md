# 贡献指南

感谢您对商品多维度分析工具的兴趣！我们欢迎社区成员贡献代码、文档、建议和反馈，帮助改进这个项目。本指南将说明如何参与贡献。

## 目录

- [如何贡献](#如何贡献)
- [报告问题](#报告问题)
- [提交代码](#提交代码)
- [代码规范](#代码规范)
- [文档贡献](#文档贡献)
- [测试指南](#测试指南)
- [联系团队](#联系团队)

## 如何贡献

有多种方式可以为项目做出贡献：

1. **报告Bug**：发现并报告软件中的问题
2. **提出建议**：提出新功能想法或改进建议
3. **编写代码**：修复问题或添加新功能
4. **完善文档**：改进使用说明或API文档
5. **分享推广**：向他人介绍这个工具

所有贡献都是宝贵的，无论大小。我们承诺认真对待每一条反馈和贡献。

## 报告问题

如果您发现了Bug或有任何问题，请通过GitHub Issues报告。

### 报告前请检查

在报告问题之前，请先：

1. **搜索现有问题**：查看是否已有人报告了相同或类似的问题
2. **检查最新版本**：确保您使用的是最新版本
3. **尝试复现问题**：记录问题的复现步骤

### 问题报告模板

使用以下模板提交问题报告：

```markdown
## 问题描述
[清晰简洁地描述问题]

## 重现步骤
1. [步骤1]
2. [步骤2]
3. [...]

## 预期行为
[描述您期望的行为]

## 实际行为
[描述实际发生的行为]

## 环境信息
- 操作系统：[如：macOS 14.0]
- 浏览器：[如：Chrome 120.0]
- 工具版本：[如：v2.0.0]

## 截图或日志
[如果可能，添加截图或错误日志]
```

## 提交代码

我们欢迎代码贡献！请遵循以下流程：

### 1. Fork项目

首先，点击GitHub页面右上角的Fork按钮，将项目复制到您的GitHub账户。

### 2. 克隆项目

```bash
# 克隆您的Fork副本
git clone https://github.com/YOUR-USERNAME/product-analysis-tool.git

# 进入项目目录
cd product-analysis-tool

# 添加上游仓库引用
git remote add upstream https://github.com/original-owner/product-analysis-tool.git
```

### 3. 创建分支

为每个功能或修复创建一个独立的分支：

```bash
# 确保使用最新的main分支
git fetch upstream
git checkout main
git merge upstream/main

# 创建新分支
git checkout -b feature/your-feature-name
# 或
git checkout -b fix/your-bug-fix
```

### 4. 开发您的功能

在开发过程中：

- 定期同步上游更改：`git fetch upstream && git merge upstream/main`
- 保持分支简洁：避免在单个分支上混合多个不相关的更改
- 编写清晰的提交信息

### 5. 提交更改

```bash
# 查看更改
git status
git diff

# 添加更改的文件
git add .

# 提交更改（遵循提交信息规范）
git commit -m "feat: 添加新功能描述"
# 或
git commit -m "fix: 修复问题描述"
```

### 6. 推送您的分支

```bash
# 推送到您的GitHub仓库
git push origin feature/your-feature-name
```

### 7. 提交Pull Request

在GitHub上创建一个Pull Request：

1. 转到原始仓库，点击"New Pull Request"
2. 选择您的分支作为源分支
3. 填写PR模板，提供清晰的描述
4. 提交PR，等待代码审核

## 代码规范

### HTML规范

- 使用语义化HTML5标签
- 保持缩进一致（2个空格）
- 属性值使用双引号
- 为图片添加alt属性

```html
<!-- 好的示例 -->
<div class="container">
    <article>
        <img src="image.png" alt="描述">
    </article>
</div>
```

### CSS规范

- 使用有意义的类名（BEM命名法可选）
- 避免使用ID选择器定义样式
- 将相关样式分组
- 使用CSS变量管理颜色等

```css
/* 好的示例 */
.btn-primary {
    --btn-color: #667eea;
    background: var(--btn-color);
}

.btn-primary:hover {
    background: var(--btn-color-dark);
}
```

### JavaScript规范

- 使用ES6+语法
- 使用const和let，避免var
- 使用箭头函数
- 添加必要的注释
- 使用有意义的变量和函数命名

```javascript
// 好的示例
const analyzeProducts = (products) => {
    const statistics = calculateStatistics(products);
    return {
        grades: assignGrades(statistics),
        clusters: performClustering(statistics)
    };
};
```

### Git提交信息规范

遵循Conventional Commits规范：

```
<类型>[可选范围]: <描述>

[可选的正文]

[可选的脚注]
```

常用类型：

- **feat**: 新功能
- **fix**: Bug修复
- **docs**: 文档更新
- **style**: 代码格式调整（不影响功能）
- **refactor**: 重构
- **perf**: 性能优化
- **test**: 测试相关
- **chore**: 构建或辅助工具更新

示例：

```
feat: 添加聚类分析功能

- 实现K-means聚类算法
- 添加聚类可视化图表
- 支持自定义聚类数量

Closes #123
```

## 文档贡献

改进文档是重要的贡献方式：

### 文档类型

- **README改进**：使入门指南更清晰
- **使用教程**：添加新的使用示例
- **API文档**：完善开发者文档
- **翻译**：将文档翻译成其他语言

### 文档位置

- 主要文档：README.md
- API文档：docs/API.md
- 更新日志：docs/CHANGELOG.md

## 测试指南

虽然本项目目前没有自动化测试，但我们在手动测试时遵循以下原则：

### 测试清单

在提交代码前，请检查：

- [ ] 所有功能正常工作
- [ ] 响应式布局在移动端正常显示
- [ ] 数据处理结果准确
- [ ] 图表渲染正确
- [ ] 没有控制台错误
- [ ] 代码格式规范

### 测试方法

1. **功能测试**：使用示例数据验证所有分析功能
2. **兼容性测试**：在不同浏览器中测试
3. **性能测试**：处理大数据量时的响应速度
4. **安全测试**：确保没有XSS等安全漏洞

## 联系团队

### 主要联系人

- **项目维护者**：您的名字
- **GitHub**：https://github.com/yourusername/product-analysis-tool
- **问题反馈**：https://github.com/yourusername/product-analysis-tool/issues

### 社区交流

- **讨论区**：GitHub Discussions
- **问题反馈**：GitHub Issues

## 行为准则

我们承诺为所有人提供一个友好、包容的社区。请尊重所有参与者：

- 使用友好和包容的语言
- 尊重不同的观点和经验
- 接受建设性的批评
- 关注对社区最有利的事情

任何形式的骚扰、歧视或不当行为都是不可接受的。

---

再次感谢您的贡献！每一个贡献都使这个工具变得更好。
