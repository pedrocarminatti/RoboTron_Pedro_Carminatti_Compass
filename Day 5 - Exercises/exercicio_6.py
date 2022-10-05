x = int(input("Valor: "))

if x <= 2:
    print("Informe um valor maior que 2!")
elif x > 2:
    for i in range(2, x + 1):
        if i % 2 > 0:
            print(i)
