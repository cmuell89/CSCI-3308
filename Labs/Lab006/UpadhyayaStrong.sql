/*
Satish Upadhyaya
Matthew Strong
Lab 6
*/

--1. Alphabetically sorted list of items
SELECT * from store ORDER by sname;

--2. Alphabetically sorted list of items; only displaying first 3 rows
SELECT * from store ORDER by sname LIMIT 3;

--3. Alphabetically sorted list of items; only displaying last 3 rows
SELECT * from store ORDER by sname DESC LIMIT 3;

--4. Displaying items where the price is only GREATER THAN 1
SELECT * from store WHERE price>1 ORDER by sname;

--5. Adds a col to the table on the left with the extended_price of the items
SELECT qty*price AS extended_price, * from store;

--6. Displaying the total cost of the items in the store
SELECT SUM(qty*price) AS total_cost FROM store;

--7. CS course code is 1, displaying all the courses with code 1
SELECT * from course WHERE department_id = 1;

--8. Displaying the total enrollment count
SELECT SUM(count) from enrollment;

--9. Displaying the number of departments
SELECT COUNT(*) FROM department;

--10. Update and display department id to 3 for 112
UPDATE course SET department_id=1 WHERE cname='112';

--11. 
--a. Add a new col, drop_count as a text field
	ALTER TABLE enrollment ADD drop_count text;
--b. Change the data type of drop_count from text to type varchar
	ALTER TABLE enrollment ALTER COLUMN drop_count type varchar;
--c. Modify the data type of drop_count from varchar to integer
 	ALTER TABLE enrollment ALTER COLUMN type integer using drop_count::integer;
	
--12. 
--a. Update val in drop_count
	UPDATE enrollment SET drop_count=0.2*count;
--b. Print the result
	SELECT * from enrollment;
	
--13. COncatenate department name with class number
SELECT CONCAT('CSC',cname) From course WHERE department_id=1;
/*
	practice
	SELECT CONCAT('MTH',cname) FROM course WHERE department_id=2;
	SELECT CONCAT('EGR',cname) FROM course WHERE department_id=3;
	SELECT CONCAT('CHM',cname) FROM course WHERE department_id=4;
*/

--14. List info in the DB
SELECT department.name, course.cname AS department, enrollment.count, enrollment.drop_count FROM course
JOIN enrollment ON course.id = enrollment.id JOIN department on department.id = course.department_id ORDER BY department.name;

--15. 
--a. Drop column drop_count from enrollment table
	ALTER TABLE enrollment DROP COLUMN drop_count;
--b. Empty the entire enrollment table
	TRUNCATE enrollment;
--c. Delete the enrollment table
	DROP TABLE enrollment;
--d. Create a new_enrollment table
	CREATE TABLE new_enrollment
	(
		id SERIAL,
		department_name VARCHAR(3) NOT NULL,
		count INTEGER NOT NULL,
		drop_count INTEGER
	);
--e. Inserting the details in the table, with the self incrementing id(No id input necessary)
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('CSC',100,20);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('CHM',120,5);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('MTH',90,3);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('EGR',122,12);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('MTH',68,6);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('CSC',100,3);
	INSERT INTO new_enrollment (department_name,count,drop_count) VALUES('CHM',30,1);
	SELECT department_name FROM new_enrollment ORDER BY count LIMIT 1;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	