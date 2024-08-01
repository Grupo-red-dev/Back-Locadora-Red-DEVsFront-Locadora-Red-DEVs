-- CreateTable
CREATE TABLE `autor` (
    `id_autor` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_autor` VARCHAR(50) NULL,
    `descricao` VARCHAR(500) NULL,

    PRIMARY KEY (`id_autor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `carrinho` (
    `id_carrinho` INTEGER NOT NULL AUTO_INCREMENT,
    `id_usuario_carrinho` INTEGER NULL,
    `id_produto_carrinho` INTEGER NULL,

    INDEX `id_produto_carrinho`(`id_produto_carrinho`),
    INDEX `id_usuario_carrinho`(`id_usuario_carrinho`),
    PRIMARY KEY (`id_carrinho`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categoria` (
    `id_categoria` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_categoria` VARCHAR(50) NULL,
    `id_tipo_categoria` INTEGER NULL,

    INDEX `id_tipo_categoria`(`id_tipo_categoria`),
    PRIMARY KEY (`id_categoria`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `favorito` (
    `id_favorito` INTEGER NOT NULL AUTO_INCREMENT,
    `id_usuario_favorito` INTEGER NULL,
    `id_produto_favorito` INTEGER NULL,

    INDEX `id_produto_favorito`(`id_produto_favorito`),
    INDEX `id_usuario_favorito`(`id_usuario_favorito`),
    PRIMARY KEY (`id_favorito`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `midia` (
    `id_midia` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_midia` VARCHAR(50) NULL,

    PRIMARY KEY (`id_midia`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produto` (
    `id_produto` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_produto` VARCHAR(50) NULL,
    `data_produto` VARCHAR(100) NULL,
    `preco_produto` VARCHAR(200) NULL,
    `descrição` VARCHAR(300) NULL,
    `autor` VARCHAR(50) NULL,
    `foto_produto` VARCHAR(300) NULL,
    `id_tipo_produto` INTEGER NULL,
    `id_categoria_produto` INTEGER NULL,
    `id_midia_produto` INTEGER NULL,

    INDEX `id_categoria_produto`(`id_categoria_produto`),
    INDEX `id_midia_produto`(`id_midia_produto`),
    INDEX `id_tipo_produto`(`id_tipo_produto`),
    PRIMARY KEY (`id_produto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo` (
    `id_tipo` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_tipo` VARCHAR(50) NULL,

    PRIMARY KEY (`id_tipo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `id_usuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_usuario` VARCHAR(50) NULL,
    `email_usuario` VARCHAR(100) NULL,
    `senha_usuario` VARCHAR(200) NULL,
    `foto_usuario` VARCHAR(300) NULL,
    `nivel_acesso` INTEGER NULL,

    PRIMARY KEY (`id_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `carrinho` ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_usuario_carrinho`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `carrinho` ADD CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`id_produto_carrinho`) REFERENCES `produto`(`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `categoria` ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`id_tipo_categoria`) REFERENCES `tipo`(`id_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `favorito` ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario_favorito`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `favorito` ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_produto_favorito`) REFERENCES `produto`(`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_tipo_produto`) REFERENCES `tipo`(`id_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_categoria_produto`) REFERENCES `categoria`(`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_3` FOREIGN KEY (`id_midia_produto`) REFERENCES `midia`(`id_midia`) ON DELETE RESTRICT ON UPDATE RESTRICT;
