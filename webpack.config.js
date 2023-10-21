const MiniCssExtractPlugin = require("mini-css-extract-plugin");

var webpack = require("webpack");

module.exports = function (env, argv) {
  return {
    entry: {
      site: ["./assets/index.js", "./assets/index.scss", "./assets/fontello.css"],
      archive: "./assets/archive.js",
    },
    output: {
      filename: "[name].[hash:8].js",
      path: __dirname + "/build/assets",
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: "[name].[hash:8].css",
        chunkFilename: "[id].css",
      }),
      new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
      }),
    ],
    module: {
      rules: [
        {
          test: /\.css$/,
          use: [MiniCssExtractPlugin.loader, "css-loader"],
        },
        {
          test: /\.scss$/,
          use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
        },
        {
          test: /\.(gif|jpg|png|svg|eot|ttf|woff|woff2)$/,
          use: [
            {
              loader: "file-loader",
              options: {
                name: "[name].[hash:8].[ext]",
                useRelativePath: true,
              },
            },
          ],
        },
      ],
    },
  };
};
