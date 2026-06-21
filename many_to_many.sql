

create table reviewers(
	id int auto_increment,
    first_name varchar(55) not null,
    last_name varchar(55) not null,
    
    primary key(id)
);


create table series(
	id int auto_increment,
    title varchar(55) not null,
    released_year year not null,
    genre varchar(55) not null,
    
    primary key(id)
);


create table reviews(
	id int auto_increment,
    rating decimal(2,1) not null,
    series_id int not null,
    reviewer_id int not null,
    
    primary key(id),
    foreign key (series_id) references series(id) on delete cascade,
    foreign key (reviewer_id) references reviewers(id) on delete cascade
);

select * from reviewers;
select * from series;
select * from reviews;



-- exercises --

select title, rating
from series
join reviews
	on series.id = reviews.series_id;


select title, round(avg(rating), 2) as avg_rating
from series
join reviews
	on series.id = reviews.series_id
group by title
order by avg_rating;


select first_name, last_name, rating 
from reviewers
join reviews
	on reviewers.id = reviews.reviewer_id;


select title as unreviewed_series
from series
left join reviews
	on series.id = reviews.series_id
where rating is NULL;


select genre, avg(rating) as avg_rating
from series
join reviews
	on series.id = reviews.series_id
group by genre;


select 
	first_name, 
    last_name, 
	count(rating) as COUNT, 
    min(rating) as MIN, 
    max(rating) as MAX,
    avg(rating) as AVG,
    case 
		when count(rating) > 0 then 'ACTIVE'
        else 'INACTIVE'
    end as STATUS
from reviewers
left join reviews
	on reviewers.id = reviews.reviewer_id
group by first_name, last_name;



select 
	title, 
    rating, 
    concat(first_name, ' ', last_name) as reviewer
from series
join reviews
	on series.id = series_id
join reviewers
	on reviewers.id = reviewer_id
order by title;



















