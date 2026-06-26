CREATE DATABASE library_db;
USE library_db;

CREATE TABLE student (
    roll int          PRIMARY KEY,
    name varchar(180) NOT NULL
);

CREATE TABLE book (
    bid      int          PRIMARY KEY,
    title    varchar(100) NOT NULL,
    category varchar(50)
);

CREATE TABLE IssuedBooks (
    issid      int  PRIMARY KEY,
    bid        int,
    roll       int,
    issuedate  date NOT NULL,
    returndate date,
    CHECK (returndate IS NULL OR returndate >= issuedate),
    FOREIGN KEY (bid)  REFERENCES book(bid),
    FOREIGN KEY (roll) REFERENCES student(roll)
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

-- QUERY 1: Overdue books (not returned, kept > 14 days)
SELECT
    s.name                           AS StudentName,
    b.title                          AS BookTitle,
    b.category                       AS Category,
    i.issuedate                      AS IssuedOn,
    DATEDIFF(CURDATE(), i.issuedate) AS DaysKept
FROM issuedbooks i
    JOIN student s ON i.roll = s.roll
    JOIN book    b ON i.bid  = b.bid
WHERE
    i.returndate IS NULL
    AND DATEDIFF(CURDATE(), i.issuedate) > 14
ORDER BY DaysKept DESC;

-- QUERY 2: Most borrowed category
SELECT
    b.category  AS Category,
    COUNT(*)    AS TimesBorrowed
FROM issuedbooks i
    JOIN book b ON i.bid = b.bid
GROUP BY b.category
ORDER BY TimesBorrowed DESC;

-- QUERY 3: Inactive students (no activity in last 6 months)
SELECT name
FROM student
WHERE roll NOT IN (
    SELECT roll
    FROM IssuedBooks
    WHERE issuedate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)  -- ✅ fixed
);

-- QUERY 4: Delete inactive students
SET SQL_SAFE_UPDATES = 0;
DELETE FROM student
WHERE roll NOT IN (
    SELECT roll FROM (
        SELECT roll
        FROM IssuedBooks
        WHERE issuedate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)  -- ✅ fixed
    ) AS temp
);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM student;
