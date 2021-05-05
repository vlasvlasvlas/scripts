import pandas as pd
archivos = ('records','ten_items','ten_lots','ten_notifiedSuppliers','contracts')
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
