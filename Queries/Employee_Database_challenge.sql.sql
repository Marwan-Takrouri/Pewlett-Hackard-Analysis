
SELECT e.emp_no,e.first_name, e.last_name,ti.titles,ti.from_date,ti.to_date
INTO retirement_titles
from employees as e
INNER JOIN titles as ti
ON (e.emp_no=ti.emp_no)
WHERE (e.birth_date between '1952-01-01' AND '1955-01-01')
ORDER BY emp_no ASC;


SELECT * FROM retirement_titles;

--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.


SELECT DISTINCT ON (rt.emp_no) rt.emp_no , rt.first_name , rt.last_name , rt.titles
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no   , to_date DESC ;

--retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT  (ut.emp_no) , ut.titles 
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles
ORDER BY COUNT (titles )DESC ;

SELECT * FROM unique_titles;

