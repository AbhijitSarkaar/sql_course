





show index 
from table_name;



create fulltext index index_name
on table_name(column_name);

select column_name
from table_name
where match(column_name) against(value);



create index index_name
on table_name(column_name);



drop index index_name
on table_name;
