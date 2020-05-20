import mysql.connector
import argparse

parser = argparse.ArgumentParser(description='Dial in your coffee.',formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument("tool", help="Data for which tool?\nm=melitta pour over\nfp=french press")
args = parser.parse_args()

if args.tool == 'm' :
    tool_type="melittaPourOver"
elif args.tool=='fp' :
    tool_type="frenchpress"
else :
    tool_type=""

try :
    db = mysql.connector.connect(user='coffee_grams_admin', password='well50',
                                host='localhost',
                                database='coffee_grams')
    print("db accessed")
    cursor=db.cursor()

    cursor.execute("SELECT * FROM melittaPourOver")

    print("melittaPourOver selected")

    for row in cursor.fetchall() :
        print("ID: ",row[0])
        print("Date & Time: ",row[1])
        print("Coffee weight(g): ", row[2])
        print("Water Weight(g):", row[3])
        print("Brew Time: ", row[4])
        print("Coffee Type: ", row[5])


except mysql.connector.Error as e :
    print("Error:",e)

finally :
    if db.is_connected() :
        db.close()
        cursor.close()
        print("db closed")
