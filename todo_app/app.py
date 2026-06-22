from bottle import *
from sqlite3 import *
from datetime import *

DB_NAME="todo.db"

def db_setup():
    con=None
    try:
        con=connect(DB_NAME)
        sql="create table if not exists tasks(id integer primary key autoincrement,task text unique,taskdt text)"
        cursor=con.cursor()
        cursor.execute(sql)
        con.commit()
        print("done")
    except Exception as e:
        con.rollback()
        msg="issue"+str(e)
        print(msg)
    finally:
        if con is not None:
            con.close()
db_setup()
application=Bottle()
@application.route("/",method=["GET","POST"])
def home():
        if request.method=="POST":
            task=request.forms.get("task")
            con=None
            try:
                con=connect(DB_NAME)
                sql="insert into tasks(task,taskdt)values(?,?)"
                cursor=con.cursor()
                dt=datetime.now()
                dt=dt.strftime("%Y-%m-%d %H:%M:%S")
                cursor.execute(sql,(task,str(dt)))
                con.commit()
            except Exception as e:
                con.rollback()
                msg="issue"+str(e)
                print(msg)
                return template("home",msg=msg)
            finally:
                if con is not None:
                    con.close()
                redirect("/")
        else:
            con=None
            try:
                con=connect(DB_NAME)
                sql="select id,task,taskdt from tasks"
                cursor=con.cursor()
                cursor.execute(sql)
                data=cursor.fetchall()
                return template("home",msg=data)
            except Exception as e:
                msg="issue"+str(e)
                print(msg)
            finally:
                if con is not None:
                    con.close()
@application.route("/delete/<i:int>",method=["GET","POST"])
def delete(i):
    con=None
    try:
        con=connect(DB_NAME)
        sql="delete from tasks where id =?"
        cursor=con.cursor()
        cursor.execute(sql,(i,))
        con.commit()
    except Exception as e:
        con.rollback()
        msg="issue"+str(e)
        print(msg)
    finally:
        if con is not None:
            con.close()
    redirect("/")
#run(application,host="localhost",port=4050,debug=True,reloader=True)

