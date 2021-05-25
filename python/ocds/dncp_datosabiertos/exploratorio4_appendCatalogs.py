# origen de datos:
# https://www.contrataciones.gov.py/images/opendata-v3/final/catalogo_n5/
import pandas as pd
archivos = ('catalogo_n5',)
anios = range(2010,2022)
for archivo in archivos:
    dfTotal = pd.DataFrame()
    print(f'{archivo}, start')
    for anio in anios:
        aniostr = str(anio)
        dftmp = pd.read_csv(f'{aniostr}/{archivo}.csv',low_memory=False)
        dftmp['aniocsv'] =anio
        print(f'{anio}, {len(dftmp.index)}')
        dfTotal=dfTotal.append(dftmp, ignore_index = True)
    print(f'{archivo}.csv end, {len(dfTotal.index)}')
    dfTotal.to_csv(f'outs/{archivo}.csv',index=False)
# salida a /outs/CATALOGOSN5 unificados
