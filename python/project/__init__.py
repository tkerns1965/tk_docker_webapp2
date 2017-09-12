from flask import Flask

app = Flask(__name__)

from peewee import MySQLDatabase

database = MySQLDatabase('timesheets', **{'unix_socket': '/mariadb/socket/mariadb.sock', 'user': 'tony', 'password': '2hard4u'})

# import project.views
