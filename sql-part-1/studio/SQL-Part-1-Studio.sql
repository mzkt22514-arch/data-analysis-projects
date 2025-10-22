/*
SELECT TOP 100 book_id,
authors, title, average_rating AS avg_rating 
FROM Booksdb.dbo.books
ORDER BY average_rating DESC;

SELECT TOP 1 book_id,
authors, title, average_rating
FROM BooksDB.dbo.books
ORDER BY average_rating ASC;

SELECT TOP 1 
    tag_id,
    COUNT(*) AS tag_count
FROM BooksDB.dbo.book_tags
GROUP BY tag_id
ORDER BY tag_count DESC;

SELECT TOP 1
    t.tag_name,
    COUNT (bt.tag_id) AS tag_count
FROM BooksDB.dbo.book_tags AS bt 
JOIN Booksdb.dbo.tags AS t 
ON bt.tag_id = t.tag_id
GROUP BY t.tag_name
ORDER BY tag_count DESC;

SELECT TOP 1 book_id, 
user_id, 
rating AS total_ratings
FROM BooksDB.dbo.ratings
ORDER BY rating DESC;

SELECT COUNT(*) AS count_happy_titles
FROM BooksDB.dbo.books
WHERE title LIKE '%happy%';

-- The order of each query is different so it indeed does matter in sorting
SELECT TOP 3 
    authors,
    AVG(average_rating) AS avg_rating
FROM BooksDB.dbo.books
GROUP BY authors
ORDER BY avg_rating DESC;

SELECT 
    book_id,
    title,
    authors,
    average_rating
FROM BooksDB.dbo.books
WHERE authors IN (
    'Anonymous, Lane T. Dennis, Wayne A. Grudem',
    'Bill Watterson',
    'Anonymous, Ronald A. Beers, Ronald A. Beers'
)
ORDER BY authors ASC, average_rating DESC;

SELECT
COUNT(DISTINCT authors) AS authors_between_rock_and_roll
FROM BooksDB.dbo.books
WHERE authors BETWEEN 'Rock' AND 'Roll'; 

--Authors with the most books in the dataset
SELECT TOP 10
authors, 
COUNT (*) AS num_books
FROM BooksDB.dbo.books
GROUP BY authors 
ORDER BY num_books DESC;

--Users with the biggest "To Read" lists
SELECT TOP 10
user_id,
COUNT (DISTINCT book_id) AS total_books_to_read
FROM BooksDB.dbo.to_read
GROUP BY user_id 
ORDER BY total_books_to_read DESC;
*/