create database sqldb;
use sqldb;


create table people(
	name varchar(50),
    birthdate date,
    birthtime time,
    birthdt datetime
);

select * from people;
truncate table people;

select curdate();
select curtime();
select now();

insert into people(name, birthdate, birthtime, birthdt)
	values ('jason', '2000-12-25', '11:00:00', '2000-12-25 11:00:00'),
    ('john', '1990-11-25', '9:45:10', '1990-11-25 9:45:10'),
    ('jane', '1980-10-25', '23:59:00', '1980-10-25 23:59:00'),
    ('hazel', curdate(), curtime(), now()); 

select 
	birthdate, 
    birthtime,
    day(birthdate), 
    year(birthdate),
    dayname(birthdate), 
    dayofweek(birthdate), 
    monthname(birthdate),
    hour(birthtime),
    minute(birthtime),
    second(birthtime)
from people;


select date_format(birthdate, '%M %d %Y')
from people;

select birthdt, date_format(birthdt, '%h %i %s')
from people;

select datediff(curdate(), birthdt)
from people;

select date_add(birthdate, interval 1 day) 
from people;

select birthdt, date_add(birthdt, interval 1 hour)  
from people;

select date_sub(birthdate, interval 1 day) 
from people;

select birthdt, date_sub(birthdt, interval 1 hour)  
from people;

select timediff(curtime(), '07:00:00')
from people;

create table captions (
	text varchar(150),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

insert into captions(text) 
	values ('caption text 1'), 
    ('caption text 2');

update captions
set text = 'caption text 3'
where text = 'caption text 1';

select * from captions;

drop table captions;


-- exercises ---

select curtime();

select curdate();

select dayofweek(curdate());

select dayname(curdate());

select date_format(curdate(), '%m/%d/%Y');

select date_format(curtime(), '%M %D at %h:%i');

















     
