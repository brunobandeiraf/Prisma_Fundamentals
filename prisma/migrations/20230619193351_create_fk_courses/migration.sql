/*
  Warnings:

  - Added the required column `fk_id_teacher` to the `modules` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teachersId` to the `modules` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `modules` ADD COLUMN `fk_id_teacher` VARCHAR(191) NOT NULL,
    ADD COLUMN `teachersId` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `teachers` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `coursesId` VARCHAR(191) NULL,

    UNIQUE INDEX `teachers_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `modules` ADD CONSTRAINT `modules_teachersId_fkey` FOREIGN KEY (`teachersId`) REFERENCES `teachers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `teachers` ADD CONSTRAINT `teachers_coursesId_fkey` FOREIGN KEY (`coursesId`) REFERENCES `courses`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
