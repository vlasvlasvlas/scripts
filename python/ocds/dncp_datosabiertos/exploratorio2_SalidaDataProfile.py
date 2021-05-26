import pandas as pd, sys 
from pandas_profiling import ProfileReport

# use under 'archivos' the appended csv files you like to make a pandas data profile html
#archivos = ('records','ten_items','ten_lots','ten_notifiedSuppliers','contracts')
archivos = ('records',)

for archivo in archivos:
    print(archivo)
    df = pd.read_csv(f'outs/{archivo}.csv',low_memory=False,index_col=False)
    print(df)
    profile = ProfileReport(df, title=f"{archivo} Profiling Report", minimal=True) # minimal is recommended
    profile.to_file(f'htmlprofile/'+archivo+'.html') # into folder /htmlprofile
