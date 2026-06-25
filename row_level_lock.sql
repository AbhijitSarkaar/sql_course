
start transaction;

select * 
from inventories 
where id=1 
for update;

update inventories 
set units_count=10 
where id=1;


commit;