from bottle import route, run, template, request
import sqlite3

DB_NAME = "bmi.db"


def initialize_database():
    conn = sqlite3.connect(DB_NAME)
    cur = conn.cursor()

    cur.execute("""
        CREATE TABLE IF NOT EXISTS bmi_records(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            age INTEGER NOT NULL,
            gender TEXT NOT NULL,
            weight REAL NOT NULL,
            height REAL NOT NULL,
            bmi REAL NOT NULL,
            category TEXT NOT NULL
        )
    """)

    conn.commit()
    conn.close()


initialize_database()


def get_bmi_category(bmi):
    if bmi < 18.5:
        return "Underweight"
    elif bmi < 25:
        return "Normal Weight"
    elif bmi < 30:
        return "Overweight"
    else:
        return "Obese"


@route('/')
def home():
    return template(
        'index',
        result='',
        error='',
        pdf_file=''
    )


@route('/calculate', method='POST')
def calculate_bmi():

    try:

        name = request.forms.get('name', '').strip()
        age = int(request.forms.get('age', 0))
        gender = request.forms.get('gender', '').strip()
        weight = float(request.forms.get('weight', 0))
        height = float(request.forms.get('height', 0))

        if len(name) < 2:
            return template(
                'index',
                result='',
                error='Please enter a valid name.',
                pdf_file=''
            )

        if age <= 0:
            return template(
                'index',
                result='',
                error='Please enter positive age value.',
                pdf_file=''
            )

        if gender == '':
            return template(
                'index',
                result='',
                error='Please select gender.',
                pdf_file=''
            )

        if weight <= 0:
            return template(
                'index',
                result='',
                error='Please enter positive weight value.',
                pdf_file=''
            )

        if height <= 0:
            return template(
                'index',
                result='',
                error='Please enter positive height value.',
                pdf_file=''
            )

        bmi = round(weight / ((height / 100) ** 2), 2)

        category = get_bmi_category(bmi)

        conn = sqlite3.connect(DB_NAME)
        cur = conn.cursor()

        cur.execute("""
            INSERT INTO bmi_records
            (
                name,
                age,
                gender,
                weight,
                height,
                bmi,
                category
            )
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """,
        (
            name,
            age,
            gender,
            weight,
            height,
            bmi,
            category
        ))

        conn.commit()
        conn.close()

        result = (
            f"Hello {name}! "
            f"Your Body Index (BMI) is {bmi}. "
            f"Category: {category}"
        )

        return template(
            'index',
            result=result,
            error='',
            pdf_file=''
        )

    except ValueError:

        return template(
            'index',
            result='',
            error='Please enter valid numeric values.',
            pdf_file=''
        )

    except Exception:

        return template(
            'index',
            result='',
            error='Something went wrong. Please try again.',
            pdf_file=''
        )


run(
    host='localhost',
    port=4054,
    debug=True,
    reloader=True
)