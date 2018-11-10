from .onionGpio import OnionGpio
import time

LED_RED_PIN = 0
LED_ORANGE_1_PIN = 1
LED_ORANGE_2_PIN = 2
LED_ORANGE_3_PIN = 3
LED_GREEN_PIN = 18


class FiveLedDLightTreeDev(object):

    def _get_omega_pin(self, pin: int):
        gpio = OnionGpio(pin)
        gpio.setOutputDirection()
        return gpio

    def _led_on(self, pin: int):
        print("pin %d on" % pin)
        t1 = time.time()
        gp = self._get_omega_pin(pin)
        gp.setValue(1)
        t2 = time.time()
        print(t2-t1)

    def _led_off(self, pin: int):
        print("pin %d off" % pin)
        t1 = time.time()
        gp = self._get_omega_pin(pin)
        gp.setValue(0)
        t2 = time.time()
        print(t2-t1)

    def set_led_red_off(self):
        self._led_off(LED_RED_PIN)

    def set_led_red_on(self):
        self._led_on(LED_RED_PIN)

    def set_led_green_off(self):
        self._led_off(LED_GREEN_PIN)

    def set_led_green_on(self):
        self._led_on(LED_GREEN_PIN)

    def set_led_orange_1_off(self):
        self._led_off(LED_ORANGE_1_PIN)

    def set_led_orange_1_on(self):
        self._led_on(LED_ORANGE_1_PIN)

    def set_led_orange_2_off(self):
        self._led_off(LED_ORANGE_2_PIN)

    def set_led_orange_2_on(self):
        self._led_on(LED_ORANGE_2_PIN)

    def set_led_orange_3_off(self):
        self._led_off(LED_ORANGE_3_PIN)

    def set_led_orange_3_on(self):
        self._led_on(LED_ORANGE_3_PIN)

