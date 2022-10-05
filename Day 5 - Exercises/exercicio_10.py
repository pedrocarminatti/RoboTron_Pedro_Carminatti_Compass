frutas = ["maça", "banana", "pera"]
lista = []
for i in range(3):
    lista.append(str(input("Fruta: ")))

if lista[0] == frutas[0] and lista[1] == frutas[1] and lista[2] == frutas[2]:
    print("Listas iguais")
else:
    print("Listas diferentes")
