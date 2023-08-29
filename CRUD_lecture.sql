/*
Replace staffuser with your username 
PC: do a CTRL + H
MAC: Highlight on instance of what you want to change, right click, select 
    "Change all occurances", and start typing the new word

REPLACE: "staffuser" with your schema

*/

--Demo 1 Script to create a table
USE JunkDB_STL_May2023; --Replace with your class' junk database
GO

DROP TABLE IF EXISTS staffuser.author_preferences;

CREATE TABLE staffuser.author_preferences(
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    ); 

SELECT * FROM staffuser.author_preferences -- 0 rows

INSERT INTO staffuser.author_preferences (author_id, genre_id)
SELECT DISTINCT b.author_id, b.genre_id FROM staffuser.book as b;

SELECT * FROM staffuser.author_preferences -- 21 rows

--Create tables with SELECT INTO
DROP TABLE IF EXISTS staffuser.author_preferences;

SELECT * FROM staffuser.author_preferences; -- table is gone
 
SELECT DISTINCT author_id, genre_id INTO staffuser.author_preferences
FROM staffuser.book;
 
SELECT * FROM staffuser.author_preferences; -- 21 rows



--Adding One Row at a Time with Literal Values

--1

SELECT * from staffuser.genre WHERE genres = 'Sky Pirates';

INSERT INTO staffuser.genre (genre_id, genres)
VALUES ((SELECT MAX(genre_id) FROM staffuser.genre)+1, N'Sky Pirates'); -- Why is there an N?
                                                                        -- The N forces the string into Unicode
                                                                        -- before inserting it into the database.
                                                                        -- Pro: Even if the string isn't unicode,
                                                                        -- the N should convert it and allow you to
                                                                        -- insert without an error.
                                                                        -- Con: If there is a non-unicode character in
                                                                        -- a string, it will get converted to something else
                                                                        -- and you may end up with some weird looking strings
                                                                        -- in your database.

SELECT * from staffuser.genre WHERE genres = 'Sky Pirates'

--2 

INSERT INTO staffuser.genre (genre_id, genres)
SELECT ((SELECT MAX(genre_id) FROM staffuser.genre)+1), N'Solar Punk';

SELECT * FROM staffuser.genre WHERE genres = 'Solar Punk';

 --Inserting Multiple Rows with One INSERT
--1
INSERT INTO staffuser.genre (genre_id, genres)
SELECT 200, N'Cashier Memoir'
UNION ALL
SELECT 201, N'Bangsian Fantasy'
UNION ALL
SELECT 202, N'Mannerpunk';

SELECT * FROM staffuser.genre WHERE genres IN ('Cashier Memoir', 'Bangsian Fantasy', 'Mannerpunk');
 
--2
--This is better!
INSERT INTO staffuser.genre (genre_id, genres)
VALUES (204, N'New Adult'),
       (205, N'Non-Greek Mythology'),
       (206, N'Petty Revenge');

SELECT * FROM staffuser.genre WHERE genres IN ('New Adult', 'Non-Greek Mythology', 'Petty Revenge');


--Inserting Rows from Another Table

DROP TABLE IF EXISTS staffuser.some_patrons;

CREATE TABLE staffuser.some_patrons(
    patron_id INT NOT NULL,
    first_name varchar(255) NULL,
    last_name varchar(255) NULL,
    loan_id INT NULL,
    ); 

INSERT INTO staffuser.some_patrons (patron_id, first_name, last_name, loan_id)
SELECT patron_id, first_name, last_name, loan_id
FROM staffuser.patron
WHERE last_name LIKE 'S%';

SELECT * FROM staffuser.some_patrons;


INSERT INTO staffuser.some_patrons (patron_id, first_name, last_name, loan_id)
SELECT patron_id, first_name, last_name, loan_id
FROM staffuser.patron
WHERE last_name BETWEEN 'C' AND 'F';

SELECT * FROM staffuser.some_patrons;

-- You can join data and then insert the joined data to a table- this isn't a great example,
-- but it's good to know that you can do it!
INSERT INTO staffuser.some_patrons (patron_id, first_name, last_name, loan_id)
SELECT p.patron_id, a.first_name, p.last_name, p.loan_id
FROM staffuser.patron p
INNER JOIN staffuser.author AS a ON p.last_name = a.last_name;

SELECT * FROM staffuser.some_patrons;

--Inserting Missing Rows
--1
SELECT COUNT(patron_id) AS PatronCount
FROM staffuser.some_patrons;
 
--2
INSERT INTO staffuser.some_patrons (patron_id, first_name, last_name, loan_id)
SELECT p.patron_id, p.first_name, p.last_name, p.loan_id
FROM staffuser.patron AS p
WHERE NOT EXISTS (
    SELECT 1 FROM staffuser.some_patrons s
    WHERE p.patron_id= s.patron_id);
 
--3
SELECT COUNT(patron_id) AS PatronCount
FROM staffuser.some_patrons;


--Listing 10-11. Deleting Rows from Tables
--1
SELECT author_id
FROM staffuser.author_preferences;
 
--2
DELETE staffuser.author_preferences;
 
--3
SELECT author_id
FROM staffuser.author_preferences;
 

--4
SELECT genre_id
FROM staffuser.genre
WHERE genre_id > 200;
 
--5
DELETE staffuser.genre
WHERE genre_id > 200;
 
--6
SELECT genre_id
FROM staffuser.genre
WHERE genre_id > 200;

SELECT genre_id FROM staffuser.genre;


-- TRUNCATE - empty data from table without deleting table
SELECT * FROM staffuser.some_patrons;

TRUNCATE TABLE staffuser.some_patrons; 

SELECT * FROM staffuser.some_patrons;

-- UPDATE

SELECT * 
FROM staffuser.author
WHERE author_id < 5;

UPDATE staffuser.author
SET first_name = 'Billy', last_name = 'S.'
WHERE author_id <5;

SELECT * 
FROM staffuser.author
WHERE author_id < 5;
 


