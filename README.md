# SQL Database Project

This project involves the creation and management of a database using SQL. The database includes tables for departments, employees, their respective roles, salaries, and other related data.

## Database Structure

The database consists of the following tables with data from CSV files:

1. **Departments**
   - Stores information about the departments within the organization.
   - **Columns**:
     - `dept_no` (VARCHAR(4), Primary Key): Department number.
     - `dept_name` (VARCHAR(100)): Department name.

2. **Employees**
   - Stores personal information about employees.
   - **Columns**:
     - `emp_no` (INT, Primary Key): Employee number.
     - `emp_title` (VARCHAR(100), Foreign Key to `titles.title_id`): Employee's job title.
     - `birth_date` (DATE): Employee's birth date.
     - `first_name` (VARCHAR(100)): Employee's first name.
     - `last_name` (VARCHAR(100)): Employee's last name.
     - `sex` (VARCHAR(1)): Employee's gender.

3. **Titles**
   - Lists the job titles available in the organization.
   - **Columns**:
     - `title_id` (VARCHAR(5), Primary Key): Title ID.
     - `title` (VARCHAR(100)): Description of the job title.

4. **Dept_Emp**
   - Links employees to their respective departments.
   - **Columns**:
     - `emp_no` (INT, Primary Key, Foreign Key to `employees.emp_no`): Employee number.
     - `dept_no` (VARCHAR(4), Foreign Key to `departments.dept_no`): Department number.

5. **Dept_Manager**
   - Identifies managers for each department.
   - **Columns**:
     - `dept_no` (VARCHAR(4), Foreign Key to `departments.dept_no`): Department number.
     - `emp_no` (INT, Foreign Key to `dept_emp.emp_no`): Employee number of the manager.

6. **Salaries**
   - Stores salary information for employees.
   - **Columns**:
     - `emp_no` (INT, Foreign Key to `employees.emp_no`): Employee number.
     - `salary` (INT): Employee's salary.

## Key SQL Queries

Here are some useful SQL queries to interact with the database:

1. **List the employee number, last name, first name, sex, and salary of each employee:**
   ```sql
   SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
   FROM employees e
   JOIN salaries s ON e.emp_no = s.emp_no;
   ```

2. **List the first name, last name, and hire date for employees hired in 1986:**
   ```sql
   SELECT e.first_name, e.last_name, e.hire_date
   FROM employees e
   WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;
   ```

3. **List the manager of each department along with their department number, department name, employee number, last name, and first name:**
   ```sql
   SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
   FROM departments d
   JOIN dept_manager dm ON d.dept_no = dm.dept_no
   JOIN employees e ON dm.emp_no = e.emp_no;
   ```

4. **List the department number for each employee along with that employee’s employee number, last name, first name, and department name:**
   ```sql
   SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
   FROM dept_emp de
   JOIN employees e ON de.emp_no = e.emp_no
   JOIN departments d ON de.dept_no = d.dept_no;
   ```

5. **List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B:**
   ```sql
   SELECT e.first_name, e.last_name, e.sex
   FROM employees e
   WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';
   ```

6. **List each employee in the Sales department, including their employee number, last name, and first name:**
   ```sql
   SELECT e.emp_no, e.last_name, e.first_name
   FROM employees e
   JOIN dept_emp de ON e.emp_no = de.emp_no
   JOIN departments d ON de.dept_no = d.dept_no
   WHERE d.dept_name = 'Sales';
   ```

7. **List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name:**
   ```sql
   SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
   FROM employees e
   JOIN dept_emp de ON e.emp_no = de.emp_no
   JOIN departments d ON de.dept_no = d.dept_no
   WHERE d.dept_name IN ('Sales', 'Development');
   ```

8. **List the frequency counts, in descending order, of all employee last names:**
   ```sql
   SELECT e.last_name, COUNT(*) AS frequency
   FROM employees e
   GROUP BY e.last_name
   ORDER BY frequency DESC;
   ```

## Important Notes

- **Caution with `DROP TABLE`**: When deleting tables, ensure dependencies are managed to avoid errors. Use `CASCADE` to handle dependent constraints when necessary.
- **Backups**: Always ensure that backups are created before making changes that affect the structure or data of the database.
