from flask import Flask, render_template, request, flash
import mysql.connector
import configparser, os
from query_builder import *
app = Flask(__name__)

config = configparser.ConfigParser()
config.readfp(open('credentials.config'))


# MySQL connection
global cnx
cnx = mysql.connector.connect(user=config.get('DBCredentials', 'USER'),
								password=config.get('DBCredentials', 'PASSWORD'),
								host=config.get('DBCredentials', 'HOST'),
								database=config.get('DBCredentials', 'DB') )
global cusror
cursor = cnx.cursor(dictionary=True)

global link_tables
link_tables = {
	'customer' : 'Customer',
	'employee' : 'Employee'
}


def exec_query(q, refresh = True, commit = False):
	global cnx
	global cursor
	if refresh: cnx.cmd_refresh(mysql.connector.RefreshOption.LOG | mysql.connector.RefreshOption.THREADS)
	cursor.execute(q)
	if not commit:
		return cursor.fetchall()
	else:
		cnx.commit()
		return []

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


# Returns search results
@app.route('/result/<type_of_result>', methods = ['POST', 'GET'])
def result(type_of_result):
	global link_tables
	error = False
	search_results = []
	print(link_tables)
	try:
		tbl = link_tables[type_of_result]
	except KeyError:
		print ("Key error")
		tbl = ''

	if request.method == 'POST':
		result = request.form

		if all([x == '' for x in result.values()]):
			error = True
		else:
			query = build_search_query(result, tbl)
			print(result)
			try:
				search_results = exec_query(query, refresh=False)
				print('Found {} matches:'.format(len(search_results)))
				print(search_results)
			except:
				error = True


		return render_template("result.html",result = result, search_results = search_results, number_of_results = len(search_results), error=error, type_of_result=type_of_result)

@app.route('/result/<type_of_result>/delete/<irs_number>')
def result_delete(type_of_result, irs_number):
	global link_tables
	error = False
	try:
		tbl = link_tables[type_of_result]
	except KeyError:
		print ('Wrong')
		tbl = ''

	try:
		query = "DELETE FROM eHOTELS.{} where IRSNumber = '{}';".format(tbl, irs_number)
		exec_query(query, refresh=True, commit=True)
	except: error = True

	return render_template("result_delete.html", irs_number = irs_number, type_of_result = type_of_result, error=error)



if __name__ == '__main__':
	app.run(debug=True, use_reloader=True, ssl_context='adhoc')
