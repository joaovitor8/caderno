import { FastifyInstance } from "fastify";


export async function Route(app: FastifyInstance) {

  // Criar
  app.post('/db/', (request: any, reply: any) => {});


  // Pegar
  app.get('/db/', (request: any, reply: any) => {});
  

  app.get('/db/???/:id', (request: any, reply: any) => {});


  // Atualizar
  app.put('/db/???/:id', (request: any, reply: any) => {});


  // Deletar
  app.delete('/db/???/:id', (request: any, reply: any) => {});
}
