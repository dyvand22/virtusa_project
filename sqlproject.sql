CREATE database lib;
use lib;

CREATE TABLE student(
ROLL int primary key, NAME varchar(180));

create table book(
bid int primary key, title varchar(100),category varchar(50));

create table IssuedBooks(
Issid int primary key,
bid int,
ROLL int,
issuedate date,
returndate date
);
INSERT INTO student VALUES
(1, 'Anand'),
(2, 'Riya'),
(3, 'Amit'),
(4, 'Priya'),
(5, 'Rahul'),
(6, 'Sneha');

INSERT INTO book VALUES
(1, 'Harry Potter',  'Fiction'),
(2, 'Sapiens',       'History'),
(3, 'Cosmos',        'Science'),
(4, 'Clean Code',    'Technology'),
(5, 'The Alchemist', 'Fiction');

INSERT INTO IssuedBooks VALUES
(1, 1, 1, '2025-03-01', NULL),          -- Anand has Harry Potter
(2, 2, 2, '2025-03-10', NULL),          -- Riya has Sapiens
(3, 3, 3, '2025-04-15', NULL),          -- Amit has Cosmos (not overdue)
(4, 4, 4, '2025-04-10', '2026-04-12'), -- Priya returned Clean Code
(5, 5, 5, '2025-03-05', NULL),          -- Rahul has The Alchemist
(6, 1, 6, '2025-01-01', '2025-01-10'); -- Sneha returned long ago

-- QUERY 1: FIND OVERDUE BOOKS
Select
  s.NAME,
  b.title,
  b.category,
  i.issuedate,
  datediff(curdate(),i.issuedate) as DaysKept

From IssuedBooks i
     join student s
       on i.ROLL = s.ROLL
	 
     join book b
       on i.bid = b.bid

where i.returndate is NULL and datediff(curdate(),i.issuedate) > 14
order by DaysKept desc;

-- QUERY 2: MOST POPULAR CATEGORY

select
  b.category,
  count(*) as TimesBorrowed

from IssuedBooks i
     join book b
     on i.bid=b.bid
group by b.category
order by TimesBorrowed desc;

-- QUERY 3: FIND INACTIVE STUDENTS
SELECT name
FROM Student
WHERE roll NOT IN (
    SELECT roll
    FROM IssuedBooks
    WHERE issueDate >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
);

-- QUERY 4: DELETE INACTIVE STUDENTS

SET SQL_SAFE_UPDATES = 0;

DELETE FROM student
WHERE roll NOT IN (
    SELECT roll FROM (
        SELECT roll
        FROM IssuedBooks
        WHERE issueDate >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
    ) AS temp
);

SET SQL_SAFE_UPDATES = 1;
SELECT * FROM student;