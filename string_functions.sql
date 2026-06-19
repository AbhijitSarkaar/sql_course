create database booksdb;

use booksdb;

select concat(author_fname, ' ', author_lname) as full_name
from books;

select concat_ws(' ', author_fname, author_lname) as full_name
from books;

select substr(author_lname, 1, length(author_lname)) as last_name
from books;

select concat(substr(title, 1, 10), '...') as short_title
from books;

select 
    concat(substr(author_fname, 1, 1),
            substr(author_lname, 1, 1)) AS initials
from
    books; 
    
select replace(title, ' ', '.')
from books;

select char_length(title) as title_length
from books;

select concat('book\'s called ', upper(title)) 
from books;

select trim(' boston ') as name;

select upper(reverse('Why does my cat look at me with such hatred'));

select replace(title, ' ', '->') as title
from books;

select author_lname as forwards, reverse(author_lname) as backwards
from books;

select concat( author_fname, ' ', author_lname) as 'full name in caps'
from books;

select concat(title, ' was released in ', released_year) as blurb 
from books;

select title, length(title) as 'character count'
from books;

select 
	concat(substr(title, 1, 10), '...') as 'short title',
    concat(author_lname, ',', author_fname) as author,
    concat(stock_quantity, ' in stock') as quantity
from books;

select * from books;