from onionGpio import OnionGpio
import time

LED_RED_PIN = 17
LED_GREEN_PIN = 16
LED_BLUE_PIN = 15


def _get_omega_pin(pin: int):
    gpio = OnionGpio(pin)
    gpio.setOutputDirection()
    return gpio


def set_led_red_off():
    t1 = time.time()
    gp = _get_omega_pin(LED_RED_PIN)
    gp.setValue(1)
    t2 = time.time()
    print(t2-t1)


def set_led_red_on():
    t1 = time.time()
    gp = _get_omega_pin(LED_RED_PIN)
    gp.setValue(0)
    t2 = time.time()
    print(t2-t1)

