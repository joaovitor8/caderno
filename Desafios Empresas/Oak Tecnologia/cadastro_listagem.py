produtos = []


def cadastrar_produto():
  nome_produto = input("Nome do produto: ")
  while True:
    if nome_produto == "":
      print("Por favor não deixe esse valor em branco")
      nome_produto = input("Nome do produto: ")
    else:
      break

  descricao_produto = input("Descrição do produto: ")
  while True:
    if descricao_produto == "":
      print("Por favor não deixe esse valor em branco")
      descricao_produto = input("Descrição do produto: ")
    else:
      break

  valor_produto = input("Valor do produto: ")
  while True:
    if valor_produto == "":
      print("Por favor não deixe esse valor em branco")
      valor_produto = input("Valor do produto: ")
    else:
      break

  disponivel_produto = input("Disponível para venda (sim/nao): ").lower()
  while True:
    if disponivel_produto == "sim" or disponivel_produto == "nao":
      break
    else:
      print("Por favor digite 'sim' ou 'nao'")
      disponivel_produto = input("Disponível para venda (sim/nao): ").lower()


  produto = {
    "nome": nome_produto,
    "descricao": descricao_produto,
    "valor": valor_produto,
    "disponivel": disponivel_produto
  }

  produtos.append(produto)
  print("\nProduto cadastrado com sucesso!\n")
  listar_produtos()



def listar_produtos():
  if len(produtos) == 0:
    print("Nenhum produto cadastrado.")
  else:
    produtos_ordenados = sorted(produtos, key=lambda p: p["valor"])
    print("\nLista de Produtos (ordenados por valor):\n")
    print(f"{"Nome":<10} {"":<20} {"Valor":<10} {"disponivel"}")
    print("-" * 70)
    for produto in produtos_ordenados:
      print(f"{produto["nome"]:<10} {produto["descricao"]:<20} R${produto["valor"]:<10} {produto["disponivel"]}")
    print("-" * 70)



def menu():
  while True:
    print("\nMenu:")
    print("1 - Cadastrar novo produto")
    print("2 - Listar produtos")
    print("3 - Sair")
    
    opcao = input("\nEscolha uma opção: ")

    if opcao == "1":
      cadastrar_produto()
    elif opcao == "2":
      listar_produtos()
    elif opcao == "3":
      print("Saindo...")
      break
    else:
      print("Opção inválida! Tente novamente.")



menu()
