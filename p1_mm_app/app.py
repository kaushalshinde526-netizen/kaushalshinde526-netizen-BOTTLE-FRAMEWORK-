from bottle import *
import requests

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():

    if request.method == "POST":

        try:
            url = "https://zenquotes.io/api/random"

            res = requests.get(url)

            data = res.json()

            msg = data[0]['q']

            aut = data[0]['a']

            return template("home", msg=msg, aut=aut)

        except Exception as e:

            msg = "issue " + str(e)

            return template("home", msg=msg, aut="")

    else:

        return template("home", msg="", aut="")

#run(application,host="localhost",port=4050,debug=True,reloader=True)