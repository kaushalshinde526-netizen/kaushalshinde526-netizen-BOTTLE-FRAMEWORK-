from bottle import *
import requests

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():

    if request.method == "POST":

        try:

            amt = float(request.forms.get("amt"))

            url = "https://api.exchangerate-api.com/v4/latest/USD"

            res = requests.get(url)

            data = res.json()

            dollar = data["rates"]["INR"]

            ans = amt * dollar

            msg = "₹ " + str(round(ans, 2))

            return template("home", msg=msg)

        except ValueError:

            msg = "amt should be in numbers only"

            return template("home", msg=msg)

        except Exception as e:

            msg = "issue " + str(e)

            return template("home", msg=msg)

    else:

        return template("home", msg="")

#run(application,host="localhost",port=4050,debug=True,reloader=True)