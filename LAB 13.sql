----PART-A------

---ALL FULL OUTER JOIN

---CANT USE ALIAS IN HAVING BUT CAN USE IN ORDER BY

----List all books with their authors. 

SELECT TITLE, AUTHORNAME
FROM AUTHOR FULL OUTER JOIN BOOK
ON AUTHOR.AuthorID=BOOK.AUTHORID

----List all books with their publishers. 

SELECT TITLE, PUBLISHERNAME
FROM Publisher FULL OUTER JOIN BOOK
ON PUBLISHER.PublisherID=BOOK.PublisherID

-----List all books with their authors and publishers. 

SELECT TITLE,AUTHORNAME,PUBLISHERNAME
FROM AUTHOR FULL OUTER JOIN BOOK
ON AUTHOR.AuthorID=BOOK.AUTHORID
FULL OUTER JOIN PUBLISHER
ON PUBLISHER.PublisherID=BOOK.PublisherID 

----List all books published after 2010 with their authors and publisher and price. 

SELECT TITLE,AUTHORNAME,PUBLISHERNAME,PRICE
FROM AUTHOR JOIN BOOK
ON AUTHOR.AuthorID=BOOK.AUTHORID
FULL OUTER JOIN PUBLISHER
ON PUBLISHER.PublisherID=BOOK.PublisherID 
WHERE PublicationYear>2010

---List all authors and the number of books they have written.

SELECT AUTHORNAME,COUNT(BOOKID) AS BOOK_COUNT
FROM AUTHOR FULL OUTER JOIN BOOK
ON AUTHOR.AuthorID=BOOK.AUTHORID
GROUP BY AuthorName

----List all publishers and the total price of books they have published. 

SELECT PUBLISHERNAME,SUM(PRICE) AS TOTAL_PRICE
FROM Publisher FULL OUTER JOIN BOOK
ON PUBLISHER.PublisherID=BOOK.PUBLISHERID
GROUP BY PublisherName

----List authors who have not written any books. 

SELECT AuthorName
FROM AUTHOR LEFT JOIN BOOK 
ON AUTHOR.AuthorID=BOOK.AUTHORID
WHERE BOOK.AuthorID IS NULL

-----Display total number of Books and Average Price of every Author. 

SELECT AUTHORNAME,COUNT(BOOKID) AS TOTAL_BOOKS,AVG(PRICE) AS AVERAGE_PRICE
FROM AUTHOR LEFT JOIN BOOK
ON AUTHOR.AuthorID=BOOK.AUTHORID
GROUP BY AuthorName

----lists each publisher along with the total number of books they have published, sorted from highest to lowest.


SELECT PUBLISHERNAME,COUNT(BOOKID) AS TOTAL_BOOKS
FROM PUBLISHER LEFT JOIN BOOK
ON PUBLISHER.PublisherID=BOOK.AUTHORID
GROUP BY PUBLISHERNAME
ORDER BY TOTAL_BOOKS

----- Display number of books published each year.

SELECT PublicationYear,COUNT(BOOKID) AS TOTAL_BOOKS
FROM PUBLISHER JOIN BOOK
ON PUBLISHER.PublisherID=BOOK.AUTHORID
GROUP BY PublicationYear

----PART-B-----

-----List the publishers whose total book prices exceed 500, ordered by the total price. 

SELECT PUBLISHERNAME,SUM(PRICE) AS TOTAL_BOOK_PRICE
FROM PUBLISHER JOIN BOOK
ON PUBLISHER.PublisherID=BOOK.PUBLISHERID
GROUP BY PUBLISHERNAME
HAVING SUM(PRICE)>500
ORDER BY TOTAL_BOOK_PRICE

-----List most expensive book for each author, sort it with the highest price.

----Msg 8120, Level 16, State 1, Line 93
-----Column 'BOOK.Title' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


SELECT A.AuthorName, B.Title, B.Price
FROM Author A
JOIN Book B
    ON A.AuthorID = B.AuthorID
WHERE B.Price = (
    SELECT MAX(B2.Price)
    FROM Book B2
    WHERE B2.AuthorID = A.AuthorID
)
ORDER BY B.Price DESC;


-----PART-C-----










