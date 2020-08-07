-- EXPLAIN SELECT COUNT(`dept_no`) FROM `dept_emp`;


 -- EXPLAIN SELECT `name`, `lastname`, `salary` FROM `shtat` ORDER BY `salary` DESC LIMIT 1;

-- LOCK TABLE salaries READ;
-- select * from salaries limit 10;

-- UNLOCK TABLES;

-- insert into salaries VALUE (10001, 999999, '1997-08-03',	'1998-08-03'); 
-- SELECT emp_no FROM `salaries` WHERE `salary` > 800000;
-- select max(salary) from salaries limit 10;

-- BEGIN;
-- SET @emp = (SELECT emp_no FROM `salaries` WHERE `salary` > 800000);
-- SET @sal = 1000000;
-- UPDATE `salaries` SET `salary`=@bon WHERE `emp_no` = @emp;
-- COMMIT;




EXPLAIN SELECT `first_name`, `last_name`, `salary` FROM `employees` as e, salaries as s WHERE  e.emp_no=s.emp_no ORDER BY `salary` DESC LIMIT 10;