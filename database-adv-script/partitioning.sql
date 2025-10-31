USE airbnb;

DROP TABLE booking;

CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p0 VALUES LESS THAN (2023),
    PARTITION p1 VALUES LESS THAN (2024),
    PARTITION p2 VALUES LESS THAN (2025),
    PARTITION p3 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);