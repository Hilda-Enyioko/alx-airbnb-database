USE airbnb;

SELECT p.property_id, p.property_name, p.city
FROM property AS p
WHERE p.property_id IN (
    SELECT property_id 
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
    );

SELECT  u.user_id, u.first_name, u.last_name
FROM user AS u
WHERE u.user_id IN (
    SELECT user_id FROM booking 
    GROUP BY user_id
    HAVING COUNT(booking_id) > 3
    );