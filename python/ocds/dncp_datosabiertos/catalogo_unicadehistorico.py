import pandas as pd

df = pd.read_csv('outs/ten_items.csv')
df_clas = df['compiledRelease/tender/items/0/classification/id']
df_clas_uniq = df_clas.unique()
df_clas_uniq_s = pd.Series(df_clas_uniq)
df_clas_uniq_s.to_csv('outs/catalogo_unicadehistorico.csv')