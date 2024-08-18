import { Router } from "express"
import Validate from "./app/controllers/register-controller.js"
import Product from "./app/controllers/product-controller.js"
const router = Router()

// ROTAS
router.get("/", (req, res) => {
  console.log("Ta funcionando")
  return res.send("Ta rodando")
})

router.post("/Register", Validate.Cadastro)
router.post("/login", Validate.login)

router.get("/getProducts", Product.listagem_geral)

export default router
