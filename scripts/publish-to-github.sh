#!/bin/bash

# GitHub仓库创建和推送脚本
# 使用方法：./scripts/publish-to-github.sh

set -e

echo "================================"
echo "商品多维度分析工具 - GitHub发布脚本"
echo "================================"
echo ""

# 检查Git状态
if [ ! -d ".git" ]; then
    echo "❌ 错误：当前目录不是Git仓库"
    echo "请在项目根目录下运行此脚本"
    exit 1
fi

# 读取配置或设置
echo "📝 GitHub仓库设置"
echo "------------------"

# GitHub用户名
read -p "请输入您的GitHub用户名: " GITHUB_USERNAME
if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ 错误：用户名不能为空"
    exit 1
fi

# 仓库名称（默认）
REPO_NAME="product-analysis-tool"
read -p "请输入仓库名称 [默认: $REPO_NAME]: " INPUT_REPO_NAME
if [ ! -z "$INPUT_REPO_NAME" ]; then
    REPO_NAME=$INPUT_REPO_NAME
fi

# 仓库描述
REPO_DESCRIPTION="一个专业的商品销售数据分析工具，支持多种分析方法：四象限分析、综合评分法、ABC分类法和聚类分析"
read -p "请输入仓库描述 [直接回车使用默认描述]: " INPUT_DESC
if [ ! -z "$INPUT_DESC" ]; then
    REPO_DESCRIPTION=$INPUT_DESC
fi

# SSH或HTTPS
echo ""
echo "请选择协议类型："
echo "1. HTTPS (推荐，需要输入Personal Access Token)"
echo "2. SSH (需要配置SSH密钥)"
read -p "请选择 [1-2]: " PROTOCOL_CHOICE

case $PROTOCOL_CHOICE in
    1)
        REPO_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
        ;;
    2)
        REPO_URL="git@github.com:${GITHUB_USERNAME}/${REPO_NAME}.git"
        ;;
    *)
        echo "❌ 无效选择，使用HTTPS"
        REPO_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
        ;;
esac

echo ""
echo "✅ 配置完成"
echo "------------------"
echo "用户名: $GITHUB_USERNAME"
echo "仓库名: $REPO_NAME"
echo "仓库URL: $REPO_URL"
echo ""

# 检查是否已存在远程仓库
if git remote get-url origin &> /dev/null; then
    CURRENT_ORIGIN=$(git remote get-url origin)
    echo "⚠️  远程仓库'origin'已存在: $CURRENT_ORIGIN"
    read -p "是否更新为新仓库? (y/n): " UPDATE_ORIGIN
    if [ "$UPDATE_ORIGIN" != "y" ] && [ "$UPDATE_ORIGIN" != "Y" ]; then
        echo "⏭️  跳过远程仓库设置"
    else
        git remote set-url origin "$REPO_URL"
        echo "✅ 已更新远程仓库URL"
    fi
else
    echo "🔗 添加远程仓库..."
    git remote add origin "$REPO_URL"
    echo "✅ 已添加远程仓库"
fi

echo ""
echo "📦 推送到GitHub"
echo "------------------"

# 获取当前分支名称
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
echo "当前分支: $BRANCH_NAME"

# 首次推送需要设置上游分支
echo "🚀 推送到GitHub..."
git push -u origin $BRANCH_NAME

echo ""
echo "================================"
echo "🎉 发布成功！"
echo "================================"
echo ""
echo "您的仓库已成功发布到GitHub："
echo "🔗 https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
echo ""
echo "下一步操作："
echo "1. 访问仓库页面，完善项目信息"
echo "2. 添加主题标签：analytics, business-intelligence, data-visualization"
echo "3. 配置GitHub Pages（可选）"
echo "4. 创建Release版本"
echo ""
echo "祝您的项目获得更多关注！⭐"
