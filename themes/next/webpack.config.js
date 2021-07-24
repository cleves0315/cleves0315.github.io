const path = require('path')

module.exports = {
  entry: {
    'main': './src/index.js'
  },

  output: {
    filename: '[name].min.js',
    path: path.resolve(__dirname, 'source', 'js')
  },

  resolve: {
    modules: ['node_modules'],
    extensions: ['.js']
  }
}
