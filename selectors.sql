create database booksdb;

use booksdb;

select * from books;

-- unique combinations --

select distinct 
	concat(author_fname,' ',author_lname) 
    as full_name
from books;

select distinct author_fname, author_lname 
from books;

-- order of rows --

select title, pages
from books
order by pages desc;

select author_fname, released_year, title
from books
order by author_fname, released_year;

select title, released_year
from books
order by released_year 
limit 5;

select title, released_year
from books
order by released_year 
limit 4, 5;

-- search patterns --

select author_fname, title
from books
where author_fname like 'J%';

select author_fname, title
from books
where author_fname like '_____';

select author_fname, title
from books
where title like '%\%%';

-- exercises --

select title 
from books
where title like '%Stories%';

select title, pages 
from books
order by pages desc
limit 1;

select concat(title, ' - ', released_year) as summary
from books
order by released_year desc
limit 3;

select title, author_lname
from books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
order by stock_quantity, title
limit 3;

select title, author_lname
from books
order by author_lname, title;

select upper(concat('my favourite author is ', author_fname, ' ', author_lname, '!')) as yell
from books
order by author_lname; 
