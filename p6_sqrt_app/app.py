#squareroot with js
from bottle import *
from datetime import *

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():
    if request.method == "POST":
        try:
            num = float(request.forms.get("num"))
            if num >= 0:
                ans = num ** 0.5
                msg = "square root of " + str(num) + " is " + str(round(ans,2))
            else:
                msg = "number shud be >= 0"
            return template("home", msg=msg)
        except ValueError:
            msg = "please enter numbers only"
            return template("home", msg=msg)
    else:
        return template("home", msg="")

run(application, host="localhost", port=4052, debug=True, reloader=True)
