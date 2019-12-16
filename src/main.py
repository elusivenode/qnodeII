import pyodbc


server = 'curium-prod-db\db01'
db = 'CuriumData_PROD'
connstr = 'Driver={SQL Server};Server=' + server + ';Database=' + db + ';Trusted_Connection=yes;'
conn = pyodbc.connect(connstr)
cursor = conn.cursor()
cursor.execute('select * from Master.AlternateAssetReturns')
for row in cursor:
    print(row)
cursor.close()