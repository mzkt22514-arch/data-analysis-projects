/*
--Part 1A: Left table is books; Right table is 
--tr...the table listed before the LEFT JOIN is 
--the left while the table listed after is the right

--Part 1B: The table changed becuase the results only 
--included books that were matched with users in the 
--to_read table. It eliminates books not in anyone's 
--to-read list, making it behave like an INNER JOIN.

--Part 2A: Left table is b; Right table is tr...the table 
--after the RIGHT JOIN is the right table

--Part 2B: The RIGHT-joined table returns results from the 
--right table and any matches from the left table while the 
--LEFT-joined tables return results from the left table and 
--any matches within the right table. (Venn Diagram theory) 
--So, the RIGHT JOIN clause is helpful during preservation 
--of all entries from the to_read table, even if some of 
--them don't have matching books in the books table.

--Part 3A: A FULL JOIN is useful when I want to see results 
--of all books,including those not yet added to anyone's 
--to-read list, and all to_read entries that may reference 
--books no longer available in the books table. This way I 
--don't miss any data from either side.

--Part 4A: An INNER JOIN find result matches between the 
--left and right tables based on a common column. 

--Part 4B: No, it is not necessary. This is because the 
--INNER JOIN only returns rows where there is a match 
--in both tables. 

--Part 4C:
 SELECT TOP 30 
    b.title, 
    b.average_rating, 
    b.books_count, 
    tr.user_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
    ON b.book_id = tr.book_id
ORDER BY tr.book_id;

--Part 5A:
SELECT TOP 1 books.title, COUNT(*) AS tag_count
FROM BooksDB.dbo.books AS books
INNER JOIN BooksDB.dbo.book_tags AS books_tags
ON books.best_book_id = books_tags.goodreads_book_id
GROUP BY books.title
ORDER BY tag_count DESC;

--Part 5B:
SELECT COUNT(DISTINCT book_tags.tag_id) AS unique_tag_count
FROM BooksDB.dbo.books AS books
INNER JOIN BooksDB.dbo.book_tags AS book_tags
ON books.best_book_id = book_tags.goodreads_book_id
WHERE books.title = 'Selected Poems';

--Part 5C:
SELECT TOP 1 tag_name, COUNT(*) AS tag_frequency
FROM BooksDB.dbo.books AS books
INNER JOIN BooksDB.dbo.book_tags AS books_tags
    ON books.best_book_id = books_tags.goodreads_book_id
INNER JOIN BooksDB.dbo.tags AS tags
    ON books_tags.tag_id = tags.tag_id
WHERE books.title = 'Selected Poems'
GROUP BY tag_name
ORDER BY tag_frequency DESC;

--Part 6A:
SELECT tag_id, tag_name
FROM BooksDB.dbo.tags
WHERE tag_name LIKE '%baking%';

SELECT TOP 1 title, COUNT(*) AS tag_count
FROM BooksDB.dbo.books 
INNER JOIN BooksDB.dbo.book_tags  
ON books.best_book_id = book_tags.goodreads_book_id
WHERE book_tags.tag_id = 3823
GROUP BY title
ORDER BY tag_count DESC;

--7A:
SELECT TOP 10 title, COUNT(*) AS tag_count
FROM BooksDB.dbo.books
INNER JOIN BooksDB.dbo.to_read
ON books.book_id = to_read.book_id
GROUP BY title

--7B:
SELECT TOP 10 
    title, 
    COUNT(DISTINCT to_read.[user_id]) AS user_count
FROM BooksDB.dbo.books
INNER JOIN BooksDB.dbo.to_read
ON books.book_id = to_read.book_id
GROUP BY title
ORDER BY user_count DESC;

--Part 8A:
SELECT TOP 10 user_id, COUNT (book_id) AS to_read_count
FROM BooksDB.dbo.to_read
GROUP BY user_id
ORDER BY to_read_count DESC;

--Part 8B:
SELECT [user_id]
FROM BooksDB.dbo.to_read
GROUP BY [user_id]
HAVING COUNT(book_id) = 15;

SELECT BooksDB.dbo.to_read.book_id, title
FROM BooksDB.dbo.to_read
JOIN BooksDB.dbo.books
    ON to_read.book_id = books.book_id
WHERE user_id = 44529
ORDER BY title;

--For some odd reason, this last query only runs when I include the DB and
--specified table name in the SELECT statement for the book_id..nonetheless,
--we perserve I guess..
*/
