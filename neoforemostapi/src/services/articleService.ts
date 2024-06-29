import Article, { ArticleDocument } from '../../models/Article'
import { connectDB } from '../database/db'

connectDB().catch(error => console.error('MongoDB Atlas Error Connection:', error))

export const getEntries = async (): Promise<ArticleDocument[]> => {
  try {
    const articles = await Article.find().exec()
    // console.log(articles)
    return articles
  } catch (error) {
    console.error('Error to get entries from MongoDB Atlas', error)
    throw error
  }
}

export const importArticlesFromFile = async (fileData: string): Promise<string> => {
  return await new Promise((resolve, reject) => {
    try {
      const articles = JSON.parse(fileData)

      Article.insertMany(articles)
        .then(() => {
          resolve('Data imported successfully')
        })
        .catch((error) => {
          console.error('Error importing data:', error)
          reject(error)
        })
    } catch (error) {
      console.error('Error parsing JSON:', error)
      reject(new Error('Invalid JSON format'))
    }
  })
}
