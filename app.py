from flask import Flask, render_template, request
import mysql.connector
import configparser, os
app = Flask(__name__)

config = configparser.ConfigParser()
config.readfp(open('credentials.config'))


# MySQL connection
cnx = mysql.connector.connect(user=config.get('DBCredentials', 'USER'),
								password=config.get('DBCredentials', 'PASSWORD'),
								host=config.get('DBCredentials', 'HOST'),
								database=config.get('DBCredentials', 'DB') )
# cursor
cursor = cnx.cursor()

def exec_query(q):
	global cursor
	cursor.execute(q)
	return cursor.fetchall()

@app.route('/')
def home():
	return render_template('index.html')

@app.route('/customers')
def customers():
	return render_template('customers.html')

@app.route('/employees')
def employees():
	return render_template('employees.html')

@app.route('/checkin')
def checkin():
	return render_template('checkin.html')

@app.route('/reservation')
def reservation():
	return render_template('reservation.html')

@app.route('/about')
def about():
	return render_template('about.html')

@app.route('/result/<type_of_result>', methods = ['POST', 'GET'])
def result(type_of_result):
	error = True
	if request.method == 'POST':
		result = request.form
		return render_template("result.html",result = result, error=error, type_of_result=type_of_result)

if __name__ == '__main__':
	app.run(debug=True)
