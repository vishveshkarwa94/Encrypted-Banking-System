from FlaskServer import encrypt
import pymysql


def createAdmin(id, password, role):
    db = pymysql.connect("localhost", "root", "vrk230794", "bank_database")
    cursor = db.cursor()
    query = "INSERT INTO adminlogindetails VALUES (\'" + encrypt(id) + "\',\'"+ encrypt(password) + "\',\'" +encrypt(role)+"\')"
    cursor.execute(query)
    cursor.close()
    db.commit()
    db.close()


id = "mil"
password = "01"
role = "3"
createAdmin(id,password, role)
