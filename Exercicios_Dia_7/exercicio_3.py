import json

with open("partida.json", encoding='utf-8') as partida:
    dados = json.load(partida)
    
estadio = dados["copa-do-brasil"][0]["estadio"]["nome_popular"]
placar = dados["copa-do-brasil"][0]["placar"]
status = dados["copa-do-brasil"][0]["status"]

print("Estádio: ", estadio)
print("Placar: ", placar)
print("Status: ", status)
