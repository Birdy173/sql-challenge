--Create Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(100)
);

--Create Titles Table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(100)
);

--Create Employees Table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title VARCHAR(100),  -- Foreign key reference to titles table defined below
    birth_date DATE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    sex VARCHAR(1),
	hire_date DATE,
    FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

--Create Dept_Emp Table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
    
);

--Create Dept_Manager Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

--Create Salaries Table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
