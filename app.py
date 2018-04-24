from flask import Flask, render_template, request, flash
import mysql.connector
import configparser, os
from query_builder import *
from datetime import date, datetime, timedelta
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
	'employee' : 'Employee',
	'hotel' : 'Hotel'
}


def exec_query(q, refresh = True, commit = False,kl=''):
	global cnx
	global cursor
	if refresh: cnx.cmd_refresh(mysql.connector.RefreshOption.LOG | mysql.connector.RefreshOption.THREADS)
	cursor.execute(q,kl)
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

@app.route('/hotels')
def hotels():
	return render_template('hotels.html')

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
@app.route('/checkin_result/<type_of_result>', methods = ['POST', 'GET'])
def checkin_result(type_of_result):
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
			lista=kl(result)
			if(len(lista)!=0):
				query = build_join_query(result,1,lista)
			else:
				query = build_join_query(result,0,lista)
			print(result)

			try:
				if(len(lista)!=0):
					in_p=', '.join(list(map(lambda x: '%s', lista)))
					query = query % in_p				
					print(query)
					cursor.execute(query,lista)
					search_results=cursor.fetchall()
				else:
					print(query)
					search_results = exec_query(query, refresh=False,kl=lista)
				print('Found {} matches:'.format(len(search_results)))
				print(search_results)
			except:
				error = True


		return render_template("checkin_result.html",result = result, search_results = search_results, number_of_results = len(search_results), error=error, type_of_result=type_of_result)


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

@app.route('/create/<type_of_result>', methods=['GET', 'POST'])
def create(type_of_result):
	global link_tables
	error = False
	tbl = link_tables[type_of_result]
	error_log = ''

	if request.method == 'GET':
		print('GET')
	elif request.method == 'POST':
		print('POST')
		result = request.form
		try:
			query = build_insert_query(result, tbl)
			print('Insert query is \n' + query)
			exec_query(q = query, commit = True)
		except Exception as e:
			error = True
			error_log = str(e)
			print(error_log)
			print('There was an error in insertion')

	return render_template("person_create.html", type_of_result=type_of_result, error=error, tbl = tbl, error_log = error_log)


if __name__ == '__main__':
	app.run(debug=True, use_reloader=True, ssl_context='adhoc')
