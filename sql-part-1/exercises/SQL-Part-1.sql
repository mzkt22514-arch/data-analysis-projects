/*SELECT TOP 1000 *
FROM BooksDB.dbo.books;

SELECT COUNT (*) AS total_titles
FROM  BooksDB.dbo.books;

SELECT COUNT(*) AS books_before_1800
FROM BooksDB.dbo.books
WHERE original_publication_year < 1800;

SELECT DISTINCT authors
FROM BooksDB.dbo.books;

SELECT COUNT (*) AS english_books
FROM BooksDB.dbo.books
WHERE language_code LIKE 'eng%' 
OR language_code Like 'en-%'

SELECT COUNT (*) AS ww1_titles
FROM BooksDB.dbo.books
WHERE original_publication_year BETWEEN 1914 and 1921;

SELECT TOP 1000 *
FROM BooksDB.dbo.book_tags
ORDER BY tag_id;

SELECT COUNT (goodreads_book_id) AS total_books
FROM BooksDB.dbo.book_tags
GROUP BY tag_id
ORDER BY total_books DESC;

SELECT tag_id, COUNT (goodreads_book_id) AS total_tagged_books
FROM BooksDB.dbo.book_tags
GROUP BY tag_id
ORDER BY total_tagged_books DESC;

SELECT TOP 1000 *
FROM BooksDB.dbo.ratings
ORDER BY book_id DESC;

SELECT COUNT (*) AS total_ratings
FROM BooksDB.dbo.ratings
WHERE rating < 2

SELECT COUNT(*) AS total_sum
FROM BooksDB.dbo.ratings
WHERE rating >= 4;

SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name LIKE 'mystery%';

-- I am asked to run a query that returns tag_id(s) where
-- the tag_name starts with a "c" only

SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name < 'd' AND tag_name >= 'c';

SELECT user_id, COUNT(user_id) AS total_books_to_read
FROM BooksDB.dbo.to_read
GROUP BY user_id 
ORDER BY [user_id] ASC;

SELECT user_id, COUNT(book_id) AS total_books_to_read
FROM BooksDB.dbo.to_read
GROUP BY [user_id] 
ORDER BY [total_books_to_read] DESC;
*/


