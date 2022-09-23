idade = int(input("Idade: "))

if idade >= 18:
    print("Maior de idade")
elif idade < 12:
    print("Você é uma criança")
elif idade >= 12 and idade < 18:
    print("Você é um adolescente")