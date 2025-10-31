-- Indexes identified from the high_usage_columns.md file to improve query performance.
USE airbnb;

-- Indexes for the 'user' table
CREATE INDEX idx_user_email ON user (email);
CREATE INDEX idx_user_role ON user (role);


-- Indexes for the 'property' table
CREATE INDEX idx_property_hostid ON property (host_id);
CREATE INDEX idx_property_location ON property (location);
CREATE INDEX idx_property_pricepernight ON property (pricepernight);

-- Indexes for the 'booking' table
CREATE INDEX idx_booking_propertyid ON booking (property_id);
CREATE INDEX idx_booking_userid ON booking (user_id);
CREATE INDEX idx_booking_startdate ON booking (start_date);
CREATE INDEX idx_booking_status ON booking (status);

-- Use case explaining index query performance
EXPLAIN ANALYZE
SELECT * FROM user
WHERE email = "johndoe@example.com";