fibonacci = [0, 1]

soma = 1

n = int(input("Digite um numero: "))

while n > fibonacci[-1]:
  doisUltimos = fibonacci[-2:]
  
  for i in doisUltimos:
    soma = soma + i
    fibonacci.append(soma)

  if soma >= n:
    break

print(fibonacci)

try:
  fibonacci.index(n)
except:
  print(f"Numero {n} não esta na sequencia de Fibonacci")
else:
  print(f"Numero {n} esta na sequencia de Fibonacci")
