import { connection } from 'mongoose'

export const healthStatusController = async () => {
  const mongoStatus = connection.readyState ? 'OK' : 'NOK'

  return {
    mongodb: mongoStatus,
  }
}
