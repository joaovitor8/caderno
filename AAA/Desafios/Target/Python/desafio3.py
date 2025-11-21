import json

with open("dados1.json") as file: faturamento = json.load(file) # Lendo o arquivo JSON

faturamentoValidos = [dia["valor"] for dia in faturamento if dia["valor"] > 0]
# print(faturamentoValidos)

menorValor = min(faturamentoValidos)
maiorValor = max(faturamentoValidos)
mediaMensal = sum(faturamentoValidos) / len(faturamentoValidos)
# print(menorValor, maiorValor, mediaMensal)

diasAcimaMedia = sum(1 for valor in faturamentoValidos if valor > mediaMensal)
# print(diasAcimaMedia)

print(f"Menor faturamento: R$ {menorValor:.2f}")
print(f"Maior faturamento: R$ {maiorValor:.2f}")
print(f"Total de dias acima da média: {diasAcimaMedia}")
