from bottle import *
import requests

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():

    if request.method == "POST":

        try:

            amt = float(request.forms.get("amt"))

            src = request.forms.get("src")

            dest = request.forms.get("dest")

            url = "https://api.exchangerate-api.com/v4/latest/" + src

            res = requests.get(url)

            data = res.json()

            rate = data["rates"][dest]

            ans = amt * rate

            msg = str(amt) + " " + src + " = " + str(round(ans, 2)) + " " + dest

            return template("home", msg=msg)

        except ValueError:

            msg = "Amount should be in numbers only"

            return template("home", msg=msg)

        except Exception as e:

            msg = "Issue: " + str(e)

            return template("home", msg=msg)

    else:

        return template("home", msg="")

#run(application,host="localhost",port=4050,debug=True,reloader=True)