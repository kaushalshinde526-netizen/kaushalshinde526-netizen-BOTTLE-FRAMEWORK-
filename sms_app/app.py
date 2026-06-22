from bottle import *
from sqlite3 import *

DB_NAME = "sms.db"


def db_setup():
    con = None

    try:
        con = connect(DB_NAME)

        sql = """
        create table if not exists student(
        rno integer primary key,
        name text,
        marks int
        )
        """

        cursor = con.cursor()
        cursor.execute(sql)

        con.commit()

        print("done")

    except Exception as e:
        con.rollback()
        msg = "issue " + str(e)
        print(msg)

    finally:
        if con is not None:
            con.close()


db_setup()

application = Bottle()


@application.route("/", method=["GET", "POST"])
def home():

    con = None

    try:
        con = connect(DB_NAME)

        sql = "select rno,name,marks from student"

        cursor = con.cursor()
        cursor.execute(sql)

        data = cursor.fetchall()

        return template("home", msg=data)

    except Exception as e:
        msg = "issue " + str(e)
        print(msg)

    finally:
        if con is not None:
            con.close()


@application.route("/create", method=["GET", "POST"])
def create():

    if request.method == "POST":

        con = None

        try:

            rno = int(request.forms.get("rno"))
            name = request.forms.get("name")
            marks = int(request.forms.get("marks"))

            con = connect(DB_NAME)

            sql = "insert into student(rno,name,marks) values(?,?,?)"

            cursor = con.cursor()

            cursor.execute(sql, (rno, name, marks))

            con.commit()

            msg = "record created"

            return template("create", msg=msg)
        except ValueError as e:
            return template("create",msg="enter number only")

        except Exception as e:

            if con is not None:
                con.rollback()

            msg = "issue " + str(e)

            print(msg)

            return template("create", msg=msg)

        finally:

            if con is not None:
                con.close()

    else:

        return template("create", msg="")


@application.route("/delete/<i:int>", method=["GET", "POST"])
def delete(i):

    con = None

    try:

        con = connect(DB_NAME)

        sql = "delete from student where rno=?"

        cursor = con.cursor()

        cursor.execute(sql, (i,))

        con.commit()

    except Exception as e:

        con.rollback()

        msg = "issue " + str(e)

        print(msg)

    finally:

        if con is not None:
            con.close()

    redirect("/")


@application.route("/update/<i:int>", method=["GET", "POST"])
def update(i):

    if request.method == "POST":

        name = request.forms.get("name")

        marks = int(request.forms.get("marks"))

        con = None

        try:

            con = connect(DB_NAME)

            sql = "update student set name=?, marks=? where rno=?"

            cursor = con.cursor()

            cursor.execute(sql, (name, marks, i))

            con.commit()

        except Exception as e:

            con.rollback()

            msg = "issue " + str(e)

            print(msg)

        finally:

            if con is not None:
                con.close()

        redirect("/")

    else:

        con = None

        try:

            con = connect(DB_NAME)

            sql = "select rno,name,marks from student where rno=?"

            cursor = con.cursor()

            cursor.execute(sql, (i,))

            data = cursor.fetchone()

            return template("update", msg=data)

        except Exception as e:

            msg = "issue " + str(e)

            print(msg)

        finally:

            if con is not None:
                con.close()


run(application, host="localhost", port=4050, debug=True, reloader=True)