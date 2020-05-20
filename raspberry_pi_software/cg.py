import mysql.connector
import time
import sys
import argparse
import RPi.GPIO as GPIO
from hx711 import HX711 #for raspberry pi 3b+ use pin 17 for 3v3, it seems to have much less noise than pin 1
import I2C_LCD_driver

#button macros
BX_on_off = 19
BX_tare = 13
BX_timer = 26
BX_coffee_g = 20
BX_water_g = 21

#button input states for event and callback
IN_on_off=False
IN_timer=False
IN_tare=False
IN_coffee_g=False
IN_water_g=False

#on off vars
onoff_state = False

#timer vars
start_time = 0
brew_time = 0
start_lock = False

#weight vars
coffee_g = 0
water_g = 0

#button callbacks
#use globals b/c callback is on a different thread
def CB_on_off (BX_on_off):
    global IN_on_off
    if args.verbose:
        print("BX_on_off pressed")
    IN_on_off=True

def CB_tare(BX_tare) :
    global IN_tare
    if args.verbose:
        print("BX_tare pressed")
    IN_tare = True

def CB_timer(BX_timer):
    global IN_timer
    if args.verbose:
        print("BX_timer pressed")
    IN_timer=True

def CB_coffee_g(BX_coffee_g):
    global IN_coffee_g
    if args.verbose:
        print("BX_coffee_g pressed")
    IN_coffee_g=True

def CB_water_g(BX_water_g):
    global IN_water_g
    if args.verbose:
        print("BX_water_g pressed")
    IN_water_g=True

if __name__ == "__main__":
    #arge parser
    parser = argparse.ArgumentParser(description='Dial in your coffee.',formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("tool", help="What tool are you using to brew your coffee?\nm=melitta pour over\nfp=french press")
    parser.add_argument("coffee_type", help="What kind of coffee are you drinking?")
    parser.add_argument("-v", "--verbose", help="increase output verbosity",action="store_true")
    args = parser.parse_args()

    if args.tool == 'm' :
        tool_type="melittaPourOver"
    elif args.tool=='fp' :
        tool_type="frenchpress"
    else:
        print("invalid tool type")
        sys.exit()

    #set up buttons
    BX_list = [BX_tare,BX_on_off,BX_timer,BX_coffee_g,BX_water_g]
    CB_list = [CB_tare,CB_on_off,CB_timer,CB_coffee_g,CB_water_g]
    if args.verbose:
        print("setting up buttons")

    GPIO.setmode(GPIO.BCM)#basically the GPIO numbers instead of the physical pin numbers
    GPIO.setup(BX_list, GPIO.IN, pull_up_down=GPIO.PUD_UP)

    for CB,BX in zip(CB_list,BX_list) :
        GPIO.add_event_detect(BX,GPIO.FALLING,callback=CB,bouncetime=200)

    #set up hx711 & loadcell
    if args.verbose:
        print("setting up hx711 & loadcell")

    hx = HX711(5, 6)#DT to 5, SCK to 6 (BCM pins)
    hx.set_reading_format("MSB", "MSB")
    hx.set_reference_unit(-278)
    hx.reset()
    hx.tare()

    #set up lcd
    if args.verbose:
        print("setting up LCD")
    mylcd = I2C_LCD_driver.lcd()
    mylcd.lcd_clear()
    mylcd.backlight(0)

    if args.verbose:
        print("setup complete")

    while True :
        try:
            if IN_on_off:
                onoff_state = not onoff_state
                mylcd.lcd_clear()
                if onoff_state : #system is on
                    hx.power_up()
                    mylcd.backlight(1)
                    mylcd.lcd_display_string("Welcome to",1)
                    mylcd.lcd_display_string("Coffee Grams",2)
                else : #system is off
                    hx.power_down()
                    mylcd.backlight(0)

                    #reset variables
                    coffee_g = 0
                    water_g = 0
                    brew_time = 0
                    start_time = 0
                    start_lock = False

                IN_on_off=False

            if onoff_state :

                #update weight
                # if args.verbose:
                #     print("collecting weight samples")
                # current_weight=0
                # sample_size=4
                # for i in range(sample_size):
                #     current_weight+=hx.get_weight(5)
                # current_weight = current_weight/sample_size
                # current_weight = f"{current_weight:.2f}"

                current_weight = f"{hx.get_weight(5):.2f}"

                #User Interface
                # mylcd.lcd_clear()
                mylcd.lcd_display_string(f"Weight(g): {current_weight}         ",2)
                if args.verbose:
                    print(f"weight: {current_weight}")

                current_time = f"{time.strftime('%m-%d-%Y %H:%M:%S', time.localtime(time.time()))}"
                if start_lock :
                    current_time = f"Timer: {time.strftime('%M:%S', time.localtime(time.time()-start_time-57600))}    "#idk why it kept displaying 16 in the hours position

                mylcd.lcd_display_string(current_time,1)
                if args.verbose:
                    print(current_time)

                #timer start/stop
                if IN_timer:
                    if start_lock:
                        brew_time = time.strftime('%H:%M:%S', time.localtime(time.time() - start_time))
                        mylcd.lcd_display_string("Brew time saved ",1)
                        time.sleep(.5)
                        if args.verbose:
                            print(f"brew time: {brew_time}")
                    else:
                        start_time = time.time()
                    start_lock = not start_lock
                    IN_timer=False

                #tare scale
                if IN_tare:
                    hx.tare()
                    IN_tare=False
                    tare_str = "Scale Tared"
                    # mylcd.lcd_display_string(tare_str+"     ",2)
                    if args.verbose:
                        print(tare_str)

                #record weights
                if IN_coffee_g:
                    coffee_g = float(current_weight)
                    mylcd.lcd_display_string("coffee pushed   ",2)
                    time.sleep(.5)
                    if args.verbose:
                        print(f"coffee weight recorded: {coffee_g}")
                    IN_coffee_g=False


                if IN_water_g:
                    water_g = float(current_weight)
                    mylcd.lcd_display_string("water pushed    ",2)
                    time.sleep(.5)
                    if args.verbose:
                        print(f"water weight recorded: {water_g}")
                    IN_water_g=False

                ID_num = 1
                # coffee_g = 14.1
                water_g = 222.4
                # brew_time = "00:03:43"
                #
                if water_g and coffee_g and brew_time :
                    try :
                        db = mysql.connector.connect(user='coffee_grams_admin', password='well50',
                                                    host='localhost',
                                                    database='coffee_grams')
                        if args.verbose:
                            print("db opened")

                        cursor = db.cursor()

                        insert_stm = "INSERT INTO " + tool_type  + " (ID, datetime, coffee, water, brew_time, type) VALUES (%s, %s, %s, %s, %s, %s)"
                        #change the Database ID back to Auto increment and ID_num to NULL
                        data = (ID_num  ,time.strftime('%Y-%m-%d %H:%M:%S') , coffee_g , water_g , brew_time,args.coffee_type)

                        cursor.execute(insert_stm,data)

                        db.commit()

                        if args.verbose:
                            print("data inserted")

                    except mysql.connector.Error as e :
                        print("Error:",e)

                    finally :
                        coffee_g = 0
                        water_g = 0
                        brew_time = 0
                        if db.is_connected() :
                            db.close()
                            cursor.close()

                            if args.verbose:
                                print("db closed")

        except (KeyboardInterrupt, SystemExit):
            hx.power_down()
            mylcd.lcd_clear()
            mylcd.backlight(0)
            GPIO.cleanup()
            print("exiting")
            sys.exit()
