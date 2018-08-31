import time


class DummyLightTreeDev(object):

    def _led_on(self, pin: str):
        t1 = time.time()
        print("%s ON" % pin)
        t2 = time.time()
        print(t2-t1)

    def _led_off(self, pin: str):
        t1 = time.time()
        print("%s OFF" % pin)
        t2 = time.time()
        print(t2-t1)

    def set_led_red_off(self):
        self._led_off("RED")

    def set_led_red_on(self):
        self._led_on("RED")

    def set_led_green_off(self):
        self._led_off("GREEN")

    def set_led_green_on(self):
        self._led_on("GREEN")

    def set_led_blue_off(self):
        self._led_off("BLUE")

    def set_led_blue_on(self):
        self._led_on("BLUE")




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