const fs = require('fs')
const path = require('path')

// 获取third-party目录文件集合
const getTrhidPartys = function (dir) {
  const files = fs.readdirSync(dir)
  const thirdPartys = []
  for (const filName of files) {
    thirdPartys.push(`${dir}/${filName}`)
  }

  return thirdPartys
}

module.exports = {
  entry: {
    'pisces': './src/main.js',
  },

  bail: true,

  devtool: 'source-map',

  output: {
    path: path.resolve(__dirname, 'source', 'js'),
    filename: '[name].js'
  },

  resolve: {
    modules: ['node_modules'],
    extensions: ['.js']
  },

  module: {
    strictExportPresence: true,
    rules: [
      {
        test: /\.js$/,
        use: [
          {
            loader: require.resolve('babel-loader'),
            options: {
              compact: true,
              presets: ['@babel/preset-env']
            }
          }
        ]
      }
    ]
  },
}
