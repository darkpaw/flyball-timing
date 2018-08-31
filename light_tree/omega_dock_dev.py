from .onionGpio import OnionGpio
import time

LED_RED_PIN = 17
LED_GREEN_PIN = 16
LED_BLUE_PIN = 15


class DockRGBLightTreeDev(object):

    def _get_omega_pin(self, pin: int):
        gpio = OnionGpio(pin)
        gpio.setOutputDirection()
        return gpio

    def _led_on(self, pin: int):
        t1 = time.time()
        gp = self._get_omega_pin(pin)
        gp.setValue(0)
        t2 = time.time()
        print(t2-t1)

    def _led_off(self, pin: int):
        t1 = time.time()
        gp = self._get_omega_pin(pin)
        gp.setValue(1)
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

    def set_led_blue_off(self):
        self._led_off(LED_BLUE_PIN)

    def set_led_blue_on(self):
        self._led_on(LED_BLUE_PIN)


