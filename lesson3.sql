-- SELECT Function (This is way to retrieve columns from a dataset)

SELECT * FROM FilmLocations  WHERE Director = 'Jayendra'

SELECT COUNT(LOCATIONS) FROM FilmLocations WHERE Writer = "James Cameron" -- Here we can count how many rows have the director james cameron.

SELECT DISTINCT Title FROM FilmLocations -- Get unique titles.

SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures" -- Count how many unique years WBs have made a movie i think.

SELECT * FROM FilmLocations LIMIT 25; -- Selects first 25 rows

SELECT * FROM FilmLocations LIMIT 15 OFFSET 10 -- Selects the first 15 starting at 11.

SELECT DISTINCT Title, ReleaseYear FROM FilmLocations WHERE ReleaseYear >= 2000 -- Retrieve the names of all unique films released in the 21st century and onwards, along with their release years.

SELECT COUNT(DISTINCT Distributor) FROM FilmLocations WHERE Actor1 = 'Clint Eastwood' -- Retrieve the number of distributors who distributed films with the 1st actor, Clint Eastwood.

-- INSERT this is a way to add to a table

INSERT INTO table_name (column1, column2, ... ) VALUES (value1, value2, ... );

INSERT INTO Instructor(ins_id, lastname, firstname, city, country) VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');

INSERT INTO Instructor (ins_id, lastname, firstname, city, country) VALUES (8, 'Steve', 'Ryan', 'Barbly', 'GB'), (9, 'Ramesh', 'Sannareddy', 'Hyderabad', 'IN') # Inserting into two rows

-- UPDATE is a way to change values in a table

UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

UPDATE Instructor SET city='Toronto' WHERE firstname="Sandip"; -- Set city as Toronto where the first name is Sandip

UPDATE Instructor SET city='Dubai', country='AE' WHERE ins_id=5 -- Set two things

-- DELETE obv delete rows

DELETE FROM table_name WHERE condition;

DELETE FROM instructor WHERE ins_id = 6;