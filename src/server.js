import app from "./app.js"
import dotenv from "dotenv"

dotenv.config()
const port = process.env.PORT || 3001

app.listen(port, (res) => {
  console.log(`Servidor rodando na perta: http://localhost:${port}`)
})

// async function loginUser(data: any) {
//   try {
//     const response = await api.post("/logar", {
//       email: data.email,
//       password: data.password,
//     })

//     routes.push("/")
//   } catch (error) {
//     window.location.search = "error=userNotExisted"
//   }
// }
