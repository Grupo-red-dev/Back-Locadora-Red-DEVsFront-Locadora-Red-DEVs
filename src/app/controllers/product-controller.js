import db from "../database/prisma.js";

class Product {
    //Listagem geral de produtos
    async listagem_geral(req, res) {
        try {
            const allproducts = await db.produto.findMany();

            console.log("Listagem geral de produtos executada com sucesso! \n");
            return res.json({ Status: 200, produtos: allproducts });
        } catch (error) {
            console.log("Erro ao listar os produtos: ", error);
        }
    }

    //Listagem por genero com base no ID da genero
    async listagem_genero1(req, res) {
        try {
            const querybusca = await db.link_prod_genero.findMany({
                relationLoadStrategy: "join", // or "query"
                where:{
                    id_genero_link: req.body.id_genero
                },
                select: {
                    produto: true, // Include the related product in the result
                }
            });
            if(querybusca == null || querybusca.length == 0){
                return res.json({ Status: 404, Mensagem: "Genero não encontrado!" });
            } else{
                console.log("Busca de produto por genero concluido com sucesso!");
                return res.json({ Status: 200, produtos: querybusca });
            }
        } catch (error) {
            console.log("Erro ao listar os produtos: ", error);
        }
    }

    //Listagem por genero com base no nome da genero
    async listagem_genero2(req, res) {
        try {
            const genero = await db.genero.findFirst({
                where: {
                    nome_genero: req.body.genero
                }
            });

            console.log("Busca de genero executada com sucesso!");

            if(genero == null) {
                return res.json({ Status: 404, Mensagem: "Genero não encontrado!" });
            } else {
                console.log(genero.id_genero);
                try {
                    const products = await db.link_prod_genero.findMany({
                        relationLoadStrategy: "join", // or "query"
                        where:{
                            id_genero_link: genero.id_genero
                        },
                        select: {
                            produto: true, // Include the related product in the result
                        }
                    });
        
                    console.log("Busca de produto por genero concluido com sucesso!");
                    return res.json({ Status: 200, produtos: products });
                } catch (error) {
                    console.log("Erro ao encontrar o produto com base na genero: ", error);
                }
            }
        } catch (error) {
            console.log("Erro ao encontrar a genero durante o processo 'busca de produtos por genero': ", error);
        }
    }
}

export default new Product();