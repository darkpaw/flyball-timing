# flyball-timing


First find Onion's IP address from router devices list.

From Onion console:

cd code/flyball-timing


export FLASK_APP=light_tree.py
export FLASK_ENV=development

flask run --host=0.0.0.0

Flask server will start on port 5000

Now request pages:

e.g. 

http://192.168.1.106:5000

http://192.168.1.106:5000/local_time

http://192.168.1.106:5000/start

http://192.168.1.106:5000/stop