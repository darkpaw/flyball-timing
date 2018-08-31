from flask import Flask

app = Flask(__name__)

from light_tree import routes

