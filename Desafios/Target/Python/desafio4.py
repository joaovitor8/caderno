faturamento = {
  'SP': 67836.43,
  'RJ': 36678.66,
  'MG': 29229.88,
  'ES': 27165.48,
  'Outros': 19849.53
}

faturamentoTotal = sum(faturamento.values())

percentuais = {}


for estado, valor in faturamento.items():
  percentual = (valor * 100) / faturamentoTotal


for estado, percentual in percentuais.items():
  print(f"O estado {estado}% tem {percentual}% do faturamento total.")

