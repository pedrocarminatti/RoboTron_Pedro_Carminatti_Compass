import json

with open("campeonato.json", encoding='utf-8') as campeonato:
    dados = json.load(campeonato)

for i in dados.keys():
    print(i)