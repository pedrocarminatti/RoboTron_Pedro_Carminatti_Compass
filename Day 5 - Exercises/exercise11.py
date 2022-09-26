valor = input().split()
inicio, fim = valor

inicio = int(valor[0])
fim = int(valor[1])

if inicio < fim:
    tempo = fim - inicio
else:
    tempo = (24 - inicio) + fim
print('O JOGO DUROU {} HORA(S)'.format(tempo))