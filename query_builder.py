from datetime import date, datetime, timedelta
from flask import Flask, render_template, request, flash
import mysql.connector
import configparser, os
config = configparser.ConfigParser()
config.readfp(open('credentials.config'))
global cnx
cnx = mysql.connector.connect(user=config.get('DBCredentials', 'USER'),
								password=config.get('DBCredentials', 'PASSWORD'),
								host=config.get('DBCredentials', 'HOST'),
								database=config.get('DBCredentials', 'DB') )
global cusror
cursor = cnx.cursor(dictionary=True)

def reservation_query(hotel_room_id, start_date, finish_date, customer_irs_number):
	return '''INSERT INTO eHOTELS.Reserves (`HotelRoomID`, `StartDate`, `FinishDate`, `CustomerIRSNumber`) VALUES
				('{}', '{}', '{}', '{}');
			'''.format(hotel_room_id, start_date, finish_date, customer_irs_number)

def kl(data):
	wheress=[]
	simea=0
	for key, val in data.items():
		if val == '': continue
		if(key=='StartDate'):
			dt1=val#datetime.strptime(val,'%d-%m-%Y')

		if(key=='FinishDate'):
			dt2=val#datetime.strptime(val,'%d-%m-%Y')

	tmp1 = "StartDate BETWEEN '{}' AND '{}'".format(dt1,dt2)
	simea=1
	wheress.append(tmp1)
	tmp1 = "FinishDate BETWEEN '{}' AND '{}'".format(dt1,dt2)
	simea=1
	wheress.append(tmp1)
	lista=[]
	if(simea==1):
		wheress = ' or '.join(wheress)
		query1='SELECT HotelRoomID FROM Rents WHERE '
		query=query1+wheress
		"""print(query)
		cursor=cnx.cursor()
		cursor.execute(query)
		ro=cursor.fetchall()
		if(len(ro)!=0):
			for i in ro:
				for j in i:
					lista.append(int(j))
	return lista"""
		return query
	else:
		return 0



def build_join_query(data, flag=0, lista=''):#=[]):
	query = 'SELECT HR.HotelRoomID, HR.HotelID,HR.Price,HR.Capacity,HR.View,H.Stars,H.City,H.Street,H.StreetNumber,H.PostalCode FROM HotelRoom AS HR INNER JOIN Hotel AS H ON HR.HotelID=H.HotelID INNER JOIN Amenities AS A ON A.HotelRoomID=HR.HotelRoomID WHERE '
	wheres = []
	simea=0
	for key, val in data.items():
		if val == '': continue
		if(key=='H.NumberOfRooms'):
			tmp = "H.NumberOfRooms = {}".format(val)
			wheres.append(tmp)
			simea=1
		if(key=='HotelGroupID'):
			tmp = "H.HotelGroupID = {}".format(val)
			wheres.append(tmp)
			simea=1
		if (key=='MinimumPrice'):
			tmp="HR.Price >= {}".format(val)
			wheres.append(tmp)
			simea=1
		if(key=='MaximumPrice'):
			tmp="HR.Price <= {}".format(val)
			wheres.append(tmp)
			simea=1
		if(key=='MinimumStars'):
			tmp = "H.Stars >= {}".format(val)
			wheres.append(tmp)
			simea=1
		if(key=='MaximumStars'):
			tmp = "H.Stars <= {}".format(val)
			wheres.append(tmp)
			simea=1


		if(key=='View'):
			tmp = "HR.{} = '{}'".format(key, val)
			wheres.append(tmp)
			simea=1
		if(key=='Capacity'):
			tmp = "HR.{} = {}".format(key, val)
			wheres.append(tmp)
			simea=1
		if(key=='City'):
			tmp = "H.{} = '{}'".format(key, val)
			wheres.append(tmp)
			simea=1

		if(key=='NumberOfRooms'):
			lista11 = lista.replace("Rents", "Reserves")
			tmp67 = 'SELECT HotelID FROM Hotel HAVING ((SELECT COUNT(HR.HotelRoomID) AS num FROM HotelRoom AS HR INNER JOIN Hotel AS H on H.HotelID=HR.HotelID WHERE HR.HotelRoomID NOT IN (' + lista + ')' ' AND HR.HotelRoomID NOT IN ('+lista11+'))   >= {})'.format(val)
			#wheres.append(tmp)
			#simea=1
		if(key=='AC'):
			tmp = "A.Amenity = 'AC'"#.format(val)
			tmp="HR.HotelRoomID IN (SELECT HotelRoomID FROM Amenities WHERE Amenity='AC')"
			wheres.append(tmp)
			simea=1
		if(key=='Sauna'):
			tmp = "A.Amenity = 'Sauna'"
			tmp="HR.HotelRoomID IN (SELECT HotelRoomID FROM Amenities WHERE Amenity='Sauna')"
			wheres.append(tmp)
			simea=1
		if(key=='2WC'):
			tmp = "A.Amenity = '2WC'"
			tmp="HR.HotelRoomID IN (SELECT HotelRoomID FROM Amenities WHERE Amenity='2WC')"
			wheres.append(tmp)
			simea=1
		if(key=='Massage'):
			tmp = "A.Amenity = 'Massage'"
			tmp="HR.HotelRoomID IN (SELECT HotelRoomID FROM Amenities WHERE Amenity='Massage')"
			wheres.append(tmp)
			simea=1

	wheres = ' and '.join(wheres)
	wheres = wheres + ' and H.HotelID IN (' + tmp67 +')'
	if (flag==1 and simea==1):
		wheres = wheres + ' and HR.HotelRoomID NOT IN ('+ lista+')'
		lista11 = lista.replace("Rents", "Reserves")
		wheres = wheres + ' and HR.HotelRoomID NOT IN ('+ lista11+')'
	elif(flag==1):
		wheres = wheres + 'HR.HotelRoomID NOT IN ('+lista+')'
		lista11 = lista.replace("Rents", "Reserves")
		wheres = wheres + ' and HR.HotelRoomID NOT IN ('+ lista11+')'
	wheres = wheres + ';'
	return query + wheres


def build_search_query(data, tbl = 'Customers'):
	query = 'SELECT * from eHOTELS.{} where '.format(tbl)
	wheres = []
	for key, val in data.items():
		print(key, val)
		if val == '': continue
		tmp = "{} = '{}'".format(key, val)
		wheres.append(tmp)
	wheres = ' and '.join(wheres) + ';'

	return query + wheres


def build_insert_query(data, tbl='Customers'):
	query = 'INSERT INTO eHOTELS.{} '.format(tbl)
	res = {}
	for key, val in data.items():
		if val == '': raise Exception('Not a valid insertion')
		if key in ['Emails', 'Phones']:
			continue
		res[key] = "'{}'".format(val)
	cols = '({})'.format(', '.join(res.keys()))
	d = '({})'.format(', '.join(res.values()))

	return query + cols + ' VALUES ' + d + ';'

def build_insert_query_email(id, email, tbl='HotelGroup'):
	query = "INSERT INTO eHOTELS.{}EmailAddress ({}ID, EmailAddress) VALUES ('{}','{}');".format(tbl, tbl, id, email)
	return query

def build_insert_query_phone_number(id, phone, tbl='HotelGroup'):
	query = "INSERT INTO eHOTELS.{}PhoneNumbers ({}ID, PhoneNumber) VALUES ('{}','{}');".format(tbl, tbl, id, phone)
	return query

def build_edit_query(data, tbl='Customers', id = None):
	query = 'UPDATE eHOTELS.{} SET '.format(tbl)
	res = []
	for key, val in data.items():
		if val != '': res.append("{} = '{}'".format(key, val))

	res = ', '.join(res)
	if tbl in ['Employee', 'Customer']:
		pk = 'IRSNumber'
	elif tbl == 'Hotel':
		pk = 'HotelID'
	elif tbl == 'HotelRoom':
		pk = 'HotelRoomID'
	elif tbl == 'HotelGroup':
		pk = 'HotelGroupID'
	where = ' WHERE {} = {};'.format(pk, id)
	return query + res + where

def build_edit_prequery(tbl='Customers', id = None):
	query = 'SELECT * from eHOTELS.{} '.format(tbl)
	if tbl in ['Employee', 'Customer']:
		pk = 'IRSNumber'
	elif tbl == 'Hotel':
		pk = 'HotelID'
	elif tbl == 'HotelRoom':
		pk = 'HotelRoomID'
	elif tbl == 'HotelGroup':
		pk = 'HotelGroupID'
	where = ' WHERE {} = {};'.format(pk, id)
	return query +  where

def build_name_query(first_name, last_name):
	query = "SELECT IRSNumber, FirstName, LastName FROM eHOTELS.Customer where FirstName = '{}' and LastName = '{}';".format(first_name, last_name)
	return query

def build_search_reservation(reservation_id):
	query = "SELECT * FROM eHOTELS.Reserves where ReservationID = '{}';".format(reservation_id)
	return query

def build_checkin_query_from_reservation(data, employee_irs_number, price=None, method=None):
	query = "INSERT INTO eHOTELS.Rents (CustomerIRSNumber, EmployeeIRSNumber, HotelRoomID, StartDate, FinishDate, PaymentAmount, PaymentMethod) VALUES ('{}','{}','{}','{}','{}','{}','{}');".format(data['CustomerIRSNumber'], employee_irs_number, data['HotelRoomID'], data['StartDate'], data['FinishDate'], price, method)
	return query

def get_price_query(hotel_room_id):
	query = "SELECT HotelRoomID, Price from eHOTELS.HotelRoom where HotelRoomID = '{}';".format(hotel_room_id)
	return query

def get_phone_numbers(id, tbl='HotelGroupPhoneNumbers'):
	id_name = 'HotelGroupID' if tbl == 'HotelGroupPhoneNumbers' else 'HotelID'
	query = "SELECT PhoneNumber from eHOTELS.{} where {} ='{}';".format(tbl, id_name, id)
	return query

def get_emails(id, tbl='HotelGroupEmailAddress'):
	id_name = 'HotelGroupID' if tbl == 'HotelGroupEmailAddress' else 'HotelID'
	query = "SELECT EmailAddress from eHOTELS.{} where {} ='{}';".format(tbl, id_name, id)
	return query
