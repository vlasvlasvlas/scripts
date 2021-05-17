import pandas as pd
from sqlalchemy import create_engine
from pandas_profiling import ProfileReport

engine = create_engine('postgresql://usuario:password@localhost:5432/database')

tablas = ['tabla1','vista2']

for tabla in tablas:
    print(tabla)

    df = pd.read_sql_query('select * from '+tabla,con=engine)
    print(df)

    profile = ProfileReport(df, title=tabla+" profile", minimal=True)
    profile.to_file(tabla+".html")
