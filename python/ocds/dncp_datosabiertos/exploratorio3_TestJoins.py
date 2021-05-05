import pandas as pd

"""
records.csv:compiledRelease/tender/id = ten_items.csv:compiledRelease/tender/id
records.csv:compiledRelease/tender/id = ten_notifiedSuppliers.csv:compiledRelease/tender/id
records.compiledRelease/id = contracts.csv.compiledRelease/id
"""

dfRecords = pd.read_csv('outs/records.csv',low_memory=False,index_col=False)
print(dfRecords.head())
print(dfRecords.describe().T)
print(f'dfRecords, {len(dfRecords.index)}')

dfTenItems = pd.read_csv('outs/ten_items.csv',low_memory=False,index_col=False)
print(dfTenItems.head())
print(dfTenItems.describe().T)
print(f'dfTenItems, {len(dfTenItems.index)}')

dfJ_Records_TenItems = pd.merge(dfRecords,dfTenItems,on=['compiledRelease/tender/id','aniocsv'],how='left')
print(dfJ_Records_TenItems.head())
print(dfJ_Records_TenItems.describe().T)
print(f'dfJ_Records_TenItems, {len(dfJ_Records_TenItems.index)}')

dfJ_Records_TenItems.to_csv(f'outs/dfJ_Records_TenItems.csv',index=False)