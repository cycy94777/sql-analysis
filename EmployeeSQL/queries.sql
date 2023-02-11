---List the employee number, last name, first name, sex, and salary of each employee
SELECT f.emp_no, f.last_name, f.first_name, f.sex, i.salary
FROM employees as f
INNER JOIN salaries as i
ON f.emp_no = i.emp_no

---List the first name, last name, and hire date for the employees who were hired in 1986
SELECT f.first_name, f.last_name, f.hire_date
FROM employees as f
WHERE f.hire_date LIKE '%1986'

---List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT f.dept_no, f.dept_name, i.emp_no, employees.last_name, employees.first_name
FROM departments as f
INNER JOIN dept_manager as i 
ON i.dept_no = f.dept_no
INNER JOIN employees
on employees.emp_no = i.emp_no
ORDER BY dept_no

---List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT f.dept_no, f.dept_name, i.emp_no, employees.last_name, employees.first_name
FROM departments as f
INNER JOIN dept_emp as i 
ON i.dept_no = f.dept_no
INNER JOIN employees
on employees.emp_no = i.emp_no
ORDER BY dept_no

---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT f.first_name, f.last_name, f.sex
FROM employees as f
WHERE (f.first_name = 'Hercules') AND (f.last_name LIKE 'B%')

----List each employee in the Sales department, including their employee number, last name, and first name
SELECT f.emp_no, f.last_name, f.first_name
FROM employees as f
INNER JOIN dept_emp as i 
ON f.emp_no = i.emp_no
INNER JOIN departments
ON departments.dept_no = i.dept_no
WHERE departments.dept_name = 'Sales'

---List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT f.emp_no, f.last_name, f.first_name, d.dept_name
FROM employees as f
INNER JOIN dept_emp as i 
ON f.emp_no = i.emp_no
INNER JOIN departments as d
ON d.dept_no = i.dept_no
WHERE d.dept_name = ('Sales') 
OR  d.dept_name = ('Development')

---List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT f.last_name, COUNT(f.last_name) as count_lastname
FROM employees as f
GROUP BY f.last_name
ORDER BY count_lastname DESC