import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const result = await prisma.authors.create({
    data: {
      name: "Ana Maria",
      books: {
        createMany: {
          data: [
            { name: "Como começar  na programação" },
            { name: "Como ser muito produtivo" },
          ],
        },
      },
    },
  });

  console.log(result);
}