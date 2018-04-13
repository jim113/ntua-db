def build_search_query(data, tbl = 'Customers'):
	query = 'SELECT * from eHOTELS.{} where '.format(tbl)
	wheres = []
	for key, val in data.items():
		if val == '': continue
		tmp = "{} = '{}'".format(key, val)
		wheres.append(tmp)
		wheres = ' and '.join(wheres) + ';'


		return query + wheres
