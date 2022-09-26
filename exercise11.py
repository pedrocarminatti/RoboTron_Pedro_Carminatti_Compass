hora = input().split()
inicio, fim = hora

inicio = int(hora[0])
fim = int(hora[1])

if inicio < fim:
    tempo= fim - inicio
else:
    tempo = (24 - inicio) + fim
print('O JOGO DUROU {} HORA(S)'.format(tempo))