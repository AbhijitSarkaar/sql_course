

-- named constraints --

create table users(
	name varchar(150) not null,
    
    phone varchar(15) not null unique,
    
    age int,
    
    address varchar(50) not null,
    
    constraint age_over_18
    check (age > 18),
    
    constraint name_address
    unique (name, address)
);

drop table users;

insert into users(name, phone, age, address, cell_no) 
	values ('abc', '3242324412', 123, '', '123123123');

select * from users;

-- alter table --

alter table users
add column cell_no varchar(15) not null;

alter table users
rename column cell_no to cell_number;

alter table users
modify column cell_number varchar(16);

alter table users
change column cell_number cell_no varchar(15);

alter table users
add constraint cell_no_constraint
check (length(address) > 1);

alter table users
drop constraint cell_no_constraint;

alter table users
drop column cell_no;

select *
from information_schema.key_column_usage
where table_name='users';

desc users;


