import mongoose from 'mongoose'
import dotenv from 'dotenv'

dotenv.config()

const MONGODB_URI = process.env.MONGODB_URI

export const connectDB = async (): Promise<void> => {
  if (MONGODB_URI != null) {
    try {
      await mongoose.connect(MONGODB_URI)
      console.log('MongoDB Atlas is connected')
    } catch (error) {
      console.error('MongoDB Atlas is not connected', error)
      process.exit(1)
    }
  } else {
    console.error('MONGODB_URI is not defined')
  }
}

export const disconnectDB = async (): Promise<void> => {
  try {
    await mongoose.disconnect()
    console.log('Mongodb Atlas is disconnected')
  } catch (error) {
    console.error('Error to disconnect from MongoDB Atlas server', error)
    process.exit(1)
  }
}
