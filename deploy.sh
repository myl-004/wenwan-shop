echo "🚀 开始部署文玩雅集..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm 未安装，请先安装 npm"
    exit 1
fi

echo "✅ 环境检查通过"

echo "📦 安装依赖..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"


echo "🔍 代码检查..."
npm run lint

if [ $? -ne 0 ]; then
    echo "⚠️  代码检查发现问题，请修复后重新部署"
fi

echo "🏗️  构建项目..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ 项目构建失败"
    exit 1
fi

echo "✅ 项目构建完成"

if [ ! -d "dist" ]; then
    echo "❌ 构建产物不存在"
    exit 1
fi

echo "📊 构建产物统计:"
du -sh dist/
find dist/ -type f | wc -l

echo "🎉 部署准备完成！"
echo "📁 构建产物位于: dist/"
echo "🌐 可将 dist/ 目录部署到 Web 服务器"