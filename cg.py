import mysql.connector
import time
import sys
import argparse
import RPi.GPIO as GPIO
from hx711 import HX711
import I2C_LCD_driver


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
    else :
        tool_type=""

    #set up the pins
    BX_on_off = 19
    BX_tare = 13
    BX_timer = 26
    BX_coffee_g = 20
    BX_water_g = 21

    BX_list = [BX_tare, BX_on_off, BX_timer, BX_coffee_g, BX_water_g]

    if args.verbose:
        print("setting up buttons")

    GPIO.setmode(GPIO.BCM)#basically the GPIO numbers instead of the physical pin numbers
    GPIO.setup(BX_list, GPIO.IN, pull_up_down=GPIO.PUD_UP)

    if args.verbose:
        print("setting up hx711 & loadcell")

    hx = HX711(5, 6)#DT to 5, SCK to 6 (BCM pins)
    hx.set_reading_format("MSB", "MSB")
    hx.set_reference_unit(-278)
    hx.reset()
    hx.tare()

    if args.verbose:
        print("setting up LCD")
    mylcd = I2C_LCD_driver.lcd()
    mylcd.lcd_clear()
    mylcd.backlight(0)

    #on off vars
    onoff_state = False

    #timer vars
    start_time = 0
    brew_time = 0
    start_lock = False

    #weight vars
    coffee_g = 0
    water_g = 0

    if args.verbose:
        print("setup complete")

    while True :
        try:
            IN_on_off = GPIO.input(BX_on_off)

            if not IN_on_off:
                onoff_state = not onoff_state
                mylcd.lcd_clear()
                if onoff_state == True :
                    mylcd.backlight(1)
                    mylcd.lcd_display_string("Welcome to",1)
                    mylcd.lcd_display_string("Coffee Grams",2)
                else :
                    mylcd.backlight(0)
                    coffee_g = 0
                    water_g = 0
                    start_time = 0
                    brew_time = 0
                    start_lock = False
                time.sleep(0.5)

            if onoff_state :

                #read button states
                IN_timer = GPIO.input(BX_timer)
                IN_tare = GPIO.input(BX_tare)
                IN_coffee_g = GPIO.input(BX_coffee_g)
                IN_water_g = GPIO.input(BX_water_g)

                #update weight
                current_weight = f"{hx.get_weight(5):.2f}"

                #User Interface
                # mylcd.lcd_clear()
                mylcd.lcd_display_string(f"Weight(g): {current_weight}         ",2)
                if args.verbose:
                    print(f"weight: {current_weight}")

                current_time = time.time()
                if start_lock :
                    current_time = time.time()-start_time-57600 #idk why it kept displaying 16 in the hours position

                mylcd.lcd_display_string(f"{time.strftime('%H:%M:%S', time.localtime(current_time))}             ",1)
                if args.verbose:
                    print(f"{time.strftime('%H:%M:%S', time.localtime(current_time))}")

                #timer start/stop
                if not IN_timer:
                    if start_lock:
                        brew_time = time.strftime('%H:%M:%S', time.localtime(time.time() - start_time))
                        if args.verbose:
                            print(f"brew time: {brew_time}")
                    else:
                        start_time = time.time()
                    start_lock = not start_lock
                    time.sleep(0.5)

                #tare scale
                if not IN_tare:
                    hx.tare()
                    time.sleep(0.5)

                #record weights
                if not IN_coffee_g:
                    coffee_g = float(current_weight)
                    mylcd.lcd_display_string("coffee pushed   ",2)
                    time.sleep(0.5)
                    if args.verbose:
                        print(f"coffee weight recorded: {coffee_g}")

                if not IN_water_g:
                    water_g = float(current_weight)

                    mylcd.lcd_display_string("water pushed    ",2)
                    time.sleep(0.5)
                    if args.verbose:
                        print(f"water weight recorded: {water_g}")



                # ID_num = 1
                # coffee_g = 14.1
                # water_g = 222.4
                # brew_time = "00:03:43"
                #
                #if water_g and coffee_g and brew_time :
                    # try :
                    #     db = mysql.connector.connect(user='coffee_grams_admin', password='well50',
                    #                                 host='localhost',
                    #                                 database='coffee_grams')
                    #     if args.verbose:
                    #         print("db opened")
                    #
                    #     cursor = db.cursor()
                    #
                    #     insert_stm = "INSERT INTO " + tool_type  + " (ID, datetime, coffee, water, brew_time, type) VALUES (%s, %s, %s, %s, %s, %s)"
                    #     data = (ID_num  ,time.strftime('%Y-%m-%d %H:%M:%S') , coffee_g , water_g , brew_time,args.coffee_type)
                    #
                    #     cursor.execute(insert_stm,data)
                    #
                    #     db.commit()
                    #
                    #     if args.verbose:
                    #         print("data inserted")
                    #
                    # except mysql.connector.Error as e :
                    #     print("Error:",e)
                    #
                    # finally :
                    #     if db.is_connected() :
                    #         db.close()
                    #         cursor.close()
                    #
                    #         if args.verbose:
                    #             print("db closed")

        except (KeyboardInterrupt, SystemExit):
            mylcd.lcd_clear()
            mylcd.backlight(0)
            GPIO.cleanup()
            print("exiting")
            sys.exit()
