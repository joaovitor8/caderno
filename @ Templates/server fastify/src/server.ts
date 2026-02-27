import fastify from 'fastify'
import cors from '@fastify/cors'
import 'dotenv/config'

import { Route } from './rotas/rotas';


// logger: true faz ele mostrar no terminal quando recebe requisições (útil para debug)
const app = fastify({ logger: true })


// Isso permite que seu Frontend consiga acessar este Backend
app.register(cors, {
  origin: "http://localhost:3000",
  methods: ["GET", "POST", "PUT", "DELETE"]
})


// Registro de Rotas
app.register(Route)


// Tenta rodar na porta 3333. O host '0.0.0.0' é necessário para o Docker/Render funcionarem bem depois.
const start = async () => {
  try {
    await app.listen({ port: 3333, host: '0.0.0.0' })
    console.log('Rodando projeto: http://localhost:3333')
  } catch (err) {
    app.log.error(err)
    process.exit(1)
  }
}

start()
