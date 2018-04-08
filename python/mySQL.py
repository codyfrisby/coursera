# -*- coding: utf-8 -*-
"""
Connect to mysql data base and then extrac the data into a dataframe.

"""
import mysql.connector
import pandas as pd

# connect using unix_socket args
config = {'user': 'root', 
          'password': 'root', 
          'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock',
          'database': 'Cody_DWH',
          'raise_on_warnings': True}

conn = mysql.connector.connect(**config)
#dir(link)

sql = "SELECT * FROM solar;"

# pandas is awesome for pulling SQL :)!
df = pd.read_sql(sql, con=conn)
print(df)
#df.dtypes # data types in the data frame


######################## load some new data ########################
dataFeb = ('february', 18.75, 214, 462.48)
dataMar = ('march', 4.03, 46, 673.81)

sqlSend = "INSERT INTO solar (month, charges, util, solar) VALUES(%s, %s, %s, %s);"

#sqlDelete = "DELETE FROM solar WHERE charges = 18.75;"

###### Push data to SQL database configured in config/conn ##########
cursor = conn.cursor() # connection cursor
cursor.execute(sqlSend, dataFeb) # execute the SQL statement
conn.commit() # commit the transaction!
#cursor.execute(sqlDelete)

# close the connection
conn.close()
