-- Part 1

SELECT employees.emp_no, 
employees.first_name, 
employees.last_name,
titles.title, 
titles.from_date, 
titles.to_date
INTO retirement_titles
FROM titles
INNER JOIN employees ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '01/01/1952' AND '12/31/1955'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
emp_no, 
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT (title) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Part 2

SELECT DISTINCT ON (emp_no)
employees.emp_no, 
employees.first_name, 
employees.last_name, 
employees.birth_date, 
dept_emp.from_date, 
dept_emp.to_date,
titles.title
INTO mentorship_eligibilty
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date = '9999-01-01' AND 
birth_date BETWEEN '01/01/1965' AND '12/31/1965'
ORDER BY emp_no;


SELECT *
FROM mentorship_eligibilty;
