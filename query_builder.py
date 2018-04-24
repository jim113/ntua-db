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

def kl(data):
	wheress=[]
	simea=0
	for key, val in data.items():
		if val == '': continue
		if(key=='StartDate'):
			dt1=datetime.strptime(val,'%d-%m-%Y')
			tmp1 = "{} >= '{}'".format(key, dt1)
			simea=1
			wheress.append(tmp1)
		if(key=='FinishDate'):
			dt2=datetime.strptime(val,'%d-%m-%Y')
			tmp1 = "{} <= '{}'".format(key, dt2)
			simea=1
			wheress.append(tmp1)
	lista=[]
	if(simea==1):
		wheress = ' and '.join(wheress) + ';'
		query1='SELECT HotelRoomID FROM Rents WHERE '
		query=query1+wheress
		print(query)
		cursor=cnx.cursor()
		cursor.execute(query)
		ro=cursor.fetchall()
		if(len(ro)!=0):
			for i in ro:
				for j in i:
					lista.append(int(j))
	return lista



def build_join_query(data, flag=0, lista=[]):
	query = 'SELECT * FROM HotelRoom AS HR INNER JOIN Hotel AS H ON HR.HotelID=H.HotelID WHERE '
	wheres = []
	simea=0
	for key, val in data.items():
		if val == '': continue
		
		if(key=='Capacity' or key=='Price' or key=='View' or key=='Expandable' or key=='RepairsNeed'):
			tmp = "HR.{} = '{}'".format(key, val)
			wheres.append(tmp)
			simea=1
		if(key=='Stars' or key=='City' or key=='HotelGroupID' or key=='NumberOfRooms'):
			tmp = "H.{} = '{}'".format(key, val)
			wheres.append(tmp)
			simea=1
			
	wheres = ' and '.join(wheres)
	
	if (flag==1 and simea==1):
		wheres = wheres + 'and HR.HotelRoomID NOT IN (%s)'
	elif(flag==1):
		wheres = wheres + 'HR.HotelRoomID NOT IN (%s)'
	wheres = wheres + ';'
	return query + wheres


def build_search_query(data, tbl = 'Customers'):
	query = 'SELECT * from eHOTELS.{} where '.format(tbl)
	wheres = []
	for key, val in data.items():
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
		res[key] = "'{}'".format(val)
	cols = '({})'.format(', '.join(res.keys()))
	d = '({})'.format(', '.join(res.values()))

	return query + cols + ' VALUES ' + d + ';'
