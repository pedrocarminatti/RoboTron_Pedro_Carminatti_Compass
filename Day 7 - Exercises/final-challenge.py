from encodings import utf_8
import pandas as pd

arquivo = pd.read_csv("periodic-table.csv", encoding='utf-8', sep=',')

def allNames():
    for index, row in arquivo.iterrows():
        print(index + 1, ': ', row['Nome'])

def filteredData(x):
    filtered = arquivo.query("Simbolo == '" + x + "'")
    for index, row in filtered.iterrows():
        print(index + 1, ': ', row)

def allData():
    for index, row in arquivo.iterrows():   
        print(index + 1, ': ', row)

opcao = 0 
while opcao != 4:
    print('''
    [ 1 ] Mostrar os nomes de todos os elementos
    [ 2 ] Filtrar por Símbolo
    [ 3 ] Mostrar todos os dados
    [ 4 ] Finalizar programa
    ''')
    opcao = int(input("Qual é a sua opção?"))
    if opcao == 1:
        allNames()
    elif opcao == 2:
        x = input("Digite o símbolo a ser filtrado:")
        filteredData(x)
    elif opcao == 3:
        allData()
    elif opcao == 4:
        print("Finalizando...")
    else:
        print("Opção inválida")
