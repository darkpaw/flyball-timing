from onionGpio import OnionGpio
import time

LED_RED_PIN = 17
LED_GREEN_PIN = 16
LED_BLUE_PIN = 15


def _get_omega_pin(pin: int):
    gpio = OnionGpio(pin)
    gpio.setOutputDirection()
    return gpio


def _led_on(pin: int):
    t1 = time.time()
    gp = _get_omega_pin(pin)
    gp.setValue(1)
    t2 = time.time()
    print(t2-t1)


def _led_off(pin: int):
    t1 = time.time()
    gp = _get_omega_pin(pin)
    gp.setValue(0)
    t2 = time.time()
    print(t2-t1)


def set_led_red_off():
    _led_off(LED_RED_PIN)


def set_led_red_on():
    _led_on(LED_RED_PIN)


def set_led_green_off():
    _led_off(LED_GREEN_PIN)


def set_led_green_on():
    _led_on(LED_GREEN_PIN)


def set_led_blue_off():
    _led_off(LED_BLUE_PIN)


def set_led_blue_on():
    _led_on(LED_BLUE_PIN)



