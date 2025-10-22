/*
--A
SELECT MAX(LEN(title)) AS max_title_length
FROM BooksDB.dbo.books;
--B
SELECT title
FROM BooksDB.dbo.books
WHERE LEN(title) = 186;

--A
SELECT MIN(LEN(authors)) AS min_author_length
FROM BooksDB.dbo.books;
--B
SELECT authors 
FROM BooksDB.dbo.books
WHERE LEN(authors) = (SELECT MIN(LEN(authors)) 
FROM BooksDB.dbo.books);

--A
SELECT COUNT(*) AS Books_with_The
FROM BooksDB.dbo.books
WHERE title LIKE '%THE%';

SELECT COUNT(*) AS Z_Autors
FROM BooksDB.dbo.books
WHERE LEFT(authors, 1) = 'Z';

SELECT COUNT(*) AS non_eng_books
FROM BooksDB.dbo.books
WHERE 
    LEFT(language_code, 2) != 'en'
    AND LEFT(language_code, 3) != 'eng'

SELECT COUNT(*) AS non_eng_books
FROM BooksDB.dbo.books
WHERE SUBSTRING(language_code, 1, 2) <> 'en';

SELECT title, authors, language_code,
CONCAT(title, 'by', authors, 'in', language_code, 'language') AS
Title_by_Authors_in_Language
FROM BooksDB.dbo.books;

--7A
SELECT title, authors, language_code
FROM BooksDB.dbo.books
WHERE title IS NULL
OR authors IS NULL
OR language_code IS NULL;

--Yes, any row where language_code was NULL now displays 'unknown' in 
--both language_code column and the sentence results. 
SELECT 
  title, 
  authors, 
  COALESCE(language_code, 'unknown') AS language_code,
  title + ' by ' + authors + ' in ' + COALESCE(language_code, 'unknown') + ' language' AS Title_by_Authors_in_Language
FROM BooksDB.dbo.books;

--Yes, it has the same visible results as COALESCE, replacing NULL 
--with 'unknown'
SELECT 
  title, 
  authors, 
  ISNULL(language_code, 'unknown') AS language_code,
  CONCAT(title, ' by ', authors, ' in ', ISNULL(language_code, 'unknown'), ' language') AS Title_by_Authors_in_Language
FROM BooksDB.dbo.books;
*/