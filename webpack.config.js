const { WebpackManifestPlugin } = require("webpack-manifest-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
// const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
// const TerserPlugin = require("terser-webpack-plugin");

module.exports = (env, argv) => ({
  devtool: argv.mode === "production" ? false : "source-map",
  entry: {
    site: ["./assets/index.js", "./assets/index.scss", "./assets/fontello.css"],
    archive: "./assets/archive.js",
  },
  output: {
    filename: "[name].[hash:8].js",
    path: __dirname + "/build/assets",
    clean: true,
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "[name].[hash:8].css",
      chunkFilename: "[id].css",
    }),
    new WebpackManifestPlugin({
      fileName: "manifest.json",
      publicPath: "/assets/",
      writeToFileEmit: true,
    }),
  ],
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "postcss-loader"],
      },
      {
        test: /.s?css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "postcss-loader", "sass-loader"],
      },
      {
        test: /\.(gif|jpg|png|svg|eot|ttf|woff|woff2)$/,
        type: "asset/resource",
      },
    ],
  },
  optimization: {
    // minimize: argv.mode === "production" ? true : false,
    // minimizer: [
    //   new TerserPlugin({
    //     extractComments: false,
    //   }),
    //   new CssMinimizerPlugin({
    //     minimizerOptions: {
    //       preset: [
    //         "default",
    //         {
    //           discardComments: { removeAll: true },
    //         },
    //       ],
    //     },
    //   }),
    // ],
  },
});
