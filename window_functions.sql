
-- window functions --
-- perform aggregated functions on groups --
-- produce aggregated results per group for each row -- 


create table employees(
	emp_no int auto_increment,
    department varchar(20),
    salary int,
    
    primary key(emp_no)
);


insert into employees(department, salary) 
values 
	('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000); 

select * from employees;


-- window functions --
    
select 
	emp_no, 
	department, 
    salary, 
    min(salary) over(),
    max(salary) over()
from employees;
    
select 
	emp_no, 
	department, 
    salary,
    avg(salary) over(partition by department) as department_avg,
    avg(salary) over() as company_avg
from employees;

select 
	emp_no,
    department,
    salary,
	count(*) over(partition by department) as emp_count
from employees;

select 
	emp_no,
    department,
    salary,
    sum(salary) over(partition by department) as department_payroll,
    sum(salary) over() as company_payroll
from employees;

select 
	emp_no,
    department,
    salary,
    sum(salary) over(order by department) as rolling_department_payroll,
    sum(salary) over(partition by department order by salary) as rolling_salary_payroll,
    sum(salary) over(partition by department) as department_payroll
from employees;


-- rank() -- 
-- rank values among a set of values --

select 
	emp_no,
    department,
    salary,
    rank() over(partition by department order by salary desc) as department_level_rank_salary, 
    rank() over(order by salary desc) as company_level_rank_salary
from employees
order by department;


select 
	emp_no,
    department,
    salary,
    rank() over(partition by department order by salary) as department_level_rank_salary, 
    rank() over(order by salary) as company_level_rank_salary,
    row_number() over(partition by department order by salary) as dept_row_no,
    dense_rank() over(order by salary)  as unique_salary_values,
    row_number() over() as row_no
from employees
order by department;


-- ntile() --
-- divide values into multiple ranges --

select 
	emp_no,
    department,
    salary,
    ntile(4) over(order by salary desc) as company_salary_quartile 
from employees;
    
select 
	emp_no,
    department,
    salary,
    ntile(3) over(partition by department order by salary desc) as dept_salary_3tile
from employees;


-- first_value() --
-- nth_value() --
-- first / nth value of a column measured for a set of values in other columns --

select 
	emp_no,
    department,
    salary,
    first_value(emp_no) over(partition by department order by salary desc) as department_highest_salary,
    first_value(emp_no) over(order by salary desc) as company_highest_salary,
    nth_value(emp_no, 3) over(order by salary desc) as company_third_highest_salary
from employees;


-- lead(), lag() --
-- next and previous row values --

select 
	emp_no,
    department,
    salary,
    salary - lag(salary) over(order by salary desc) as salary_diff
from employees;

select 
	emp_no,
    department,
    salary,
    salary - lag(salary) over(partition by department order by salary desc) as dept_salary_diff
from employees;

select 
	emp_no,
    department,
    salary,
    salary - lead(salary) over(order by salary desc) as salary_diff
from employees;

select 
	emp_no,
    department,
    salary,
    lead(salary, 2) over(order by salary desc) as third_from_current_row_salary
from employees;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
