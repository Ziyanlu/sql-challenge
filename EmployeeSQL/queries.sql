--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_no,first_name, last_name, gender,
(SELECT salary 
	FROM salaries
	where employee.emp_no = salaries.emp_no)
From employee;

--2. List employees who were hired in 1986.
SELECT * FROM employee
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT de.dept_no, de.dept_name, dm.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
	INNER JOIN departments AS de
	ON de.dept_no = dm.dept_no
	INNER JOIN employee AS e
	ON e.emp_no = dm.emp_no;
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dm.emp_no, e.last_name, e.first_name, de.dept_name
FROM dept_manager AS dm
	INNER JOIN departments AS de
	ON de.dept_no = dm.dept_no
	INNER JOIN employee AS e 
	ON e.emp_no = dm.emp_no
	
--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employee
WHERE first_name = 'Hercules' AND
last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dm.emp_no, e.last_name, e.first_name, de.dept_name
FROM dept_manager AS dm
	INNER JOIN departments AS de
	ON de.dept_no = dm.dept_no
	INNER JOIN employee AS e 
	ON e.emp_no = dm.emp_no
WHERE de.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dm.emp_no, e.last_name, e.first_name, de.dept_name
FROM dept_manager AS dm
	INNER JOIN departments AS de
	ON de.dept_no = dm.dept_no
	INNER JOIN employee AS e 
	ON e.emp_no = dm.emp_no
WHERE de.dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS employment_count 
FROM employee
GROUP BY last_name
ORDER BY employment_count DESC;
