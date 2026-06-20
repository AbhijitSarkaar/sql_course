use booksdb;

select * from books;


-- comparison operators -- 

select *
from books
where released_year != 2017 && released_year >= 1945 && released_year <= 2000;

select title
from books
where title not like '% %';

select *
from books
where released_year between 2010 and 2020;

select *
from books
where released_year not between 2010 and 2020;


-- logical operators --

select *
from books 
where author_lname='Eggers' and released_year > 2010 and title not like '%novel%';

select *
from books
where author_lname = 'Eggers' or author_lname = 'Steinbeck';

select *
from books 
where year(curdate()) - released_year > 50;

select hour(cast('09:00:00' as time));

select * 
from people
where birthtime between '12:00:00' and '16:00:00';

select * 
from people
where birthtime between hour(cast('12:00:00' as time)) and hour(cast('16:00:00' as time));


-- in, not in, modulo --

select *
from books
where author_lname in ('Carver', 'Lahiri');

select *
from books
where author_lname not in ('Smith');

select *
from books
where released_year % 2 != 0;


-- case --

select title, released_year,
	case 
		when released_year >= 2000 then 'Modern Lit'
        else '20th Century Lit'
    end as genre
from books;

select *
from books
where author_lname is null;


-- exercises --

select *
from books
where released_year < 1980;

select *
from books
where author_lname = 'Eggers' or author_lname = 'Chabon';

select *
from books
where author_lname = 'Lahiri' and released_year > 2000;

select * 
from books
where pages between 100 and 200;

select *
from books
where author_lname like 's%' or author_lname like 'c%';


select title, author_lname,
	case 
		when title like '%stories%' then 'Short Stories'
		when title like '%Just Kids%' or title like '%A Heartbreaking Work%' then 'Memoir'
        else 'Novel'
    end as type
from books;


select author_fname, author_lname,
	case 
		when books_written > 0 then concat(books_written, ' books')
    end as COUNT
from (
	select author_fname, author_lname, count(*) as books_written
	from books
	group by author_fname, author_lname
) as book_derived;


select author_fname, author_lname, 
	case  
		when count(*) > 1 then concat(count(*), ' books')
        else '1 book'
    end as COUNT
from books
group by author_fname, author_lname;





























