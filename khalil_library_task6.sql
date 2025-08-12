USE khalil_library;

SELECT * 
FROM Book
WHERE published_year > (SELECT AVG(published_year) FROM Book);

SELECT name
FROM Member
WHERE member_id IN (SELECT member_id FROM IssuedBook);

SELECT name
FROM Member
WHERE member_id NOT IN (SELECT member_id FROM IssuedBook);

SELECT name
FROM Member m
WHERE (SELECT COUNT(*) FROM IssuedBook i WHERE i.member_id = m.member_id) > 1;

SELECT category_id, total_books
FROM (
    SELECT category_id, COUNT(*) AS total_books
    FROM Book
    GROUP BY category_id
) AS book_counts
ORDER BY total_books DESC
LIMIT 1;

SELECT name
FROM Author a
WHERE EXISTS (SELECT 1 FROM Book b WHERE b.author_id = a.author_id);

SELECT *
FROM Book
WHERE published_year = (SELECT MIN(published_year) FROM Book);
