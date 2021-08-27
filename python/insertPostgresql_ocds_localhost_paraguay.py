import pandas as pd
import json
from sqlalchemy import create_engine
import dataset
import requests

pathin = '../data/ocds-py/json/'
filein = 'data-example_ocds_2019_releases-2019.json'

with open(pathin+filein, 'r', encoding="utf8") as f:
    data=json.load(f)

def construct_pg_url(postgres_user='postgres', postgres_password='postgres', postgres_host='localhost', postgres_port='5432', postgres_database='postgres'):
    PG_URL = "postgresql://" + postgres_user + ":" + postgres_password + '@' + postgres_host + ':' + postgres_port + '/' + postgres_database
    return PG_URL

pgconn = dataset.Database(
             url=construct_pg_url(),
             schema='public'
)
table = pgconn['ocds_datos']

table.insert(dict(tipo='releases',pais='paraguay',anio=2019,datos=data))

