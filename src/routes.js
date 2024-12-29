import { Router } from 'express'
import Validate from './app/controllers/register-controller.js'
import Product from './app/controllers/product-controller.js'
const router = Router()

// ROTAS
router.get('/', (req, res) => {
  console.log('Ta funcionando')
  return res.send('Ta rodando')
})

/* Verifications call */
router.post('/Register', Validate.Cadastro)
router.post('/login', Validate.login)

/* Products call */
router.get('/getProducts', Product.listagem_geral)

router.post('/getProductsByGenres1', Product.listagem_genero1)
router.post('/getProductsByGenres2', Product.listagem_genero2)

export default router
