const path = require('path')

module.exports = {
  entry: {
    'pisces': './src/index.js',
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
