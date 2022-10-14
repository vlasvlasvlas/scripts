import pyodbc
import json
import requests

conn_str = (
    "DRIVER={PostgreSQL ODBC Driver(ANSI)};"
    "DATABASE=postgres;"
    "UID=postgres;"
    "PWD=postgres;"
    "SERVER=localhost;"
    "PORT=5432;"
)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

cursor.execute(
    """SELECT 

id,
st_x(geom),
st_y(geom)

FROM public.cities
where cntry_name in 
('Brazil','Australia','Canada','United Kingdom')"""
)

print(cursor)
columns = [column[0] for column in cursor.description]

results = []
for row in cursor.fetchall():
    results.append(dict(zip(columns, row)))

for city in results:
    id = city["id"]
    st_x = str(city["st_x"])
    st_y = str(city["st_y"])
    print(id)
    print(st_x)
    print(st_y)

    # request
    url = "https://places.cit.api.here.com/places/v1/autosuggest"
    params = {
        "app_code": "APPCODE",
        "app_id": "APPID",
        "at": st_y + "," + st_x,
        "q": "gas station",
    }

    data = requests.get(url, params=params)
    datain = data.text
    print(data)

    # insert jsondump
    insert_sql = "update public.cities set pois = ? where id = ?"
    cursor = conn.cursor()
    cursor.execute(insert_sql, (datain, id))

    # ejecuta
    cursor.commit()
