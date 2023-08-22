USE JunkDB_STL_May2023
GO

-- DROP ALL TABLES
DROP TABLE IF EXISTS staffuser.author;
DROP TABLE IF EXISTS staffuser.author_preferences;
DROP TABLE IF EXISTS staffuser.book;
DROP TABLE IF EXISTS staffuser.genre;
DROP TABLE IF EXISTS staffuser.patron;
DROP TABLE IF EXISTS staffuser.some_patrons;

---

DROP TABLE IF EXISTS JunkDB_STL_May2023.staffuser.author_preferences;

DROP TABLE IF EXISTS JunkDB_STL_May2023.staffuser.book; -- You can only create a table once. If you try to create a table
                                                        -- twice in the same script, your script will fail.  It's common practice
                                                        -- in many situations to write a DROP TABLE IF EXISTS statement into
                                                        -- your script to avoid this problem. You can also choose to comment out
                                                        -- statements like CREATE and INSERT after the first time you run them if you're
                                                        -- likely to run the script again.

CREATE TABLE JunkDB_STL_May2023.staffuser.book (
    book_id INT IDENTITY(1,1) PRIMARY KEY, -- The IDENTITY syntax is as follows: IDENTITY(seed, increment).  
                                            -- We want to seed the first id number as 1 in this table and increment 
                                            -- by 1 for each following book_id.
    author_id INT,
    title VARCHAR(255),
    isbn INT,
    available BIT, --Bit allows three entries: 0 which will stand for false,  1 which will stand for true,  and NULL.
    genre_id INT
);

INSERT INTO JunkDB_STL_May2023.staffuser.book(author_id, title, isbn, available, genre_id)
VALUES (2, 'A Midsummers Night Dream', 978149413, 1, 23),
        (2, 'Romeo and Juliet', 988535196, 1, 3),
        (1, 'The Golden Compass', 451664226, 1, 1),
        (1, 'The Subtle Knife', 160419390, 1, 1),
        (1, 'The Amber Spyglass', 94387895, 1, 1),
        (3, 'The Alchemist', 464069772, 1, 2),
        (4, 'And Then There Were None', 335973357, 1, 6),
        (5, 'The Joy Luck Club', 990050329, 1, 10),
        (5, 'The Moon Lady', 91720786, 1, 24),
        (6, 'Sense and Sensibility', 156879860, 1, 2),
        (6, 'Northanger Abbey', 951273178, 1, 3),
        (6, 'Pride and Prejudice', 415886839, 1, 3),
        (6, 'Mansfield Park', 188534067, 1, 3),
        (6, 'Emma', 994896202, 1, 3),
        (6, 'Persuasion', 28150097, 1, 3),
        (6, 'Lady Susan', 230962926, 1, 3),
        (7, 'Wuthering Heights', 280569946, 1, 3),
        (8, 'The Handmaids Tale', 639239663, 1, 5),
        (8, 'The Testaments', 826875490, 1, 5),
        (9, 'The Parable of the Sower', 283359358, 1, 5),
        (10, 'Little Women', 495409887, 1, 23),
        (11, 'Still Life', 455128657, 1, 6),
        (11, 'A Fatal Grace', 832517012, 1, 6),
        (11, 'The Cruelest Month', 419285319, 1, 6),
        (11, 'The Murder Stone', 656621400, 1, 6),
        (11, 'The Brutal Telling', 144255852, 1, 6),
        (11, 'Bury Your Dead', 208180961, 1, 6),
        (11, 'A Trick of the Light', 93451531, 1, 6),
        (12, 'Midnights Children', 881082293, 1, 10),
        (13, 'Dont Let the Pigeon Drive the Bus!', 18409532, 1, 24),
        (14, 'Beezus and Ramona', 744412630, 1, 24),
        (15, 'Organic Chemistry', 604328803, 1, 25),
        (16, 'I Know Why the Caged Bird Sings', 909947112, 1, 12),
        (17, 'Beloved', 46736233, 1, 10),
        (18, 'Brassbones and Rainbows', 330608463, 1, 26);

-- SELECT * FROM staffuser.book

DROP TABLE IF EXISTS staffuser.author;

CREATE TABLE JunkDB_STL_May2023.staffuser.author (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_year INT,
    death_year INT
);

INSERT INTO JunkDB_STL_May2023.staffuser.author(first_name, last_name, birth_year, death_year)
VALUES ('Phillip', 'Pullman', 1946, null),
        ('William', 'Shakespeare', 1564, 1616),
        ('Paulo', 'Coelho', 1947, null),
        ('Agatha', 'Christie', 1890-09-15, 1976-01-12),
        ('Amy', 'Tan', 1952-02-19, null),
        ('Jane', 'Austin', 1775-12-16, 1817-07-18),
        ('Emily', 'Bronte', 1818-07-30, 1848-12-19),
        ('Margaret', 'Atwood', 1939-11-18, null),
        ('Octavia', 'Butler', 1947-06-22, 2006-02-24),
        ('Louisa May', 'Alcott', 1832-11-29, 1888-03-06),
        ('Louise', 'Penny', 1958-07-01, null),
        ('Salman', 'Rushdie', 1947-08-19, null),
        ('Mo', 'Willems', 1968-02-11, null),
        ('Beverly', 'Cleary', 1916-04-12, null),
        ('Peter', 'Vollhardt', 1946-03-07, null),
        ('Maya', 'Angelou', 1928-04-04, 2014-05-28),
        ('Toni', 'Morrison', 1931-02-18, 2019-08-05),
        ('Shirley', 'LeFlore', 1940-03-06, 2019-05-12);

-- SELECT * FROM staffuser.author;

DROP TABLE IF EXISTS JunkDB_STL_May2023.staffuser.patron;

CREATE TABLE JunkDB_STL_May2023.staffuser.patron (
    patron_id INT IDENTITY (1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
);

INSERT INTO JunkDB_STL_May2023.staffuser.patron(first_name, last_name)
VALUES ('Jennifer', 'Slayny'),
        ('Susan', 'Traviss'),
        ('Vincent', 'Ritelli'),
        ('Tasia', 'Laybourne'),
        ('Wren', 'Gergler'),
        ('Tory', 'Lees'),
        ('Estelle', 'Di Lorio'),
        ('Dorian', 'Betje'),
        ('Frank', 'Jelk'),
        ('Chris', 'Endon'),
        ('Gillie', 'Fritz'),
        ('Leisha', 'Defty'),
        ('Erika', 'Bompass'),
        ('Gabe', 'Moxstead'),
        ('Blake', 'Teresse'),
        ('Joshua', 'Timmouth'),
        ('Tasha', 'Timmouth'),
        ('Neil', 'Davie'),
        ('Emmeline', 'Pitherick'),
        ('Josiah', 'Staner'),
        ('James', 'Greetham'),
        ('Isaac', 'Barstowk'),
        ('Dean', 'Nelane'),
        ('Carolina', 'Cranmere'),
        ('Champ', 'Lardiner'),
        ('Abbie', 'Quaif'),
        ('Camile', 'Milbourne'),
        ('Quentin', 'Crose'),
        ('Silvano', 'Horlick'),
        ('Phyllis', 'Cicchillo'),
        ('Jerrie', 'Brownhall'),
        ('Ludovika', 'Leist'),
        ('Tara', 'Knatt'),
        ('Kelsie', 'Parkson'),
        ('Jodi', 'Leopard'),
        ('Rosanna', 'Cultcheth'),
        ('Remy', 'Fairpool'),
        ('Megan', 'Blyth'),
        ('Rikki', 'McLernon'),
        ('Clare', 'Haacker'),
        ('Vincent', 'Chettle'),
        ('Sybil', 'Costanza'),
        ('Jonas', 'Sinclare'),
        ('Claire', 'Bendel'),
        ('Kathleen', 'Welband'),
        ('Kylie', 'Crannage'),
        ('Evelyn', 'Tarajo'),
        ('Oliver', 'Caulson');

-- SELECT * FROM staffuser.patron

-- add a column called "loan_id" with an INT datatype, but don't add any data to it
ALTER TABLE staffuser.patron
ADD loan_id INT;

-- SELECT * FROM staffuser.patron

DROP TABLE IF EXISTS staffuser.genre

CREATE TABLE JunkDB_STL_May2023.staffuser.genre (
    genre_id INT PRIMARY KEY,
    genres VARCHAR(100)
);

INSERT INTO JunkDB_STL_May2023.staffuser.genre(genre_id, genres)
VALUES (1, 'Fantasy'),
        (2, 'Adventure'),
        (3, 'Romance'),
        (4, 'Contemporary'),
        (5, 'Dystopian'),
        (6, 'Mystery'),
        (7, 'Horror'),
        (8, 'Thriller'),
        (9, 'Paranormal'),
        (10, 'Historical Fiction'),
        (11, 'Science Fiction'),
        (12, 'Memoir'),
        (13, 'Cooking'),
        (14, 'Art'),
        (15, 'Self-Help'),
        (16, 'Development'),
        (17, 'Motivational'),
        (18, 'Health'),
        (19, 'History'),
        (20, 'Travel'),
        (21, 'Guide'),
        (22, 'Families and Relationships'),
        (23, 'Humor'),
        (24, 'Childrens'),
        (25, 'Reference'),
        (26, 'Poetry');

-- SELECT * FROM staffuser.genre

