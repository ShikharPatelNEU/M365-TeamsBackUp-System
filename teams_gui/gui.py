import urllib.parse
import sqlalchemy as db
import sys


def get_table_headers(engine, table_name='teams'):
    try:
        metadata = db.MetaData()
        census = db.Table(table_name, metadata, autoload_with=engine)
        headers = census.columns.keys()
        print(headers)
        return headers
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


def get_table_data(engine, table_name='teams'):
    try:
        metadata = db.MetaData()
        table = db.Table(table_name, metadata, autoload_with=engine)
        connection = engine.connect()
        query = db.select(table.columns)
        res_proxy = connection.execute(query)
        all_rows = res_proxy.fetchall()
        return all_rows
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


password_encoded = urllib.parse.quote_plus("Password@123")
connection_string = f"mssql+pymssql://sa:{password_encoded}@localhost:1433/teams"
engine = db.create_engine(connection_string)
connection = engine.connect()

headers = get_table_headers(engine, 'sites')

rows = get_table_data(engine, 'sites')
