-- List the employee number, last name, first name, sex, and salary of each employee
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no=Salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM EMPLOYEES
WHERE hire_date between '1986-01-01' and '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT Department_Managers.dept_no, Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name
FROM Employees
	   inner join Department_Managers
	   on Employees.emp_no = Department_Managers.emp_no
	   inner join Departments
	   on Department_Managers.dept_no = Departments.dept_no

-- List the department number for each employee along with that employee's employee number, last name, first name,and department name	
SELECT Departments.dept_no, Department_Employed.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
        inner join Department_Employed on Employees.emp_no = Department_Employed.emp_no
        inner join Departments on Department_Employed.dept_no = Departments.dept_no
Order by Employees.emp_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT Employees.first_name, Employees.last_name, Employees.sex
from Employees
WHERE first_name = 'Hercules' and last_name ~'^[B]{1}[\s\w]*$'

-- List each employee in the Sales Department, including their employee number, last name and first name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name
FROM Employees
	INNER JOIN Department_Employed ON Employees.emp_no = Department_Employed.emp_no
where Department_Employed.dept_no = 'd007'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
	   inner join Department_Employed
	   on Employees.emp_no = Department_Employed.emp_no
	   inner join Departments
	   on Department_Employed.dept_no = Departments.dept_no
where Departments.dept_name = 'Sales' or Departments.dept_name = 'Development'

-- cleaning data - Changing 1st letter of last name to upper case and adding apostrophe
update Employees
set last_name = replace(last_name,'dAstous', 'D''Astous')

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) FROM Employees
GROUP BY last_name
Order By count desc