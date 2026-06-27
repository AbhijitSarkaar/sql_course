
-- create table from schema 
create table table2 
like table1;

desc table2;

-- insert data 
insert table2 
select * from table1;

select count(*) 
from table2;

