/*
--Q1

SELECT COUNT(user_id)
FROM BooksDB.dbo.ratings
WHERE rating > (
    SELECT AVG(rating)
    FROM BooksDB.dbo.ratings
    WHERE book_id = ratings.book_id
);

--Q2

SELECT book_id
FROM BooksDB.dbo.ratings
WHERE rating = 1
GROUP BY book_id
HAVING COUNT(book_id) < 1000

UNION

SELECT book_id
FROM BooksDB.dbo.ratings
WHERE rating = 5
GROUP BY book_id
HAVING COUNT(book_id) < 1000;

--Query for some reason didn't return any data...I'm guessing the data doesn't have
--books that have over 1000 ratings for each rating type..despite my finding in my 
--diagnostic query that I ran below returns which multiple results for each rating...

SELECT rating, COUNT(*) 
FROM BooksDB.dbo.ratings
GROUP BY rating
ORDER BY rating;

--I even tried a very basic query and it still didn't work...
SELECT book_id
FROM BooksDB.dbo.ratings
WHERE rating = 1
GROUP BY book_id
HAVING COUNT(*) >= 1000;

--Q3

SELECT book_id
FROM BooksDB.dbo.ratings
WHERE rating = 1
GROUP BY book_id
HAVING COUNT(*) > 1000

INTERSECT

SELECT book_id
FROM BooksDB.dbo.ratings
WHERE rating = 5
GROUP BY book_id
HAVING COUNT(*) > 1000;

--Q4

SELECT book_id
FROM BooksDB.dbo.books
WHERE language_code = 'en-US'
  AND language_code <> 'en-GB';

--Q5

SELECT tag_id, tag_name
FROM BooksDB.dbo.tags
WHERE tag_id IN (
    SELECT tag_id
    FROM BooksDB.dbo.book_tags
    GROUP BY tag_id
    HAVING COUNT(*) > 100000)
--For this one, when I switched the inequalities sign fron
--greater than to less than, I returned results...so what I'm understanding is 
--the dataset does not have tag_ids used more than 100,000 times..but
--it does have tag_ids used less than 100,000 times...I'm not sure if I'm right or not
--honestly just my findings...
*/