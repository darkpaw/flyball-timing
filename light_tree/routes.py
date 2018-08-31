import time
import arrow
from light_tree import app
from .utils import response_template
from settings import conf
from flask import jsonify
from multiprocessing import Process, Lock

if conf.LEFT_TREE_DEV_TYPE == "TREE_DEV_DUMMY":
    from .dummy_dev import set_led_red_off, set_led_red_on
if conf.LEFT_TREE_DEV_TYPE == "TREE_DEV_OMEGA_DOCK_RGBLED":
    from .omega_dock import set_led_red_off, set_led_red_on

left_tree_lock = Lock()


@app.route('/')
@app.route('/index')
def index():
    t = time.time()
    rt = response_template()
    rt["device_time"] = str(arrow.get(t))
    rt["time"] = str(t)
    rt["code"] = "https://github.com/darkpaw/flyball-timing"
    rt["version"] = "0.1"

    return jsonify(rt)


@app.route('/local_time')
def local_time():
    t = time.time()
    print(arrow.get(t))

    rt = response_template()
    rt["device_time"] = str(arrow.get(t))
    rt["time"] = str(t)

    return jsonify(rt)


def detached_start_sequence(start_at: float):

    got_lock = left_tree_lock.acquire(block=False)
    if not got_lock:
        print("Failed to acquire lock...")
        return

    t = time.time()
    print("Start detached in 3")
    time.sleep(1)
    print("Start detached in 2")
    time.sleep(1)
    print("Start detached in 1")
    time.sleep(1)
    print("Start!!")
    set_led_red_on()
    time.sleep(1)
    set_led_red_off()

    left_tree_lock.release()


@app.route('/start')
def start():

    try:
        global p
        p = Process(target=detached_start_sequence, args=(time.time(),))
        p.start()
        success = True
    except Exception as e:
        success = False

    t = time.time()
    print(arrow.get(t))

    rt = response_template()
    rt["device_time"] = str(arrow.get(t))
    rt["status"] = "success" if success else "failed"

    return jsonify(rt)

