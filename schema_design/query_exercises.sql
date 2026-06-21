
select * 
from users
order by created_at
limit 5;


select day_name
from (
	select dayname(created_at) as day_name, count(*) as user_registered_count
	from users
	group by day_name
	order by user_registered_count desc 
) as p
where user_registered_count = (
	select max(user_registered_count)
	from ( select dayname(created_at) as day_name, count(*) as user_registered_count
			from users
			group by day_name
			order by user_registered_count desc 
			limit 1
    ) as p2
);


select username
from users
left join photos
	on users.id = photos.user_id
where user_id is null;





select username
from users 
join photos
	on users.id = photos.user_id
where photos.id = (
	select photo_id
	from likes
	group by photo_id
	order by count(*) desc
	limit 1
);


select 
	username,
	photo_id,
    count(*) as likes_count,
    photos.user_id
from likes
join photos
	on likes.photo_id = photos.id
join users
	on photos.user_id = users.id
group by photo_id
order by likes_count desc
limit 1;


-- only active users --

select ( total_posts / ( total_users - inactive_user_count ) ) as average_post_count_per_user
from (
	( select count(*) as total_users from users ) as q1,
    ( select count(*) as total_posts from photos ) as q2,
    (
		select count(*) as inactive_user_count
		from users
		left join photos
			on photos.user_id = users.id
		where photos.id is null
    ) as q3
);

-- all users --

select ( total_posts / ( total_users ) ) as average_post_count_per_user
from (
	( select count(*) as total_users from users ) as q1,
    ( select count(*) as total_posts from photos ) as q2
);

select (
		( select count(*) as total_posts from photos ) / ( select count(*) as total_users from users )
    ) as avg;




select 
	tag_id,
    count(*) as tag_count,
    tag_name
from photo_tags
join tags
	on photo_tags.tag_id = tags.id
group by tag_id
order by tag_count desc
limit 5;




select username, likes_count
from (
	select 
	username,
	user_id,
	count(*) as likes_count
	from likes
	join users
		on likes.user_id = users.id
	group by user_id
) as p
where likes_count = (
	select count(*) from photos
);


select 
	username,
	count(*) as likes_count
	from likes
	join users
		on likes.user_id = users.id
	group by user_id
    having likes_count = (
		select count(*) from photos
	);





