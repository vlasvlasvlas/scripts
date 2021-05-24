import pandas as pd

# solo catalogo
df = pd.read_csv('outs/ten_items.csv')
df_clas = df['compiledRelease/tender/items/0/classification/id','aniocsv']
df_clas_uniq = df_clas.unique()
df_clas_uniq_s = pd.Series(df_clas_uniq)
df_clas_uniq_s.to_csv('outs/catalogo_unicadehistorico.csv')

# catalogo con anio
dfgroup = df.groupby(['compiledRelease/tender/items/0/classification/id','aniocsv']).size().reset_index(name='Freq')
dfunique_catalogo_anio = dfgroup[dfgroup['Freq'] == 1]
dfunique_catalogo_anio.to_csv('outs/catalogo_unicadehistoricoanio.csv')
