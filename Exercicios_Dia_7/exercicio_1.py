import json

with open("partida.json", encoding='utf-8') as partida:
    dados = json.load(partida)

print(dados) 