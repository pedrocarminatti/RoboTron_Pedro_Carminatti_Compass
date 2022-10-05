import json

with open("campeonato.json", encoding='utf-8') as campeonato:
    dados = json.load(campeonato)

chaves = ['edicao_atual', 'fase_atual',  'rodada_atual']

for chave in chaves:
    for index, row in dados[chave].items():
        print(index, ": ", row) 
        break
