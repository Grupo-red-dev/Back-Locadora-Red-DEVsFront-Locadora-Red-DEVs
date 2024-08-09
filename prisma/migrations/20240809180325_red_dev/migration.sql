/*
  Warnings:

  - You are about to drop the column `autor` on the `produto` table. All the data in the column will be lost.
  - You are about to drop the column `descrição` on the `produto` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `produto` DROP FOREIGN KEY `produto_ibfk_1`;

-- DropForeignKey
ALTER TABLE `produto` DROP FOREIGN KEY `produto_ibfk_2`;

-- DropForeignKey
ALTER TABLE `produto` DROP FOREIGN KEY `produto_ibfk_3`;

-- AlterTable
ALTER TABLE `produto` DROP COLUMN `autor`,
    DROP COLUMN `descrição`,
    ADD COLUMN `descricao` VARCHAR(300) NULL,
    ADD COLUMN `id_autor_produto` INTEGER NULL;

-- CreateIndex
CREATE INDEX `id_autor_produto` ON `produto`(`id_autor_produto`);

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_autor_produto`) REFERENCES `autor`(`id_autor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_tipo_produto`) REFERENCES `tipo`(`id_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_3` FOREIGN KEY (`id_categoria_produto`) REFERENCES `categoria`(`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `produto` ADD CONSTRAINT `produto_ibfk_4` FOREIGN KEY (`id_midia_produto`) REFERENCES `midia`(`id_midia`) ON DELETE RESTRICT ON UPDATE RESTRICT;
