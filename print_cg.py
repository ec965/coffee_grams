import mysql.connector

try :
    db = mysql.connector.connect(user='coffee_grams_admin', password='well50',
                                host='localhost',
                                database='coffee_grams')    
    print("db accessed")
    cursor=db.cursor()

    cursor.execute("SELECT * FROM melittaPourOver")

    print("melittaPourOver selected")

    for row in cursor.fetchall() :
        for i in row:
            print (i)
        print ("\n")


except mysql.connector.Error as e :
    print("Error:",e)

finally :
    if db.is_connected() :
        db.close()
        cursor.close()
        print("db closed")

