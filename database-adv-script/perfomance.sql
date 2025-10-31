USE airbnb;

-- Ordinary Query
EXPLAIN
SELECT * FROM booking;

-- Refactored query
USE airbnb;

EXPLAIN
SELECT
    b.booking_id,
    p.name AS property_name,
    CONCAT(u.first_name, ' ', u.last_name) AS guest_name,
    pay.amount,
    b.start_date
FROM
    booking b
JOIN
    property p ON b.property_id = p.property_id
JOIN
    user u ON b.user_id = u.user_id
JOIN
    payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed' AND b.start_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
ORDER BY
    b.start_date DESC
LIMIT 100;