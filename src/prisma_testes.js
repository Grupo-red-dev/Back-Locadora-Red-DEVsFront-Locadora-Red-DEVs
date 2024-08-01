import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

async function Novousuario() {
    try {
        const newUser = await prisma.usuario.create({
            data: {
                nome_usuario: "Cleber",
                email_usuario: "cleber@gmai.com",
            },
        })
    
        console.log("Novo usuario criado: ", newUser);
    } catch (error) {
        console.log("Erro ao inserir usuario: ", error);
    } finally {

    }
}

async function buscarUsuarios() {
    try {
        const querybusca = await prisma.usuario.findMany();
    
        console.log("Listagens dos registros na tabela 'usuario'", querybusca);
    } catch (error) {
        console.log("Erro ao inserir usuario: ", error);
    } 
}


async function buscaWhere() {
    try {
        const querybusca = await prisma.usuario.findUnique({
            where: {
                email_usuario: "cleber@gmail.com"
            }

            
        });
    
        console.log("Usuario: ", querybusca);
    } catch (error) {
        console.log("Erro ao buscar usuario: ", error);
    }
    
}

//Novousuario();

//buscarUsuarios()

buscaWhere()

