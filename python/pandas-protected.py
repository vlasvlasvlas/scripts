import numpy as np
import pandas as pd
from pandas_profiling import ProfileReport
import json
import msoffcrypto # acordate de instalar la liberia: pip install msoffcrypto-tool # https://github.com/nolze/msoffcrypto-tool
import io

decrypted = io.BytesIO()

pathin = '../data/cepal/'
filein = 'ej1.xls'

with open(pathin+filein, "rb") as f:
    file = msoffcrypto.OfficeFile(f)
    file.load_key(password="VelvetSweatshop")  # Use password
    file.decrypt(decrypted)

sheetname = 3 #INPUT

df = pd.read_excel(decrypted,sheetname, header=1) #arranca en 0 

df.index += 1 
print(df)

