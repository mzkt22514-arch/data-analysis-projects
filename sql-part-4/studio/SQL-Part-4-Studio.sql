/*
--Q1:

SELECT title, authors
FROM BooksDB.dbo.books
WHERE authors LIKE '%,%';

--Q2:

SELECT title
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.book_tags
ON books.book_id = book_tags.goodreads_book_id
JOIN BooksDB.dbo.tags
ON book_tags.tag_id = tags.tag_id
WHERE tag_name = 'meditation';

--Q3:

SELECT 
    title,
    original_title,
    average_rating
FROM BooksDB.dbo.books
WHERE average_rating >= 4.2
AND original_title IS NOT NULL
AND title = original_title
ORDER BY average_rating DESC;

--Q4A:

SELECT 
  title, 
  original_publication_year, 
  average_rating, 
  AVG(average_rating) AS reader_average_rating
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.ratings
  ON books.book_id = ratings.book_id
GROUP BY 
  title, 
  original_publication_year, 
  average_rating
HAVING 
  AVG(average_rating) > average_rating;

--Q4B:

SELECT 
  title, 
  original_publication_year, 
  average_rating, 
  AVG(average_rating) AS reader_average_rating
FROM BooksDB.dbo.books
JOIN BooksDB.dbo.ratings
  ON books.book_id = ratings.book_id
GROUP BY 
  title, 
  original_publication_year, 
  average_rating
HAVING 
  AVG(average_rating) > average_rating
ORDER BY 
  original_publication_year ASC, 
  title ASC;
*/