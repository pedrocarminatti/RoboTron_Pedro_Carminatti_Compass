from encodings import utf_8
import pandas as pd

arquivo = pd.read_csv("oscars.csv", encoding='utf-8', sep=',')

for index, row in arquivo.iterrows():
    row["MovieYear"] = row["Movie"] + " " + str(row["Year"])
    print(row["MovieYear"])