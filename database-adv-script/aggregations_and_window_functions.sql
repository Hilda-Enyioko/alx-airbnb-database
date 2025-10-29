USE airbnb;

SELECT u.user_id, u.first_name, u.last_name, book_count.total_bookings
FROM user
INNER JOIN (
    SELECT user_id, COUNT(booking_id) as total_bookings
    FROM booking
    GROUP BY user_id
) AS book_count
ON book_count.user_id = u.user_id;