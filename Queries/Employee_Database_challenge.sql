-- Retirement titles table
SELECT  
ep.emp_no,
ep.first_name,
ep.last_name ,
titles.title,
titles.from_date,
titles.to_date 

INTO retirement_titles
FROM employees as ep 

INNER JOIN titles  
ON ep.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ep.emp_no
;

SELECT * FROM retirement_titles;

-- Unique titles table (use Dictinct with Orderby to remove duplicate rows)
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles 
FROM retirement_titles

WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Retiring titles table
DROP TABLE retiring_titles;

SELECT COUNT (title), title 
INTO retiring_titles 
FROM unique_titles

GROUP BY title
ORDER BY count DESC
;

SELECT * FROM retiring_titles ;

-- Mentorship Eligibilty table

SELECT  DISTINCT ON (ep.emp_no)
ep.emp_no,
ep.first_name,
ep.last_name ,
ep.birth_date, 
dept_emp.from_date,
dept_emp.to_date,
titles.title

INTO mentorship_eligibilty
FROM employees as ep

INNER JOIN dept_emp
ON ep.emp_no = dept_emp.emp_no

INNER JOIN titles  
ON ep.emp_no = titles.emp_no

WHERE(dept_emp.to_date = ('9999-01-01')
AND (ep.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY ep.emp_no
;

select * from mentorship_eligibilty;