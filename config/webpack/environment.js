const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
const customConfig = require('./custom');

// environment.plugins.append('Provide', new webpack.ProvidePlugin({}));
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

environment.config.merge(customConfig);



module.exports = environment;
