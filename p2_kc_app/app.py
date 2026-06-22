from bottle import *
from sqlite3 import *

def db_setup():

    con = None

    try:

        con = connect("review.db")

        sql = "create table if not exists reviews(id integer primary key autoincrement,name text,review text)"

        cursor = con.cursor()

        cursor.execute(sql)

        con.commit()

    except Exception as e:

        con.rollback()

    finally:

        if con is not None:
            con.close()


db_setup()

application = Bottle()


@application.route("/create", method=["GET", "POST"])
def create():

    if request.method == "POST":

        name = request.forms.get("name")

        review = request.forms.get("review")

        con = None

        try:

            con = connect("review.db")

            sql = "insert into reviews(name,review) values(?,?)"

            cursor = con.cursor()

            cursor.execute(sql, (name, review))

            con.commit()

            msg = "Thank u for the feedback"

            return template("create", msg=msg)

        except Exception as e:

            con.rollback()

            msg = "issue " + str(e)

            return template("create", msg=msg)

        finally:

            if con is not None:
                con.close()

    else:

        return template("create", msg="")


@application.route("/", method=["GET", "POST"])
def home():

    con = None

    try:

        con = connect("review.db")

        sql = "select name,review from reviews"

        cursor = con.cursor()

        cursor.execute(sql)

        data = cursor.fetchall()

        return template("home", msg=data)

    except Exception as e:

        msg = "issue " + str(e)

        print(msg)

        return template("home", msg=msg)

    finally:

        if con is not None:
            con.close()


#run(application, host="localhost", port=4050, debug=True)