import requests
from bs4 import BeautifulSoup
import pandas as pd

# lista de urls 
urls = [
    'https://www.iadb.org/es/project/PE-L1271'
]

df = pd.DataFrame()

for url in urls:
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    results = soup.find(id="main")
    proyecto = soup.find_all("div", {"class": "project-detail"})
    for proy in proyecto:
        prcols = []
        prdata = []
        pritems = soup.find_all("div", {"class": "project-field"})
        for pritem in pritems:
            title=str(pritem.find('div', class_='project-field-title').string).strip()
            data=str(pritem.find('span', class_='project-field-data').string).strip()
            prcols.append(title)
            prdata.append(data)
    df = df.append([prdata])

df.columns = prcols
print(df)

"""
res:
  Número de Proyecto Fecha de aprobación  País                              Sector  ... Fecha de referencia    Costo Total Financiamiento de contrapartida del país        Cantidad
0           PE-L1271      March 11, 2022  Perú  EMPRESAS PRIV Y DESARROLLO DE PYME  ...         Mar/22/2022  USD 2,000,000                                    USD 0  USD  2,000,000
"""
