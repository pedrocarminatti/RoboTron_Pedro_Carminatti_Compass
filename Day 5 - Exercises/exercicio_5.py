i = 1
soma = 0
media = 0
divisor = 0
valor = 0
while i <= 20:
    valor = int(input("Valor: "))
    i += 1
    if valor%2==0:
        soma += valor
        divisor += 1
media = soma / divisor
print("Media: ", media)
