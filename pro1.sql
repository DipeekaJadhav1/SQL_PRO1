use exam ;
select * from emp;

-- - List all employee names from the dataset.
 select name from emp;
 
 -- - Retrieve the phone numbers of employees living in Delhi.
select phone from emp where city = "delhi";

-- - Show the email IDs of employees whose DOB is before 1992.
 select email , name , dob from emp where dob < "1992-01-01" ;
 
 -- - Display Eid and Name in ascending order of Eid.
 select eid, name from emp order by eid ;

-- - Find the city of employee Ramesh Gupta.
select city, name  from emp where name = "Ramesh Gupta";
-- 

-- - Find employees who joined on 2012-03-15.
SELECT NAME , DOJ FROM EMP WHERE DOJ = "2012-03-15" ;

-- - Display names and emails of employees whose city is Gurgaon.
SELECT name, email,city  from emp where city = 'Gurgaon';

-- - Sort employees by DOB in ascending order.
select name, dob from emp order by dob ;

-- Count how many employees belong to each city.
select city,count(*) as city_count from emp group by city;

-- - Show Eid, Name, and Phone for employees whose email domain is Yahoo.
select eid,name,phone from emp where email like '%@Yahoo.%';

-- - Retrieve employees whose addr1 contains 'SECTOR'.
SELECT name,addr1  FROM emp WHERE addr1 LIKE 'SECTOR%';

select * from emp;

-- - Display employees ordered lexicographically by Name.
 select eid ,name from emp order by name ;
 
-- - Find employees whose DOB is after 1992 and city = Delhi.
select name, dob, city from emp where city ='delhi' and dob >'1992-01-01';

-- Show Eid, Name, DOJ for employees where DOJ = DOB + 8000 days (date calculation challenge).
select eid, name, dob, doj, DATE_ADD(dob, INTERVAL 8000 DAY) AS dob_plus_8000 from emp;

-- Retrieve employees whose phone numbers start with '99'.
select name,phone from emp where phone like'99%';

-- Display employees grouped by addr2, showing count per group.
select addr2,count(*) as emp_count from emp group by addr2;

-- Find employees whose email username (before @) contains the digit 1.
select name, email as emp_email from emp where email like '%1%@%';

-- Show Eid, Name, DOB, DOJ where DOJ < DOB (data validation check).
select eid,name,dob,doj from emp where doj < dob;



