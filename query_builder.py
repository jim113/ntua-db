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
