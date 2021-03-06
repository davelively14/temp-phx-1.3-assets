'use strict'

var path = require('path')
var webpack = require('webpack')

function root(dest) { return path.resolve(__dirname, "../", dest) }
function web(dest) { return root('lib/temp/web/static/' + dest) }

var config = module.exports = {
  entry: {
    application: [
      web('js/application.js')
    ],
  },

  output: {
    path: root('priv/static/'),
    filename: 'js/application.js'
  },

  resolve: {
    extensions: ['.js'],
    modules: ['node_modules']
  },

  module: {
    noParse: /vendor\/phoenix/,
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          cacheDirectory: true,
          presets: [require.resolve('babel-preset-react'), require.resolve('babel-preset-es2015')]
        }
      }
    ]
  },

  plugins: []
}

if (process.env.NODE_ENV === 'production') {
  config.plugins.push(
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({ minimize: true })
  )
}
