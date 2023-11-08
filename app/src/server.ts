import { dbConfig, port } from './config/config'
import { connect } from 'mongoose'
import app from './app'

connect(dbConfig.uri, {
  ...dbConfig.options,
  serverSelectionTimeoutMS: 3000,
  connectTimeoutMS: 3000,
  socketTimeoutMS: 3000,
}).then(() =>
  app.listen(port, () => console.log('server running on port %d', port))
)
