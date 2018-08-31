from omega_gpio import OmegaGPIO
import time

LED_RED_PIN = 17
LED_GREEN_PIN = 16
LED_BLUE_PIN = 15


def _get_omega():
    omega = OmegaGPIO()
    omega.pins = (0, 1, 6, 7, 8, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 26)
    return omega


def set_led_red_off():
    t1 = time.time()
    omega = _get_omega()
    omega.pin_off(LED_RED_PIN)
    t2 = time.time()
    print(t2-t1)
    # omega.get_pin(5)  # returns 1
    # omega.pin_off(5)


def set_led_red_on():
    t1 = time.time()
    omega = _get_omega()
    omega.pin_on(LED_RED_PIN)
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