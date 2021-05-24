import pandas as pd

#distinct catalogo n5
df = pd.read_csv('outs/ten_items.csv')
df_clas = df['compiledRelease/tender/items/0/classification/id']
df_clas_uniq = df_clas.unique()
df_clas_uniq_s = pd.Series(df_clas_uniq)
df_clas_uniq_s.to_csv('outs/catalogo_unicadehistorico.csv')

# catalogo n5 group by anio , freq
dfgroupxanio = df.groupby(['compiledRelease/tender/items/0/classification/id','aniocsv']).size().reset_index(name='Freq')
dfgroupxanio.to_csv('outs/catalogo_groupcountxanio.csv')
