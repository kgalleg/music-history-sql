-- Query all of the entries in the Genre table
SELECT "GenreId", "Label"
FROM Genre;

--Query Song Table for Title and SongLength
SELECT "Title", "SongLength", "ReleaseDate"
FROM Song;


-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (null, "Joe Lizzo", 2019);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "Here it is", "11/11/2011", 2234, "Columbia", 2, 29);

-- * select all from 
SELECT * FROM Album;
SELECT * FROM Artist;
SELECT * FROM Song;


-- how to update something:
UPDATE Album
SET ArtistId = 29
WHERE AlbumId = 23;

UPDATE Album
SET ArtistId = 28
WHERE AlbumId = 23;

UPDATE Album
SET GenreId = 2
WHERE AlbumId = 23;

-- how to delete something
DELETE
FROM Artist
WHERE ArtistId = 32;

DELETE
FROM Artist
WHERE ArtistId = 31;

DELETE
FROM Artist
WHERE ArtistId = 30;

DELETE
FROM Artist
WHERE ArtistId = 29;

DELETE
FROM Song
WHERE SongId = 22;







-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Yeah, yeah, yeah", "46", "12/2/12", 2, 28, 23);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Boo", "462", "12/2/12", 2, 28, 23);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "My house", "96", "12/2/12", 2, 28, 23);



-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.Title, al.Title, ar.ArtistName, ar.ArtistId
FROM Artist ar 
Left Join Song s 
Left Join Album al 
ON s.AlbumId = al.AlbumId
WHERE ar.ArtistId = 29;


-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- #this one doesn't work - a. or a is like saying album.Title or song.Title
-- #this below will read starting from FROM and read that and then go back to SELECT and read that second.

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;

-- #this one works
SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId;



-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT al.Title,COUNT(SongId)
FROM Song s
Left Join Album al 
ON s.AlbumId = al.AlbumId
GROUP BY s.AlbumId;




-- #this gives you the count of ALL the songs
SELECT Count(*)
FROM Song



-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT --this gives you the order of how it displays so album title will display 1st

SELECT ar.ArtistName, ar.ArtistId, COUNT(SongId)
-- I think that this below is just selecting the Song table, the s is something I gave it.
FROM Song s
-- I think that this below is just selecting the Artist table and the ar is something i gave it to know what table.
Left Join Artist ar 
ON ar.ArtistId = s.ArtistId
GROUP BY ar.ArtistName;



-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT(s.GenreId)
FROM Song s
Left Join Genre g
ON g.GenreId = s.GenreId
GROUP BY g.Label;



-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(AlbumLength) as AlbumWithLongestDuration, al.Title as AlbumTitle
FROM Album al


-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(SongLength) as SongWithLongestDuration, s.Title as SongTitle
FROM Song s


-- Modify the previous query to also display the title of the album.
SELECT MAX(SongLength) as SongWithLongestDuration, s.Title as SongTitle, al.Title as AlbumTitle
FROM Song s
Left Join Album al
on s.ArtistId = al.ArtistId

