CREATE TABLE Departments (
    Dept_no VARCHAR NOT NULL,
    Dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

select * from Departments;

CREATE TABLE Dept_Emp (
	id SERIAL PRIMARY KEY,
    Emp_No INT NOT NULL,
    Dept_No VARCHAR NOT NULL
);

select * from dept_emp;

CREATE TABLE Dept_Manager (
    Dept_No VARCHAR NOT NULL,
    Emp_No INT NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        Emp_No
     )
);

select * from dept_manager;

CREATE TABLE Employees (
    Emp_No INT NOT NULL,
    Emp_Title_id VARCHAR NOT NULL,
    Birth_Date DATE NOT NULL,
    First_Name VARCHAR NOT NULL,
    Last_Name VARCHAR NOT NULL,
    Sex VARCHAR NOT NULL,
    Hire_date DATE NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);

select * from Employees;

CREATE TABLE Title (
    Title_id VARCHAR NOT NULL,
    Title VARCHAR NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        Title_id
     )
);
select * from Title;

CREATE TABLE "Salaries" (
    "Emp_No" INT   NOT NULL,
    "Salaries" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);
select * from Salaries;

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Dept_Manager" ("Dept_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Manager" ("Emp_No");

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_Title_id" FOREIGN KEY("Title_id")
REFERENCES "Employees" ("Emp_Title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");


SELECT last_name, first_name, sex, salaries, employees.emp_no
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date < '1986-01-01';


SELECT dept_manager.dept_no, dept_name, employees.emp_no, last_name, first_name
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.emp_no = employees.emp_no;


SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name IN ('Sales');


SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name IN ('Sales', 'Development');


SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
