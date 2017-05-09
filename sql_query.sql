
---CART PAGE
SELECT carts.id, carts.book_id, carts.number, books.name, books.price, books.publisher, books.republished_date, books.author, books.isbn, books.weight, books.short_description, books.icon FROM carts
LEFT JOIN books ON carts.book_id = books.id
WHERE carts.user_id = 1
