echo "🎯 文玩雅集开发环境启动脚本"
echo "================================"

if ! command -v node &> /dev/null; then
    echo "❌ 请先安装 Node.js: https://nodejs.org/"
    exit 1
fi


if ! command -v npm &> /dev/null; then
    echo "❌ npm 未安装"
    exit 1
fi

echo "✅ 环境检查通过"
echo "📦 安装依赖..."


npm install

if [ $? -eq 0 ]; then
    echo "✅ 依赖安装成功"
else
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "🚀 启动开发服务器..."
echo "📍 应用将在 http://localhost:8080 启动"
echo "⏹️  按 Ctrl+C 停止服务器"

npm run serve