const { defineConfig } = require('@vue/cli-service')
const path = require('path')

module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false, 
  configureWebpack: {
    resolve: {
      alias: {
        '@': path.resolve(__dirname, 'src')
      }
    }
  },
  
  devServer: {
    port: 8080,
    open: true,
    hot: true,
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  },
  
  chainWebpack: config => {
    config.plugin('html').tap(args => {
      args[0].title = '文玩雅集 - 文玩收藏品电商平台'
      args[0].meta = {
        description: '文玩雅集 - 专业的文玩收藏品电商平台，提供瓷器、玉器、字画等各类文玩商品，权威鉴定，正品保证。',
        keywords: '文玩,收藏品,瓷器,玉器,字画,古董,艺术品'
      }
      return args
    })
  }
})