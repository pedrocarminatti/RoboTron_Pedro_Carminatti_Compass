import json

with open("partida.json", encoding='utf-8') as partida:
    dados = json.load(partida)
    
print(dados["copa-do-brasil"][0]["time_mandante"]["nome_popular"]) 