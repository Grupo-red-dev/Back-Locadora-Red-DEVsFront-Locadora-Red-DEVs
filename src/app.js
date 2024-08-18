import express from "express"
import router from "./routes.js"
import dotenv from "dotenv"
import cors from "cors"

const app = express()
app.use(cors())

//express interpreta o formato json
app.use(express.json())

app.use(router)

export default app
