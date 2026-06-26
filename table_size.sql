select table_name, data_length
from information_schema.tables
where 
	table_schema = 'service_db'
    and table_name = 'products';