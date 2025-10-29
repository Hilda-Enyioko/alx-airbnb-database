USE airbnb;

-- A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT u.user_id, u.first_name, u.last_name, user_book_count.total_bookings
FROM user AS u
INNER JOIN (
    SELECT user_id, COUNT(booking_id) as total_bookings
    FROM booking
    GROUP BY user_id
) AS user_book_count
ON user_book_count.user_id = u.user_id;

-- A window function to rank properties based on the total number of bookings.
SELECT p.property_id, p.name, p.host_id, p.location, property_book_count.total_bookings,
RANK() OVER (
    ORDER BY property_book_count.total_bookings DESC, p.property_id ASC
) AS booking_rank
FROM property as p
INNER JOIN (
    SELECT property_id, COUNT(booking_id) as total_bookings
    FROM booking
    GROUP BY property_id
) AS property_book_count
ON property_book_count.property_id = p.property_id
ORDER BY booking_rank;