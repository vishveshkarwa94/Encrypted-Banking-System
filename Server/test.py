import pymysql
from FlaskServer import decrypt

def fun():
    db = pymysql.connect("localhost", "root", "vrk230794", "bank_database")
    cursor = db.cursor()
    tables = "customer|account".split("|")
    attributes = 'CUST_ID,CUST_TYPE_CD,FIRST_NAME,LAST_NAME|ACCOUNT_ID,AVAIL_BALANCE'.split("|")
    # tables = "customer".split("|")
    # attributes = '*'.split("|")
    header = []
    results = []
    for index in range(len(tables)):
        query = "SELECT " + attributes[index] + " FROM " + tables[index]
        cursor.execute(query)
        result = []
        for row in cursor.fetchall():
            record = []
            for att in row:
                record.append(decrypt(att))
            result.append(record)
        results.append(result)
        for att in attributes[index].split(","):
            header.append(att)
    for index in range(1,len(results)):
        for index2 in range(len(results[0])):
            for att in results[index][index2]:
                results[0][index2].append(att)
    data = results[0]
    print(header)
    print(data)
fun()