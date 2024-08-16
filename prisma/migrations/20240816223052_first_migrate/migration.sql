-- CreateTable
CREATE TABLE "autor" (
    "id_autor" SERIAL NOT NULL,
    "nome_autor" VARCHAR(50),
    "descricao" VARCHAR(500),

    CONSTRAINT "autor_pkey" PRIMARY KEY ("id_autor")
);

-- CreateTable
CREATE TABLE "carrinho" (
    "id_carrinho" SERIAL NOT NULL,
    "id_usuario_carrinho" INTEGER,
    "id_produto_carrinho" INTEGER,

    CONSTRAINT "carrinho_pkey" PRIMARY KEY ("id_carrinho")
);

-- CreateTable
CREATE TABLE "categoria" (
    "id_categoria" SERIAL NOT NULL,
    "nome_categoria" VARCHAR(50),
    "id_tipo_categoria" INTEGER,

    CONSTRAINT "categoria_pkey" PRIMARY KEY ("id_categoria")
);

-- CreateTable
CREATE TABLE "favorito" (
    "id_favorito" SERIAL NOT NULL,
    "id_usuario_favorito" INTEGER,
    "id_produto_favorito" INTEGER,

    CONSTRAINT "favorito_pkey" PRIMARY KEY ("id_favorito")
);

-- CreateTable
CREATE TABLE "midia" (
    "id_midia" SERIAL NOT NULL,
    "nome_midia" VARCHAR(50),

    CONSTRAINT "midia_pkey" PRIMARY KEY ("id_midia")
);

-- CreateTable
CREATE TABLE "produto" (
    "id_produto" SERIAL NOT NULL,
    "nome_produto" VARCHAR(50),
    "data_produto" VARCHAR(100),
    "preco_produto" VARCHAR(200),
    "descricao" VARCHAR(300),
    "foto_produto" VARCHAR(300),
    "id_autor_produto" INTEGER,
    "id_tipo_produto" INTEGER,
    "id_categoria_produto" INTEGER,
    "id_midia_produto" INTEGER,

    CONSTRAINT "produto_pkey" PRIMARY KEY ("id_produto")
);

-- CreateTable
CREATE TABLE "tipo" (
    "id_tipo" SERIAL NOT NULL,
    "nome_tipo" VARCHAR(50),

    CONSTRAINT "tipo_pkey" PRIMARY KEY ("id_tipo")
);

-- CreateTable
CREATE TABLE "usuario" (
    "id_usuario" SERIAL NOT NULL,
    "nome_usuario" VARCHAR(50),
    "email_usuario" VARCHAR(100),
    "senha_usuario" VARCHAR(200),
    "foto_usuario" VARCHAR(300),
    "nivel_acesso" INTEGER,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateIndex
CREATE INDEX "id_produto_carrinho" ON "carrinho"("id_produto_carrinho");

-- CreateIndex
CREATE INDEX "id_usuario_carrinho" ON "carrinho"("id_usuario_carrinho");

-- CreateIndex
CREATE INDEX "id_tipo_categoria" ON "categoria"("id_tipo_categoria");

-- CreateIndex
CREATE INDEX "id_produto_favorito" ON "favorito"("id_produto_favorito");

-- CreateIndex
CREATE INDEX "id_usuario_favorito" ON "favorito"("id_usuario_favorito");

-- CreateIndex
CREATE INDEX "id_categoria_produto" ON "produto"("id_categoria_produto");

-- CreateIndex
CREATE INDEX "id_midia_produto" ON "produto"("id_midia_produto");

-- CreateIndex
CREATE INDEX "id_tipo_produto" ON "produto"("id_tipo_produto");

-- CreateIndex
CREATE INDEX "id_autor_produto" ON "produto"("id_autor_produto");

-- CreateIndex
CREATE UNIQUE INDEX "email_usuario" ON "usuario"("email_usuario");

-- AddForeignKey
ALTER TABLE "carrinho" ADD CONSTRAINT "carrinho_ibfk_1" FOREIGN KEY ("id_usuario_carrinho") REFERENCES "usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "carrinho" ADD CONSTRAINT "carrinho_ibfk_2" FOREIGN KEY ("id_produto_carrinho") REFERENCES "produto"("id_produto") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "categoria" ADD CONSTRAINT "categoria_ibfk_1" FOREIGN KEY ("id_tipo_categoria") REFERENCES "tipo"("id_tipo") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "favorito" ADD CONSTRAINT "favorito_ibfk_1" FOREIGN KEY ("id_usuario_favorito") REFERENCES "usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "favorito" ADD CONSTRAINT "favorito_ibfk_2" FOREIGN KEY ("id_produto_favorito") REFERENCES "produto"("id_produto") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_ibfk_1" FOREIGN KEY ("id_autor_produto") REFERENCES "autor"("id_autor") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_ibfk_2" FOREIGN KEY ("id_tipo_produto") REFERENCES "tipo"("id_tipo") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_ibfk_3" FOREIGN KEY ("id_categoria_produto") REFERENCES "categoria"("id_categoria") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "produto_ibfk_4" FOREIGN KEY ("id_midia_produto") REFERENCES "midia"("id_midia") ON DELETE RESTRICT ON UPDATE RESTRICT;
