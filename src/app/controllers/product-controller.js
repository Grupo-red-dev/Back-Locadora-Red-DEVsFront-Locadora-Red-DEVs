import db from "../database/prisma.js";

class Product {
    async listagem_geral(req, res) {
        try {
            const querybusca = await db.produto.findMany();

            console.log("Listagem")
            return res.json({ Status: 200, querybusca });
        } catch (error) {
            console.log("Erro ao Listar os Usuarios: ", error);
        }
    }
}

export default new Product();