import express, { Request, Response } from 'express'
import * as articleService from '../services/articleService'
import multer from 'multer'

const router = express.Router()
const storage = multer.memoryStorage()
const upload = multer({ storage })

router.get('/', (_req: Request, res: Response) => {
  articleService.getEntries().then((entries) => {
    console.log('Articles:', entries)
    res.send(entries)
  }).catch((error) => {
    res.status(500).send({ error: (error as Error).message })
  })
})

router.post('/', upload.single('file'), (req: Request, res: Response) => {
  // eslint-disable-next-line @typescript-eslint/strict-boolean-expressions
  if (!req.file) {
    return res.status(400).json({ error: 'No file uploaded' })
  }

  const { buffer } = req.file

  articleService.importArticlesFromFile(buffer.toString('utf8'))
    .then((message) => {
      res.status(200).json({ message })
    })
    .catch((error) => {
      console.error('Error importing data:', error)
      res.status(500).json({ error: error.message })
    })
})

export default router
