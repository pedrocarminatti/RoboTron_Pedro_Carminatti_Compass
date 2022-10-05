x = int(input("Valor: "))
n = x

def fatorial(x):
    if x == 0: 
        print("Fatorial de", x, ":", 1)
            
    else: 
        fat = 1
        while(x > 1): 
            fat *= x 
            x -= 1
        print("Fatorial de", n, ":", fat) 

def tabuada(x):
    print("Tabuada de: ", x)
    for i in range(1, 11):
        print(i * x)

if x % 2 == 0:
    fatorial(x)
else:
    tabuada(x)
