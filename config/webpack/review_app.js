process.env.NODE_ENV = process.env.NODE_ENV || 'review_app'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
