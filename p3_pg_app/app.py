from bottle import *
from random import choice

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():
    if request.method == "POST":
        try:
            plength = int(request.forms.get("plength"))
            if plength >= 6 and plength <= 12:
                text = "abcdefghijklmnopqrstuvwxyz"
                if "uc" in request.forms:
                    text = text + text.upper()
                if "di" in request.forms:
                    text = text + "0123456789"
                if "sp" in request.forms:
                    text = text + "!@#$%^&*():<>"
                
                text = list(text)
                pw = ""
                for i in range(plength):
                    pw = pw + choice(text)
                msg = "password = " + str(pw)
                return template("home", msg=msg)
            else:
                msg = "plength shud be between 6 and 12"
                return template("home", msg=msg)
        except ValueError:
            msg = "password length shud be in numbers only"
            return template("home", msg=msg)
            
    else:
        return template("home", msg="")

#run(application, port=4052, host="localhost", debug=True, reloader=True)
