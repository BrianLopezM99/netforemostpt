import express from 'express'

import Articles from './routes/articles'
import dotenv from 'dotenv'

dotenv.config()
const app = express()
app.use(express.json())

const PORT = (process.env.PORT != null) || 3000

app.use('/api/articles', Articles)

app.get('/test', (_req, res) => {
  console.log('Hi from test')
  res.send('Test')
})

app.listen(PORT, () => {
  if (PORT != null) {
    console.log(`server running on port ${PORT.toString()}`)
  } else {
    console.log('server Error')
  }
})

export default app
