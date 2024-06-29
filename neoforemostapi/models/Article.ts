import mongoose, { Schema, Document } from 'mongoose'

export interface ArticleDocument extends Document {
  author: string
  title: string
  description: string
  url: string
  urlToImage: string
  publishedAt: string
}

const ArticleSchema: Schema = new Schema({
  author: { type: String, required: true },
  title: { type: String, required: true },
  description: { type: String, required: true },
  url: { type: String, required: true },
  urlToImage: { type: String, required: true },
  publishedAt: { type: String, required: true }
})

export default mongoose.model<ArticleDocument>('Article', ArticleSchema)
