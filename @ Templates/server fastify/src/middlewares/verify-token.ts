import { FastifyReply, FastifyRequest } from "fastify";


// Função de "porteiro" das suas rotas privadas

export async function verifyToken(request: FastifyRequest, reply: FastifyReply) {
  const authHeader = request.headers.authorization;

  if (!authHeader) {
    return reply.status(401).send({ error: "Token não fornecido" });
  }

  try {
    const token = authHeader.split(" ")[1];
    const decoded = await clerkClient.verifyToken(token); // Valida no Clerk

    // @ts-ignore
    request.user_id = decoded.sub;

  } catch (error) {
    console.error(error);
    return reply.status(401).send({ error: "Token inválido" });
  }
}
