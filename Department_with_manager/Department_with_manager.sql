select
	d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
		CASE
			when year(dm.to_date) >= e.calendar_year AND Year(dm.from_date) <= e.calendar_year THEN 1
            else 0
		END AS active
from
	(select
		year(hire_date) AS calendar_year
	from
		t_employees
	group by calendar_year) e
		cross join
	t_dept_manager dm
		join
	t_departments d on dm.dept_no = d.dept_no
		join
	t_employees ee ON dm.emp_no = ee.emp_no
order by dm.emp_no, calendar_year;