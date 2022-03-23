import requests
from bs4 import BeautifulSoup
import pandas as pd
#url = 'https://www.iadb.org/es/project-search-xls?country=PE&sector=&status=&query='
#urls = ['https://www.iadb.org/es/project/PE-L1271']

dfurls = pd.read_csv('lista.csv') #to-do: get lista from xlsx web
urls = dfurls['proyectos']
dfall = pd.DataFrame()
for url in urls:
    print("proyecto:"+url)
    page = requests.get('https://www.iadb.org/es/project/'+str(url))
    if page.status_code == 200:
        soup = BeautifulSoup(page.content, "html.parser")
        results = soup.find(id="main")
        proyecto = soup.find_all("div", {"class": "project-detail"})
        for proy in proyecto:
            prcols = []
            prdata = []
            pritems = soup.find_all("div", {"class": "project-field"})
            for pritem in pritems:
                try:
                    title=str(pritem.find('div', class_='project-field-title').string).strip()
                except:
                    title='-'
                try:
                    data=str(pritem.find('span', class_='project-field-data').string).strip()
                except:
                    data='-'
                prcols.append(title)
                prdata.append(data)
        dfall = dfall.append([prdata])

# export
dfall.columns = prcols
print(dfall)
dfall.to_excel('output.xlsx')
