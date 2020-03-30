import mysql.connector
import time
import argparse

parser = argparse.ArgumentParser(description='Dial in your coffee.')

tool_type = "melittaPourOver"
ID_num = 1

try :
    db = mysql.connector.connect(user='coffee_grams_admin', password='well50',
                                host='localhost',
                                database='coffee_grams')    
    print("db opened")
    
    cursor = db.cursor()
    
    insert_stm = "INSERT INTO " + tool_type  + " (ID, datetime, coffee, water, type) VALUES (NULL, %s, %s, %s, %s)"
    data = (ID_num  ,time.strftime('%Y-%m-%d %H:%M:%S') , 14.1 , 222.4 , 'Anchorhead Narwhal')

    cursor.execute(insert_stm,data)
    
    db.commit()

    print("data inserted")

except mysql.connector.Error as e :
    print("Error:",e)

finally :
    if db.is_connected() :
        db.close()
        cursor.close()
        print("db closed")

