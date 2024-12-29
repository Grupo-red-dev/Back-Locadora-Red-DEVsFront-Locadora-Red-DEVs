import db from "../database/prisma.js"
import bcrypt from "bcryptjs"
import jwt from "jsonwebtoken"

class Validate {
  //Cadastro de novo usuario
  Cadastro(req, res) {
    try {
      bcrypt.hash(req.body.senha, 10, async (err, hash) => {
        const cadastro = await db.usuario.create({
          data: {
            nome_usuario: req.body.nome,
            email_usuario: req.body.email,
            senha_usuario: hash,
            nivel_acesso: 2,
          },
        })

        console.log("Novo usuario criado: ", cadastro)
        return res.json({ Status: 200, cadastro })
      })
    } catch (error) {
      console.log("Erro ao inserir usuario: ", error)
      return res.json(error)
    }
  }

  //Login de usuario
  async login(req, res) {
    try {
      const login = await db.usuario.findUnique({
        where: {
          email_usuario: req.body.email,
        },
      })
      if (!login) {
        return res.json({ Status: 404, Erro: "Email Incorreto" });
      } else {
        bcrypt.compare(req.body.senha, login.senha_usuario, (err, result) => {
          if (err) return res.json({Error: err, Message: "error while comparing password"});

          if (result) {
            const token = jwt.sign(
              {
                role: login.nivel_acesso,
                id: login.id_usuario,
              },
              "jwt-secret-key",
              {
                expiresIn: "1d",
              }
            )
            res.cookie("token", token)
            return res.json({ Status: 200 })
          } else {
            return res.json({ Error: "Senha incorreta" })
          }
        })
      }
    } catch (error) {
      console.log("Erro ao buscar usuario: ", error);
      res.json({ Error: error });
    }
  }
}

export default new Validate()
