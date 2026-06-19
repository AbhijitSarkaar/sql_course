create database booksdb;

use booksdb;

select * from books;

-- agggregate functions --

select count(distinct(author_fname))
from books;

select max(pages) 
from books;

select min(released_year) 
from books;


-- group by --

select concat(author_fname, ' ', author_lname), count(*)
from books
group by concat(author_fname, ' ', author_lname);

select released_year, count(*) as books_released
from books
group by released_year
order by released_year;

select concat(author_fname, ' ', author_lname) as author, max(pages) as length_of_longest_book_written
from books
group by author;

select author_fname, count(*)
from books
group by author_fname, author_lname;

-- subqueries --

select title, pages
from books
where pages = ( 
		select max(pages)
        from books
	)
limit 1;

select title, released_year
from books 
where released_year = (
			select min(released_year) 
            from books
        );


select concat(author_fname, ' ', author_lname) as author, min(released_year)
from books 
group by author;


select author_fname, 
		author_lname, 
		max(pages) as longest_book, 
		sum(pages) as total_pages, 
		avg(pages) as average_length_per_book 
from books 
group by author_fname, author_lname;

-- exercises --

select count(*)
from books;


select released_year, count(*) as book_release_count
from books
group by released_year
order by released_year;


select sum(stock_quantity) as total_books_stock
from books;


select avg(released_year) as average_release_year, author_fname, author_lname
from books
group by author_fname, author_lname;


select concat(author_fname, ' ', author_lname) as author, pages
from books
where pages = (
		select max(pages) from books 
);


select released_year, count(*) as '# books', avg(pages) as 'avg pages'
from books
group by released_year
order by released_year;












