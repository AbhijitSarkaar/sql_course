use sqldb;


create table customers(
	id int auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    
    primary key(id)
);

create table orders(
	id int auto_increment,
    order_date date,
    amount decimal(8, 2),
    customer_id int,
    
    primary key(id),
    foreign key(customer_id) references customers(id)
    on delete cascade
);

drop table customers;
drop table orders;

show tables;


insert into customers(first_name, last_name, email) 
values	
	('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'michael@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'davis@gmail.com');
    
insert into orders(order_date, amount, customer_id)
values
	('2016-02-10', 99.99, 1),
    ('2017-11-11', 35.50, 1),
    ('2014-12-12', 800.67, 2),
    ('2015-01-03', 12.50, 2),
    ('1999-04-11', 450.25, 5);

select * from customers;
select * from orders;

insert into orders(order_date, amount, customer_id)
values 
	('2022-11-11', 99.99, 7);


select first_name, last_name, sum(amount)
from customers
join orders  
	on customers.id = orders.customer_id
group by first_name, last_name;


select *
from customers
left join orders
	on customers.id = orders.customer_id;

select first_name, last_name, ifnull(sum(amount), 0) as money_spent
from customers
left join orders
	on orders.customer_id = customers.id
group by first_name, last_name;


-- exercises --

create table students (
	id int auto_increment,
    first_name varchar(50) not null,
    
    primary key(id)
);

create table papers(
	title varchar(50) not null,
    grade int,
    student_id int,
    
    foreign key(student_id) references students(id)
    on delete cascade
);

select * from students;

select * from papers;


select first_name, title, grade
from students
join papers
	on students.id = papers.student_id
order by grade desc;


select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0)
from students
left join papers
	on students.id = papers.student_id;


select first_name, ifnull(avg(grade), '0') as average, 
	case
		when avg(grade) >= 75 then 'PASSING'
        else 'FAILING'
    end as passing_status
from students
left join papers
	on students.id = papers.student_id
group by first_name
order by average desc;





















