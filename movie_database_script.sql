/* Database Description
author: Renato Gusani (x19411076)
Database: Top 10 favorite Movies
date of completion: 22/03/2020
*/

# varchar allows both intergers and characters
# int allows for only intergers

-- DROP DATABASE IF EXISTS MoviesDB;
CREATE DATABASE MoviesDB;


USE MoviesDB;


# Only create this table once GENRE & DIRECTOR tables have been made to avoid errors as th last 2 data rows refernce those tables
-- DROP TABLE MOVIES;
CREATE TABLE MOVIES (
	MOVIE_ID VARCHAR(50) NOT NULL,
    MOVIE_TITLE VARCHAR(50) NOT NULL,
    MOVIE_YEAR varchar(10) NOT NULL,
    MOVIE_LANG_SPOKEN VARCHAR(100) NOT NULL,
	GENRE_ID varchar(50),
    DIRECTOR_ID varchar(50) NOT NULL,
    PRIMARY KEY (MOVIE_ID),
    FOREIGN KEY(DIRECTOR_ID) REFERENCES DIRECTOR(DIRECTOR_ID),
    FOREIGN KEY(GENRE_ID) REFERENCES GENRE(GENRE_ID)
 );
 
 -- DROP TABLE GENRE;
CREATE TABLE GENRE (
	GENRE_ID varchar(30) NOT NULL,
	GENRE_TYPE varchar(30) NOT NULL,
	PRIMARY KEY (GENRE_ID)
);
 
 -- DROP TABLE DIRECTOR;
 CREATE TABLE DIRECTOR (
	DIRECTOR_ID VARCHAR(10) NOT NULL,
    DIRECTOR_NAME VARCHAR(20),
    PRIMARY KEY (DIRECTOR_ID)
 );
 
 # Create MOVIES table before creating this table
 -- DROP TABLE MOVIE_CAST;
CREATE TABLE MOVIE_CAST (
	ACTOR_ID VARCHAR(10) NOT NULL,
    MOVIE_ID VARCHAR(10),
    MOVIE_ROLE VARCHAR(100),
    PRIMARY KEY (ACTOR_ID),
    FOREIGN KEY(MOVIE_ID) REFERENCES MOVIES(MOVIE_ID)
 );
 
 -- DROP TABLE ACTORS;
CREATE TABLE ACTORS (
	ACTOR_ID VARCHAR(10),
    ACTOR_NAME VARCHAR(50),
    ACTOR_GENDER CHAR(1),
    PRIMARY KEY (ACTOR_NAME),
    FOREIGN KEY(ACTOR_ID) REFERENCES MOVIE_CAST(ACTOR_ID)    
);

-- DROP TABLE RATING;
CREATE TABLE RATING (
	MOVIE_ID VARCHAR(10),
    RATING_STARS VARCHAR(10),
    PRIMARY KEY (RATING_STARS),
    FOREIGN KEY(MOVIE_ID) REFERENCES MOVIE_CAST(MOVIE_ID)
);

    INSERT INTO GENRE(GENRE_ID,GENRE_TYPE)
    VALUES
	('G01', 'Action'),
	('G02', 'Comedy'),
	('G03', 'Thriller'),
	('G04', 'Drama'),
    ('G05', 'Sci-Fi'),
	('G06', 'Crime'),
    ('G07', 'Adventure'),
    ('G08', 'Biography'),
    ('G09', 'History'),
    ('G10', 'Horror');

    INSERT INTO DIRECTOR(DIRECTOR_ID,DIRECTOR_NAME)
    VALUES
	('D01', 'Stanley Tong'),
	('D02', 'Neil Blomkamp'),
	('D03', 'John Singleton'),
	('D04', 'Matt Reeves'),
	('D05', 'Wilson Yip'),
	('D06', 'Francis Ford Coppola'),
	('D07', 'Jim Sheridan'),
	('D08', 'Frank Darabont'),
    ('D09', 'Christopher Nolan');
    
    /* the following command seems to fix the ERROR 1452 which won't allow insertion of values in the following tables
    Reference; https://stackoverflow.com/a/55372574
    */
    SET FOREIGN_KEY_CHECKS=0;

    INSERT INTO ACTORS(ACTOR_ID,ACTOR_NAME, ACTOR_GENDER)
    VALUES
	('A01', 'Jackie Chan', 'M'),
	('A02', 'Anita Mui', 'F'),
	('A03', 'Françoise Yip', 'F'),
	('A04', 'Sharlto Copley', 'M'),
	('A05', 'David James', 'M'),
	('A06', 'Jason Cope', 'M'),
	('A07', 'Paul Walker', 'M'),
	('A08', 'Tyrese Gibson', 'M'),
	('A09', 'Cole Hauser', 'M'),
	('A10', 'Andy Serkis', 'M'),
	('A11', 'Woody Harrelson', 'M'),
	('A12', 'Steve Zahn', 'M'),
	('A13', 'Donnie Yen', 'M'),
	('A14', 'Simon Yam', 'M'),
	('A15', 'Siu-Wong Fan', 'M'),
	('A16', 'Marlon Brando', 'M'),
	('A17', ' Al Pacino', 'M'),
	('A18', 'James Caan', 'M'),
	('A19', '50 Cent', 'M'),
	('A20', 'Joy Bryant', 'F'),
	('A21', 'Adewale Akinnuoye-Agbaje', 'M'),
	('A22', 'Thomas Jane', 'M'),
	('A23', 'Marcia Gay Harden', 'F'),
	('A24', 'Laurie Holden', 'F'),
	('A25', 'Christian Bale', 'M'),
	('A26', 'Michael Caine', 'M'),
	('A27', 'Ken Watanabe', 'M'),
	('A28', 'Heath Ledger', 'M'),
	('A29', 'Aaron Eckhart ', 'M');

    INSERT INTO MOVIE_CAST(ACTOR_ID, MOVIE_ID, MOVIE_ROLE)
    VALUES
	('A01', 'M01', 'Keung'),
	('A02', 'M01', 'Elaine'),
	('A03', 'M01', 'Nancy'),
	('A04', 'M02', 'Wikus Van De Merwe'),
	('A05', 'M02', 'Grey Bradnam - UKNR Chief Correspondent / Christopher Johnson'),
	('A06', 'M02', 'Sarah Livingstone - Sociologist'),
	('A07', 'M03', 'Brian O Conner'),
	('A08', 'M03', 'Roman Pearce (as Tyrese)'),
	('A09', 'M03', 'Carter Verone'),
	('A10', 'M04', 'Caesar'),
	('A11', 'M04', 'The Colonel'),
	('A12', 'M04', 'Bad Ape'),
	('A13', 'M05', 'Ip Man'),
	('A14', 'M05', 'Quan'),
	('A15', 'M05', 'Jin (as Fan Sui Wong)'),
	('A16', 'M06', 'Don Vito Corleone'),
	('A17', 'M06', 'Michael Corleone'),
	('A18', 'M06', 'Sonny Corleone'),
	('A19', 'M07', 'Marcus (as Curtis 50 Cent Jackson)'),
	('A20', 'M07', 'Charlene'),
	('A21', 'M07', 'Majestic'),
	('A22', 'M08', 'David Drayton'),
	('A23', 'M08', 'Mrs. Carmody'),
	('A24', 'M08', 'Amanda Dunfrey'),
	('A25', 'M09, M10', 'Bruce Wayne / Batman, Bruce Wayne'),
	('A26', 'M09', 'Alfred'),
	('A27', 'M09', 'Ducard'),
	('A28', 'M10', 'Joker'),
	('A29', 'M10', 'Harvey Dent');
    
    INSERT INTO RATING(MOVIE_ID,RATING_STARS)
    VALUES
	('M01', '6.7/10'),
    ('M02', '7.9/10'),
    ('M03', '5.9/10'),
    ('M04', '7.4/10'),
    ('M05', '8.0/10'),
    ('M06', '9.2/10'),
    ('M07', '5.3/10'),
    ('M08', '7.1/10'),
    ('M09', '8.2/10'),
	('M10', '9.0/10');

    INSERT INTO MOVIES(MOVIE_ID,MOVIE_TITLE, MOVIE_YEAR, MOVIE_LANG_SPOKEN, GENRE_ID, DIRECTOR_ID)
    VALUES
	('M01', 'Rumble in the Bronx', '1995', 'Cantonese, English', 'G01, G02, G06, G03', 'D01'),
	('M02', 'District 9', '2009', 'English, Nyanja, Afrikaans, Zulu, Xhosa, Southern Sotho', 'G01, G05, G03', 'D02'),
	('M03', '2 fast 2 Furious', '2003', 'English, Spanish',  'G01, G06, G03', 'D03'),
	('M04', 'War for the Planet of the Apes', '2017', 'English, American Sign Language', 'G01 G07 G04 G05 G03', 'D04'),
	('M05', 'Ip Man', '2008', 'Cantonese, Mandarin, Japanese', 'G08, G04, G09', 'D05'),
	('M06', 'The Godfather', '1972', 'English, Itlaian, Latin', 'G06, G04', 'D06'),
	('M07', 'Get Rich or Die Tryin', '2005', 'English, Spanish', 'G08, G07, G04', 'D07'),
	('M08', 'The Mist', '2007', 'English',  'G10, G05', 'D08'),
	('M09', 'Batman Begins', '2005', 'English, Mandarin', 'G10, G05', 'D09'),
	('M10', 'The Dark Knight', '2008', 'English, Mandarin', 'G01, G04, G06', 'D09');

SELECT * FROM MOVIES;
SELECT * FROM GENRE;
SELECT * FROM DIRECTOR;
SELECT * FROM MOVIE_CAST;
SELECT * FROM ACTORS;
SELECT * FROM RATING;



/*This is a reference for the following commented commands which were used to test the implemented database above
The following commands were taken from
http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm
*/

# Returns the columns and column information pertaining to the designated table.
-- show columns from [table name];

# Show certain selected rows with the value "whatever".
-- SELECT * FROM [table name] WHERE [field name] = "whatever";

# To see all the tables in the db.
-- show tables;

# To see database's field formats.
-- describe GENRE;

# Show all data in a table.
-- 	SELECT * FROM [table name];


