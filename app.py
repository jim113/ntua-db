from flask import Flask, render_template, request, flash
import mysql.connector
import configparser, os
from query_builder import *
app = Flask(__name__)

config = configparser.ConfigParser()
config.readfp(open('credentials.config'))


# MySQL connection
cnx = mysql.connector.connect(user=config.get('DBCredentials', 'USER'),
								password=config.get('DBCredentials', 'PASSWORD'),
								host=config.get('DBCredentials', 'HOST'),
								database=config.get('DBCredentials', 'DB') )
# cursor
cursor = cnx.cursor(dictionary=True)

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
	error = False
	if type_of_result == 'customer':
		tbl = 'Customer'
	elif type_of_result == 'employee':
		tbl = 'Employee'

	if request.method == 'POST':
		result = request.form

		if all([x == '' for x in result.values()]):
			error = True
			search_results = {}
		else:
			query = build_search_query(result, tbl)
			print(result)
			try:
				search_results = exec_query(query)
				print('Found {} matches:'.format(len(search_results)))
				print(search_results)
			except:
				error = True


		return render_template("result.html",result = result, search_results = search_results, number_of_results = len(search_results), error=error, type_of_result=type_of_result)



if __name__ == '__main__':
	app.run(debug=True)
