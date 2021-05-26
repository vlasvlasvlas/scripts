import pandas as pd
# just use the csv files you like to append full range 2010-2021 into a single csv file
archivos = ('records','ten_items','ten_lots','ten_notifiedSuppliers','contracts','awa_items','awards','con_documents','con_amendments')
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
