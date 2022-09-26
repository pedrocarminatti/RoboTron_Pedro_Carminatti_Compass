idade = int(input())

ano = idade // 365
idade = idade - (ano * 365)

mes = idade // 30
idade = idade - (mes * 30)

dia = idade

print('{} ano(s)'.format(ano))
print('{} mes(es)'.format(mes))
print('{} dia(s)'.format(dia))