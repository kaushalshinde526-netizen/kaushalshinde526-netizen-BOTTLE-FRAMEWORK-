from bottle import *

application=Bottle()

@application.route("/")
def home():
    return template("home")

run(application,port=4050,host="localhost",debug=True,reloader=True)