CREATE TABLE employee (
emp_id INTEGER PRIMARY KEY,
f_name VARCHAR(255),
l_name VARCHAR (255),
job_id VARCHAR (255),
salary DECIMAL (10,2),
manager_id INTEGER,
dept_id INTEGER
);

INSERT INTO employee (emp_id, f_name, l_name, job_id, salary, manager_id, dept_id)
VALUES (101, 'John', 'Smith', 'JP123', 70000, 02, 30),
(102, 'Emily', 'Johnson', 'EN456', 80000, 03, 40),
(103, 'Michael', 'Williams', 'MW789', 90000, 04, 20),
(104, 'Emma', 'Jones', 'EJ567', 75000, 02, 10),
(105, 'Calvin', 'Miller', 'CM345', 85000, 03, 30),
(106, 'Sophia', 'Davis', 'SD678', 95000, 04, 20),
(107, 'Liam', 'Moore', 'LM901', 72000, 02, 40),
(108, 'Olivia', 'Anderson', 'OA234', 87000, 03, 10),
(109, 'William', 'Brown', 'WB567', 92000, 04, 30),
(110, 'Ava', 'Taylor', 'AT890', 78000, 02, 20);

Select * from employee;

SELECT e1.f_name, e1.l_name
FROM employee e1 
JOIN employee e2 on e1.salary > e2.salary
WHERE e2.f_name = 'Calvin'

select emp.emp_id, emp.l_name 
from employee emp
where salary > (
select AVG(salary)
from employee 
);

select results.emp_id, results.f_name
from (
select emp.emp_id, emp.f_name, emp.salary
from employee emp 
INTERSECT 
select emp_id, f_name, salary
from employee 
where salary > (
select salary
from employee 
where job_id = 'MW789')
) as results
order by salary desc;

select emp.emp_id, emp.f_name, emp.salary
from (
select emp_id, f_name, salary
from employee 
order by salary desc
limit 3) as top_earners 
join employee emp on top_earners.emp_id = emp.emp_id
order by emp.salary desc;

