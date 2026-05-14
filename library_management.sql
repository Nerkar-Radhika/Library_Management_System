CREATE DATABASE library_management;
USE library_management;

CREATE TABLE Books(
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    quantity int
);

CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    branch VARCHAR(50),
    year int
);

CREATE TABLE Issue_Book(
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY(book_id)
    REFERENCES Books(book_id)
);

INSERT INTO Books
VALUES
(1,'Java Basics','James Gosling','Programming',10),
(2,'Python Fundamentals','Guido van Rossum','Programming',8),
(3,'Database Systems','Navathe','Database',5);

SELECT * FROM Books;

INSERT INTO Students
VALUES
(101,'Riya','IT',3),
(102,'Aman','CSE',2),
(103,'Sneha','AIML',3);

SELECT * FROM Students;

INSERT INTO Issue_Book
VALUES
(1,101,1,'2025-05-01','2025-05-10'),
(2,102,2,'2025-05-03','2025-05-12');

SELECT * FROM Issue_Book;

UPDATE Books
SET quantity = 15
WHERE book_id = 1;

SELECT * FROM Books;

DELETE FROM Books
WHERE book_id = 3;

SELECT Students.student_name, Books.title
FROM Issue_Book
JOIN Students
ON Issue_Book.student_id = Students.student_id
JOIN Books
ON Issue_Book.book_id = Books.book_id;