users_table_drop = "DROP TABLE IF EXISTS users"

users_table_create= ("""CREATE TABLE IF NOT EXISTS users (
                                  user_id VARCHAR(1024),
                                  action VARCHAR
                                  );
                     """)

drop_table_queries = [users_table_drop]
create_table_queries = [users_table_create]