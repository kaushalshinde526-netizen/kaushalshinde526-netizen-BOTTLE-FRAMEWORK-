from bottle import *
from sqlite3 import *
from datetime import *

def db_setup():
        con = None
        try:
                con = connect("auth.db")
                sql = "create table if not exists users(un varchar(30) primary key, pw varchar(100), dt text)"

                cursor = con.cursor()
                cursor.execute(sql)
                con.commit()
                print("done")
        except Exception as e:
                print("issue ", e)
                con.rollback()
        finally:
                if con is not None:
                        con.close()

db_setup()

application = Bottle()

@application.route("/", method=["GET", "POST"])
def home():
        un = request.get_cookie("un", secret="kamalsir")
        if un == None:
                redirect("/login")
        else:
                if request.method == "POST":
                        response.delete_cookie("un")
                        redirect("/login")
                else:
                        return template("home", msg=un)

@application.route("/signup", method=["GET", "POST"])
def signup():
        if request.method == "POST":

                un = request.forms.get("un")
                pw = request.forms.get("pw")
                cpw = request.forms.get("cpw")

                if pw != cpw:
                        msg = "passwords did not match"
                        return template("signup", msg=msg)

                try:
                        con = connect("auth.db")
                        sql = "select * from users where un = ?"
                        cursor = con.cursor()
                        cursor.execute(sql, (un,))
                        data = cursor.fetchone()

                        if data:
                                msg = str(un) + " already exists"
                                return template("signup", msg=msg)

                        else:
                                sql = "insert into users(un, pw, dt) values(?, ?, ?)"
                                cursor = con.cursor()
                                dt = datetime.now()
                                cursor.execute(sql, (un, pw, str(dt)))
                                con.commit()
                                msg = "registration done"
                                return template("signup", msg=msg)

                except Exception as e:
                        msg = "issue " + str(e)
                        return template("signup", msg=msg)

                finally:
                        if con is not None:
                                con.close()

        else:
                return template("signup", msg="")

@application.route("/login", method=["GET", "POST"])
def login():

        if request.method == "POST":

                un = request.forms.get("un")
                pw = request.forms.get("pw")

                con = None

                try:
                        con = connect("auth.db")

                        sql = "select * from users where un = ? and pw = ?"

                        cursor = con.cursor()

                        cursor.execute(sql, (un, pw))

                        data = cursor.fetchone()

                        if data:

                                response.set_cookie("un", un, secret="kamalsir")

                        else:

                                msg = "login failed"

                                return template("login", msg=msg)

                except Exception as e:

                        msg = "issue " + str(e)

                        return template("login", msg=msg)

                finally:

                        if con is not None:

                                con.close()

                redirect("/")

        else:

                return template("login", msg="")

#run(application, host="localhost", port=4050, debug=True, reloader=True)