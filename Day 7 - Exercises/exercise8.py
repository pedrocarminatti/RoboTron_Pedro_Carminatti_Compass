from encodings import utf_8
import pandas as pd

arquivo = pd.read_csv("oscars.csv", encoding='utf-8', sep=',')

print(arquivo)