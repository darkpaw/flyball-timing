import time


def set_led_red_off():
    t1 = time.time()
    print("RED OFF")
    t2 = time.time()
    print(t2-t1)


def set_led_red_on():
    t1 = time.time()
    print("RED ON")
    t2 = time.time()
    print(t2-t1)
    # omega.get_pin(5)  # returns 1
    # omega.pin_off(5)

#
# import omega_gpio
# import time
#
# # initialize the pin
# gpioNum = 26
# omega_gpio.initpin(gpioNum,'in')
#
# # perform 12 reads, each 5 seconds apart
# for i in range (0, 12):
# 	print 'GPIO%d value: %d'%(gpioNum, omega_gpio.readinput(gpioNum) )
# 	time.sleep(5)
#
# # release the pin
# omega_gpio.closepin(gpioNum,'out')