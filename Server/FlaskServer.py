
from flask import Flask, request, render_template, flash
import pymysql
import datetime
import sys
from datetime import date
from Crypto.Cipher import AES
from base64 import b64encode, b64decode


# Key for encryption and decription
key = b'-<EN@E;p\xea40|sj\xc7Im\x93}\x17\xde\x8d\xbaV\x1e\xb6ml\xc9\x1e\x96\xd6'


# Function to encrypt data
def encrypt(string):
    if string == "":
        return ""
    cipher = AES.new(key, AES.MODE_SIV)
    text, tag = cipher.encrypt_and_digest(string.encode())
    return b64encode(text).decode() + "|" + b64encode(tag).decode()


# Function to decrypt data
def decrypt(string):
    if string == "":
        return ""
    text, tag = string.split("|")
    text = b64decode(text.encode())
    tag = b64decode(tag.encode())
    cipher = AES.new(key, AES.MODE_SIV)
    return cipher.decrypt_and_verify(text, tag).decode()


# Add months to date
def addmonths(date, months):
    return str(date + datetime.timedelta(days=months*30))


# App initialisation
app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
file = open('AccCustID')
customerId = decrypt(file.readline())
accountID = decrypt(file.readline())
transactID = decrypt(file.readline())
file.close()
db = pymysql.connect("localhost", sys.argv[1], sys.argv[2], "bank_database")


# Home Page
@app.route('/')
def home():
    return render_template('login.html')


# Sign up page
@app.route('/signup')
def signup():
    return render_template('index.html')


# Terms and Conditions
@app.route('/terms')
def terms():
    cursor = db.cursor()
    query = "SELECT * FROM datainfo"
    cursor.execute(query)
    data = []
    for row in cursor.fetchall():
        data.append([row[0], row[1], row[2]])
    return render_template('conditions.html', data=data)


# Function to handel Account Creation page
@app.route('/createAccount', methods=['POST', 'GET'])
def accountCreation():
    fname = str(request.form['fname'])
    lname = str(request.form['lname'])
    id = str(request.form['id'])
    pwd = str(request.form['pwd'])
    address = str(request.form['address'])
    city = str(request.form['city'])
    state = str(request.form['state'])
    zip = str(request.form['zip'])
    ssn = str(request.form['ssn'])
    phone_number = str(request.form['phone-number'])
    dob = str(request.form['dob'])
    accType = str(request.form['accType'])
    global customerId, accountID;

    # Checking if username exits
    cursor = db.cursor()
    query = "SELECT * FROM logindetails WHERE id = \'" + encrypt(id) + "\'"
    cursor.execute(query)
    ifexists = cursor.fetchall()
    if len(ifexists) != 0:
        return "User Name Taken Try Again !!"

    # store login credentials
    query = "INSERT INTO logindetails VALUES(\'" + encrypt(id) + "\',\'" + encrypt(pwd) + "\',\'" + encrypt(customerId) + "\')"
    cursor.execute(query)
    # store customer details

    query = (
                " INSERT INTO customer(`CUST_ID`,`ADDRESS`,`CITY`,`CUST_TYPE_CD`,`SSN`,`POSTAL_CODE`,`STATE`,"
                "`FIRST_NAME`,`LAST_NAME`,`PHONE_NUMER`,`DOB`) VALUES(\'"+ encrypt(customerId)+"\',\'"
                + encrypt(address) + "\',\'"
                + encrypt(city) + "\',\'" + encrypt(accType)
                + "\',\'" + encrypt(ssn) + "\',\'" + encrypt(zip) + "\',\'" + encrypt(state) + "\',\'"
                + encrypt(fname) + "\',\'" + encrypt(lname) + "\',\'" + encrypt(phone_number) + "\',\'"
                + encrypt(dob) + "\')"
        )
    cursor.execute(query)

    query = (" INSERT INTO `account` (`ACCOUNT_ID`, `AVAIL_BALANCE`, `CLOSE_DATE`, `LAST_ACTIVITY_DATE`, `OPEN_DATE`,"
             + " `STATUS`, `CUST_ID`) VALUES ( \'" + encrypt(accountID) + "\',\' " + encrypt('0') + "\', NULL , \'"
             + encrypt(str(date.today())) + "\',\'" + encrypt(str(date.today())) + "\',\'" + encrypt("OPEN") + "\',\'"
             + encrypt(customerId) + "\')")

    cursor.execute(query)

    query = ("INSERT INTO `expirydate` (`custID`,`attribute`,`expiryDate`) VALUES "
             "(\'" + encrypt(customerId) + "\',\'ADDRESS\',\'" + addmonths(datetime.date.today(), 50) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'CITY\',\'" + addmonths(datetime.date.today(), 50) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'SSN\',\'" + addmonths(datetime.date.today(), 100) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'POSTAL_CODE\',\'" + addmonths(datetime.date.today(), 50) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'STATE\',\'" + addmonths(datetime.date.today(), 50) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'FIRST_NAME\',\'" + addmonths(datetime.date.today(), 100) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'LAST_NAME\',\'" + addmonths(datetime.date.today(), 100) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'PHONE_NUMER\',\'" + addmonths(datetime.date.today(), 100) + "\'),"
             "(\'" + encrypt(customerId) + "\',\'DOB\',\'" + addmonths(datetime.date.today(), 100) + "\')"
             )

    cursor.execute(query)
    db.commit()
    customerId = str(int(customerId) + 1);
    accountID = str(int(accountID)+1);
    updatefile()
    cursor.close()
    flash("Account Successfully Created !!")
    return render_template('login.html')


# Function to handel login page
@app.route('/login', methods=['POST', 'GET'])
def login():
    # Fetch user name and password
    uname = str(request.form['uname'])
    pwd = str(request.form['pwd'])
    acctype = str(request.form['accType'])
    cursor = db.cursor()
    if acctype == 'C':
        # Query password from database
        cursor.execute("SELECT password,custID FROM logindetails WHERE id = \'" + encrypt(uname) + "\'")
        result = cursor.fetchone()
        if result is None:
            flash("Wrong UID")
            return render_template('login.html')
        password = decrypt(result[0])
        custID = decrypt(result[1])
        # Check if passwords match
        if password == pwd:
            cursor.execute("SELECT ACCOUNT_ID,AVAIL_BALANCE FROM account WHERE CUST_ID = \'" + encrypt(custID) + "\'")
            result = cursor.fetchone()
            cursor.execute(
                "SELECT TXN_ID,AMOUNT,TXN_DATE,TXN_TYPE FROM acc_transaction WHERE ACCOUNT_ID = \'" + result[0] + "\'")
            trans = []
            for row in cursor.fetchall():
                record = [decrypt(row[0]), decrypt(row[1]), decrypt(row[2]), decrypt(row[3])]
                trans.append(record)
            cursor.close()
            return render_template("customer.html", accno=decrypt(result[0]), balance=decrypt(result[1]), trans=trans
                                   , custid=custID)
        cursor.close()
        flash("Invalid User Name and Password Combination !!")
        return render_template('login.html')

    else:
        cursor.execute("SELECT password,roleid FROM adminlogindetails WHERE id = \'" + encrypt(uname) + "\'")
        result = cursor.fetchone()
        if result is None:
            flash("Wrong UID")
            return render_template('login.html')
        password = decrypt(result[0])
        # Check if passwords match
        if password == pwd:
            role = decrypt(result[1])
            return adminlogin(uname, role)
        flash("Invalid User Name and Password Combination !!")
        return render_template('login.html')


# Query Transaction records
@app.route('/transact/<custid>', methods=['POST', 'GET'])
def transact(custid):
    amount = str(request.form['amt'])
    transactType = str(request.form['type'])
    accID = str(request.form['accno'])
    global transactID

    cursor = db.cursor()
    query = "SELECT AVAIL_BALANCE FROM account WHERE ACCOUNT_ID = \'" + encrypt(accID) + "\'"
    cursor.execute(query)
    balance = int(decrypt(cursor.fetchone()[0]))
    print(balance)
    if balance < int(amount) and transactType == 'with':
        cursor.close()
        flash("Insufficient Balance!!")
        return render_template("transfer.html", accno = accID , balance = balance, custid=custid)
    # Insert transaction in database
    query = "INSERT INTO acc_transaction (`TXN_ID`, `AMOUNT`, `TXN_DATE`, `TXN_TYPE`, `ACCOUNT_ID`) " \
            "VALUES (\'" + encrypt(transactID) + "\',\'" + encrypt(amount) + "\',\'" + encrypt(str(date.today())) + "\',\'" + encrypt(transactType) + "\',\'" + encrypt(accID) + "\')"
    cursor.execute(query)

    if transactType == 'with':
        balance = balance - int(amount)
    else:
        balance = balance + int(amount)

    # Update account balance
    query = "UPDATE account SET AVAIL_BALANCE = \'" + encrypt(str(balance)) + "\', LAST_ACTIVITY_DATE = \'" + encrypt(str(date.today()))+ "\' WHERE ACCOUNT_ID = \'" + encrypt(accID) + "\'"
    cursor.execute(query)
    db.commit()
    cursor.close()
    transactID = str(int(transactID)+1)
    updatefile()
    flash("Success!!")
    return render_template("transfer.html", accno=accID , balance=balance, custid=custid)


# Open Transaction page
@app.route('/opentransact/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def opentransferpage(custid, accno, balance):
    return render_template("transfer.html", accno=accno, balance=balance, custid=custid)


# Open Account Info page
@app.route('/opentaccinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def openaccinfopage(custid, accno, balance):
    cursor= db.cursor()
    cursor.execute(
        "SELECT TXN_ID,AMOUNT,TXN_DATE,TXN_TYPE FROM acc_transaction WHERE ACCOUNT_ID = \'" + encrypt(accno) + "\'")
    trans = []
    for row in cursor.fetchall():
        record = [decrypt(row[0]), decrypt(row[1]), decrypt(row[2]), decrypt(row[3])]
        trans.append(record)
    cursor.close()
    return render_template("customer.html", accno=accno, balance=balance, trans=trans, custid = custid)


# Get User Info
@app.route('/userinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def myinfo(custid, accno, balance):
    cursor = db.cursor()
    cursor.execute("SELECT * FROM customer WHERE cust_id = \'"+encrypt(custid)+"\'")
    result = cursor.fetchone()
    address = decrypt(result[1])
    city = decrypt(result[2])
    cust_type = decrypt(result[3])
    ssn = decrypt(result[4])
    postal_code = decrypt(result[5])
    state = decrypt(result[6])
    fname = decrypt(result[7])
    lname = decrypt(result[8])
    phone = decrypt(result[9])
    dob = decrypt(result[10])
    return render_template('view_info.html', address=address, city=city, ssn=ssn, postal_code=postal_code, state=state,
                           fname=fname, lname=lname, phone=phone, dob=dob, custid=custid, accno=accno, balance=balance)


# Route Update Info
@app.route('/routeupdateinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def routeupdateinfo(custid,accno,balance):
    return render_template('update_info.html',custid=custid, accno=accno,balance=balance)


# Route Update Info
@app.route('/updateinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def updateinfo(custid,accno,balance):
    checklist = request.form.getlist('ip')
    cursor = db.cursor()
    for att in checklist:
        query = "UPDATE customer SET " + att + " = \'"+ encrypt(str(request.form[att])) +"\' WHERE cust_id = \'" + encrypt(custid) + "\'"
        cursor.execute(query)
    cursor.close()
    flash("Data Successfully Updated !!")
    return openaccinfopage(custid, accno, balance)


# Route Delete User Info
@app.route('/routedeleteinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def routedeleteinfo(custid,accno,balance):
    return render_template('delete-info.html',custid=custid,accno=accno,balance=balance)


# Delete User Info
@app.route('/deleteinfo/<custid>/<accno>/<balance>', methods=['POST', 'GET'])
def deleteinfo(custid,accno,balance):
    checklist = request.form.getlist('ip')
    cursor = db.cursor()
    for att in checklist:
        query = "UPDATE customer SET "+att+" = \'\' WHERE cust_id = \'" + encrypt(custid) + "\'"
        cursor.execute(query)
    cursor.close()
    db.commit()
    flash("Data Successfully deleted !!")
    return openaccinfopage(custid,accno,balance)


# Function to redirect to admin home page.
def adminlogin(uname, role):
    # Query password from database
    cursor = db.cursor()
    query = "SELECT tables, access FROM roles WHERE roleid = " + role
    print(query)
    cursor.execute(query)
    result = cursor.fetchone()
    tables = str(result[0]).split("|")
    attributes = str(result[1]).split("|")
    results = []
    headers = []
    for index in range(len(tables)):
        query = "SELECT " + attributes[index] + " FROM " + tables[index]
        cursor.execute(query)
        result = []
        for row in ursor.fetchall():
            record = []
            for att in row:
                record.append(decrypt(att))
            result.append(record)
        results.append(result)
        for att in attributes[index].split(","):
            headers.append(att)

    for index in range(1, len(results)):
        for index2 in range(len(results[0])):
            for att in results[index][index2]:
                results[0][index2].append(att)

    data = results[0]

    return render_template('admin.html', headers=headers, data=data, role=role, uname=uname)


# Old info deletion
@app.route('/deleteolddata/<uname>/<role>', methods=['POST', 'GET'])
def hypdelete(uname, role):
    if role == "1":
        cursor = db.cursor()
        cursor.execute("SELECT * FROM expirydate WHERE  CURRENT_DATE() > expiryDate")
        result = cursor.fetchall()
        ids = []
        for row in result:
            ids.append(row[0])
            query = "UPDATE customer SET " + row[2] + " = \'\' WHERE cust_id = \'" + row[1] + "\'"
            cursor.execute(query)
        for id in ids:
            cursor.execute("DELETE FROM expirydate WHERE id = " + id)
        flash("Successfully Deleted The Expired Data.")
        db.commit()
    else:
        flash("Not Authorised !!")
    return adminlogin(uname, role)

# function to update text file with latest account number, customer id and transaction number
def updatefile():
    file = open('AccCustID', 'w')
    file.truncate()
    file.write(encrypt(str(customerId)))
    file.write("\n")
    file.write(encrypt(str(accountID)))
    file.write("\n")
    file.write(encrypt(str(transactID)))
    file.close()


# Main Function
if __name__ == '__main__':
    app.run()
    db.close()

