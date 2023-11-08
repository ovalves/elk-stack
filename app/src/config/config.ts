export const dbConfig = {
  uri: process.env.MONGODB_DATABASE_URI || 'mongodb://host.docker.internal:27017',
  options: {
    dbName: process.env.MONGODB_DATABASE,
    user: process.env.MONGODB_USER,
    pass: process.env.MONGODB_PASSWORD,
    ssl: process.env.DATABASE_SSL_ENABLED === 'true' ? true : false,
  }
}

export const port = process.env.NODE_DOCKER_PORT || 3000
