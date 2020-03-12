DROP procedure if exists filter_salary;

DELIMITER $$
Create procedure filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
Select
	e.gender, d.dept_name, AVG(s.salary) as avg_salary
From
	t_salaries s
		join
	t_employees e on s.emp_no = e.emp_no
		join
	t_dept_emp de on de.emp_no = e.emp_no
		join
	t_departments d on d.dept_no = de.dept_no
    where s.salary between p_min_salary and p_max_salary
group by d.dept_no, e.gender;
END $$

DElimiter ;

CALL filter_salary(50000, 90000);