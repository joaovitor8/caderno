import { FastifyInstance } from "fastify";;
import { verifyToken } from "../middlewares/verify-token";


// Rota de Autenticação

export async function Authenticate(app: FastifyInstance) {
  app.post("/db/authenticate", {preHandler: [verifyToken]}, async (request: any, reply: any) => {

    try {
      const userId = request.user_id; // Esse é o ID do usuário (ex: user_2b...)

      if (!userId) {
        return reply.status(401).send({ error: "Usuário não identificado pelo middleware." });
      }

      // Verificar se existe no Banco Local (Prisma)
      let user = await prisma.user.findUnique({
        where: { id: userId },
        include: { userRoles: { include: { role: true } } } // Traz o nome do cargo junto
      });

      // Se não existir, CRIA O USUÁRIO (Sincronização)
      if (!user) {

        // Busca o ID do cargo FREE que criamos no Seed
        const freeRole = await prisma.roles.findUnique({ where: { name: 'FREE' } });

        if (!freeRole) {
          return reply.status(500).send({ error: "ERRO CRÍTICO: Cargo FREE não encontrado. Rode o Seed." });
        }

        // Busca o email e nome lá no Clerk para salvar no nosso banco
        const clerkUser = await clerkClient.users.getUser(userId);
        const email = clerkUser.emailAddresses[0]?.emailAddress;

        if (!email) {
          console.error("❌ Erro: Email não encontrado no cadastro do Clerk.");
          return reply.status(400).send({ error: "Email é obrigatório." });
        }

        // Cria no banco
        user = await prisma.user.create({
          data: {
            id: userId,
            email: email,
            name: `${clerkUser.firstName || ""} ${clerkUser.lastName || ""}`.trim(),

            // Aqui está a mágica: Cria a entrada na tabela User_Roles junto!
            userRoles: {
              create: {
                roleId: freeRole.id
              }
            }
          },
          include: { userRoles: { include: { role: true } } }
        });
        
        console.log("✅");
      }

      // Retorna o usuário para o Front
      return reply.status(200).send({ 
        message: "Sincronizado",
        user: user 
      });

    } catch (error) {
      console.error("🔥 ERRO FATAL NO SERVIDOR:", error);
      return reply.status(500).send({ 
        error: "Erro interno no servidor", 
        details: String(error) 
      });
    }
  });
}
