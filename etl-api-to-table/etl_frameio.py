import requests
import configparser
import psycopg2
from sql_queries import drop_table_queries, create_table_queries

def drop_tables(cur, conn):
    """
    The function to drop table
    
    Parameters:
        cur  : The cursor that will be used to execute queries.
        conn : The connection towards current connecting database.
    """
    
    for query in drop_table_queries:
        print(query)
        cur.execute(query)
        conn.commit()
        
def create_tables(cur, conn):
    """
    The function to create database
    
    Parameters:
        cur  : The cursor that will be used to execute queries.
        conn : The connection towards current connecting database.
    """
    
    for query in create_table_queries:
        print(query)
        cur.execute(query)
        conn.commit()

def main():
    
    # read the configs
    config = configparser.ConfigParser()
    config.read('configs.cfg')

    # get database connectivity details
    conn = psycopg2.connect("host={} dbname={} user={} password={} port={}".format(*config['DB'].values()))
    cur = conn.cursor()
    
    # drop table if exists
    drop_tables(cur, conn)
    
    # create table
    create_tables(cur, conn)

    # get the API creds
    account_id = config.get('API', 'ACCOUNT_ID')
    token = config.get('API', 'TOKEN')
   
    # build the request
    api_url = "https://api.frame.io/v2/accounts/{}/audit_logs".format(account_id)
    headers = {"Authorization": "Bearer {}".format(token)}
    
    # query the api and get back the result
    response = requests.get(api_url, headers=headers)
    
    # filter the result and write that out to the database
    data = response.json()
    
    # print the results for now
    for item in data:
        if item['action'] in ('CommentCreated', 'AssetCreated'):
            print('''User ID: {}, action: {}, item_type: {}, inserted_at: {}'''.format( 
                                                       item['id'],
                                                       item['action'],
                                                       item['item_type'],
                                                       item['inserted_at']
                                                      ))
if __name__ == '__main__':
    main()