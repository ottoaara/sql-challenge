--Analysis 1
--List the employee number, last name, first name, sex, and salary of each employee.

Select distinct e.emp_no, e.last_name, e.first_name, e.sex as Yes_please, s.salary 
--please enjoy the Austin powers ref.
FROM employees e inner join salaries s on  s.emp_no = e.emp_no
;
--Analysis 2
--List the first name, last name, and hire date for the employees who were hired in 1986.

Select  e.first_name, e.last_name
FROM employees e
WHERE date_part('year', hire_date) = 1986;
;

--Analysis 3
--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT dp.dept_no, d.dept_name,e.emp_no,e.last_name,e.first_name
FROM employees e inner join dept_manager dp on  e.emp_no = dp.emp_no
inner join departments d on dp.dept_no = d.dept_no
;

-- Analysis 4 
--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, e.emp_no,e.last_name,e.first_name,dp.dept_name
FROM employees e inner join dept_emp d on e.emp_no = d.emp_no
inner join departments dp on d.dept_no = dp.dept_no
;
-- Analysis 5
--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.

SELECT e.first_name,e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' and e.last_name like 'B%'
;


-- Anlaysis 6
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.first_name,e.last_name, e.emp_no
FROM employees e inner join dept_emp dp on e.emp_no = dp.emp_no 
Where dp.dept_no = (SELECT d.dept_no from departments d Where d.dept_name ='Sales')  
;

-- Analysis 7 
--List each employee in the Sales and Development departments, including their employee 
--number, last name, first name, and department name.

SELECT e.first_name,e.last_name, e.emp_no , d.dept_name
FROM employees e inner join dept_emp dp on e.emp_no = dp.emp_no 
inner join departments d on dp.dept_no = d.dept_no
Where dp.dept_no = (SELECT d.dept_no from departments d Where d.dept_name ='Sales') or 
dp.dept_no = (SELECT d.dept_no from departments d Where d.dept_name ='Development')
;

--Analysis 8 
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT e.last_name, count(e.last_name) as Frequency
From employees e 
group by e.last_name
order by Frequency desc
;