import pandas as pd, sys 
from pandas_profiling import ProfileReport

#archivos = ('records','ten_items','ten_lots','ten_notifiedSuppliers','contracts')
archivos = ('records',)

for archivo in archivos:
    print(archivo)
    df = pd.read_csv(f'outs/{archivo}.csv',low_memory=False,index_col=False)
    print(df)
    profile = ProfileReport(df, title=f"{archivo} Profiling Report", minimal=True)
    profile.to_file(f'htmlprofile/'+archivo+'.html')
