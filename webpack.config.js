var ExtractTextPlugin = require("extract-text-webpack-plugin");
var webpack = require('webpack')

const IS_DEV = require('isdev')

module.exports = modulePaths => ({
  test: /\.ms[ac]ss$/,
  use: [{
    loader: 'style-loader',
    options: {
      sourceMap: IS_DEV
    }
  },{
    loader: 'css-loader',
    options: {
      localIdentName: '[hash:8]-[name]-[local]',
      modules: true,
      sourceMap: IS_DEV
    }
  },
  {
    loader: 'sass-loader',
    options: {
      sourceMap: IS_DEV,
      includePaths: modulePaths
    }
  }]
})

module.exports = modulePaths => ({
  entry: {
    app: ["./public/stylesheets/sass/all.scss"],
  },

  output: {
    path: __dirname + "/public/",
    filename: "js/[name].js"
  },

  module: {
    loaders: [{
      test: /\.css$/,
      loader: ExtractTextPlugin.extract({ fallback: 'style-loader', use: 'css-loader'})
    },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract({ fallback: 'style-loader', use: 'css-loader!sass-loader'})
      }
    ]
  },

  plugins: [
    new ExtractTextPlugin("stylesheets/[name].css"),
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    })
  ]
});
