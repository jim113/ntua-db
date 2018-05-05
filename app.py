from flask import Flask, render_template, request, flash, abort
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

global is_admin
is_admin = False;



def exec_query(q, refresh = True, commit = False, kl=''):
	global cnx
	global cursor
	if refresh: cnx.cmd_refresh(mysql.connector.RefreshOption.LOG | mysql.connector.RefreshOption.THREADS)
	cursor.execute(q,kl)
	if not commit:
		return cursor.fetchall()
	else:
		cnx.commit()
		return {}

def create_list(q):
	ddict = exec_query(q)
	result = []
	for x in ddict:
		for k, v in x.items():
			result.append(v)
	return result;

def check_admin(h):
	global is_admin
	if is_admin : return render_template(h)
	else: return render_template('admin_error.html')


@app.route('/')
def home():
	return render_template('index.html')


@app.route('/login', methods=['POST', 'GET'])
def login():
	global is_admin
	if request.method == 'GET':
		return render_template('login.html')

	elif request.method == 'POST':
		if request.form['password'] == 'admin' and request.form['username'] == 'admin':
			is_admin = True
			return render_template('index.html')
		else:
			print('wrong password!')
			return render_template('login.html')

@app.route('/logout')
def logout():
	global is_admin
	r = False
	if is_admin:
		is_admin = False
		r = True
	return render_template('logout.html', r=r)

@app.route('/customers')
def customers():
	return check_admin('customers.html')

@app.route('/employees')
def employees():
	return check_admin('employees.html')

@app.route('/hotels')
def hotels():
	return check_admin('hotels.html')

@app.route('/checkin')
def checkin():
	return render_template('checkin.html')

@app.route('/reservation', methods=['POST', 'GET'])
def reservation():
	if request.method == 'GET':
		amenities = create_list('SELECT DISTINCT Amenity FROM eHOTELS.Amenities;')
		views = create_list('SELECT DISTINCT View FROM eHOTELS.HotelRoom;')
		print('Amenities are: ', views)
	elif request.method == 'POST':
		result = result.form
		# edo vazeis query
	return render_template('reservation.html', amenities=amenities, views=views)

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

@app.route('/welcome')
def welcome():
	return 'Welcome!'


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
