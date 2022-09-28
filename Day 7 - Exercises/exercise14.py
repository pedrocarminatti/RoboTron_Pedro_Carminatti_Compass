from encodings import utf_8
import pandas as pd

arquivo = pd.read_csv("oscars.csv", encoding='utf-8', sep=',')

filtered = arquivo.query("Year >= 1987 and Year <= 1999")

for index, row in filtered.iterrows():
    row["NameAge"] = row["Name"] + " " + str(row["Age"])
    print(row["NameAge"])

