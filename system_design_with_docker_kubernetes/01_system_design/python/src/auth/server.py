import jwt, datetime, os
from flask import Flask, request
from flask_mysqldb import MySQL

server = Flask(__name__)
mysql = MySQL(server)

# config
# server.config["MYSQL_HOST"] = os.environ.get("MYSQL_HOST")
# print(server.config["MYSQL_HOST"])


## i saw everywhere app started at then end of app.py
# if __name__ == '__main__':
#     server.run(debug=True)
    # server.config["MYSQL_HOST"] = os.environ.get("MYSQL_HOST")
    # print(server.config["MYSQL_HOST"])
