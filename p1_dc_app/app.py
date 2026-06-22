from bottle import *
application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():
    if request.method == "POST":
        try:
            distance = float(request.forms.get("distance"))
            if distance > 0:
                src = request.forms.get("src")
                dest = request.forms.get("dest")
                if src == "km":
                    if dest == "km":
                        ans = distance
                        msg = str(distance) + " km = " + str(ans) + " km"
                    elif dest == "m":
                        ans = distance * 1000
                        msg = str(distance) + " km = " + str(ans) + " m"
                elif src == "m":
                    if dest == "km":
                        ans = distance / 1000
                        msg = str(distance) + " m = " + str(ans) + " km"
                    elif dest == "m":
                        ans = distance
                        msg = str(distance) + " m = " + str(ans) + " m"
                return template("home", msg=msg)
            else:
                msg = "distance shud be > 0"
                return template("home", msg=msg)
        except ValueError:
            msg = "distance shud be in numbers only"
            return template("home", msg=msg)

    else:
        return template("home", msg="")

run(application, port=4052, host="localhost", debug=True, reloader=True)
