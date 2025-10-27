/*
--EVENT 1
--what I need: tag_id, # of times a tag was used, tag_name

SELECT DISTINCT tag_name
FROM BooksDB.dbo.tags;

--returned tags such as: feminist, mom, mother, women, and woman

SELECT tag_id, tag_name, COUNT(tag_id) AS tag_count
FROM BooksDB.dbo.tags
WHERE tag_name LIKE '%woman%' 
    OR tag_name LIKE '%female%' 
    OR tag_name LIKE '%women%' 
    OR tag_name LIKE '%mothers%' 
    OR tag_name LIKE '%mom%'
GROUP BY tag_id, tag_name
HAVING COUNT (tag_id) >= 1;

--EVENT 2:

--What I need: authors, titles, ratings, and tag_id based on an event
--Event: Spring Fest
--BOOKS TABLE: authors, title
--RATINGS TABLE: rating
--TAGS TABLE: tag_id
--I must join certain tables to achieve what the question asks of me 
--because each column is under a different table. This will more than l
--ikely be an INNER JOIN to connect them all together
--I'll start by identifying what tag_names are available to include in my 
--WHERE, LIKE statement

SELECT DISTINCT tag_name
FROM BooksDB.dbo.tags
WHERE tags.tag_name LIKE '%spring%';

--Then I'll work on my query

SELECT DISTINCT 
    BooksDB.dbo.books.authors,
    BooksDB.dbo.books.title,
    BooksDB.dbo.ratings.rating,
    BooksDB.dbo.tags.tag_id
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.book_tags 
    ON books.book_id = book_tags.goodreads_book_id
JOIN BooksDB.dbo.tags 
    ON book_tags.tag_id = tags.tag_id
JOIN BooksDB.dbo.ratings 
    ON books.book_id = ratings.book_id
WHERE tag_name LIKE '%spring%'

--The dataset only returned Diamonds Are Forever tagged with a Spring-related
--term, which made it the clear choice for our Spring Fest promotion

--PART 2; Q1 
--Month: October

--PART 2; Q2

--EVENT 1: Friday Fright Night Reads
--promotes horror, thriller, paranormal activity, or more
--can be ran ever Friday in October

--EVENT 2: Wellness Wednesday
--promotos BCAM foucusing on health, cancer, memoirs, or somethings
--of the sort

--PART 3; EVENT 1 QUERY:

SELECT 
   authors,
    title,
    AVG(rating) AS avg_rating,
    tag_name
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.ratings 
    ON books.book_id = ratings.book_id
JOIN BooksDB.dbo.book_tags 
    ON books.book_id = book_tags.goodreads_book_id
JOIN BooksDB.dbo.tags 
    ON book_tags.tag_id = tags.tag_id
WHERE tag_name LIKE '%horror%' 
   OR tag_name LIKE '%ghost%' 
   OR tag_name LIKE '%thriller%' 
   OR tag_name LIKE '%paranormal%'
GROUP BY 
    authors,
    title,
    tag_name
HAVING AVG(rating) >= 4
ORDER BY avg_rating DESC;

--I used this query beacause
--I wanted to use ratings to promote only the best performing
--horror titles. I used 4 insted of 5 because most of the titles had a rating
--of 4. I waned to include differemt columns so I had to join the tables to make this query happen

--PART 3; EVENT 2 QUERY:

SELECT 
    authors,
    title,
    tag_name
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.book_tags 
    ON books.book_id = book_tags.goodreads_book_id
JOIN BooksDB.dbo.tags 
    ON book_tags.tag_id = tags.tag_id
WHERE tag_name LIKE '%cancer%'
   OR tag_name LIKE '%breast cancer%'
GROUP BY 
    authors, 
    title, 
    tag_name
ORDER BY tag_name;

--This query targets relevant themes tied to Breast Cancer. The main book returned
--is the book that'll be used to promote the event
*/