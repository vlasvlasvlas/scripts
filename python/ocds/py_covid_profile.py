import numpy as np
import pandas as pd
from pandas_profiling import ProfileReport
import json


filein = 'output.csv'
fileout = 'reporte.html'

df = pd.read_csv(filein,encoding='latin1',sep=",") 

df.index += 1 
print(df)

profile = ProfileReport(df, title="Report", minimal=True)
profile.to_file(fileout)
