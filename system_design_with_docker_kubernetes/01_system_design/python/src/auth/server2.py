from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSOWRD'] = 'password'
app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_DB'] = 'try_flask'

app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/employee', methods=['GET','POST'])
def employee():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM employee''')
        results = cur.fetchall()
    return jsonify(results)
## i saw everywhere app started at then end of app.py


if __name__ == '__main__':
    app.run(debug=True)