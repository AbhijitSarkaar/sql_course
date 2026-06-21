
select * from reviewers;
select * from series;
select * from reviews;

-- views --

create view view_reviews as select title, released_year, genre, rating, concat(first_name, ' ', last_name) as reviewer
from series
join reviews 
	on series.id = series_id
join reviewers
	on reviewers.id = reviewer_id;
    
    
create or replace view view_reviews as select title, released_year, genre, rating, concat(first_name, ' ', last_name) as reviewer
from series
join reviews 
	on series.id = series_id
join reviewers
	on reviewers.id = reviewer_id    
order by released_year;


alter view view_reviews as select title, released_year, genre, rating, concat(first_name, ' ', last_name) as reviewer
from series
join reviews 
	on series.id = series_id
join reviewers
	on reviewers.id = reviewer_id    
order by released_year desc;

select * from view_reviews;

-- group by having --
-- filter group by partitions based on conditions --


select title, avg(rating), count(rating) as rating_count
from view_reviews
group by title
having count(rating) > 1;


-- rollup --

select released_year, genre, avg(rating)
from view_reviews
group by released_year, genre
with rollup
order by released_year;


-- modes --
-- handle different aspects--


select @@Global.sql_mode;

select @@Session.sql_mode;



