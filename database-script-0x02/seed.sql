USE airbnb;

INSERT INTO TABLE user (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
(1, 'Hilda', 'Enyioko', 'hildaenyioko@example.com', 'hashed_password_1', '+1234567890', 'guest'),
(2, 'John', 'Doe', 'johndoe@example.com', 'hashed_password_2', '+0987654321', 'host'),
(3, 'Jane', 'Kingson', 'janesmith@example.com', 'hashed_password_3', '+1122334455', 'admin'),
(4, 'Alice', 'Morris', 'alicejohnson@example.com', 'hashed_password_4', '+2349156820', 'guest');

INSERT INTO TABLE property (property_id, host_id, name, description, location, pricepernight) VALUES
(1, 2, 'Cozy Apartment', 'A cozy apartment in the city center.', '123 Main St, Cityville', 100.00),
(2, 2, 'Beach House', 'A beautiful beach house with ocean views.', '456 Ocean Ave, Beach City', 250.00);

INSERT INTO TABLE booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(1, 1, 1, '2023-10-01', '2023-10-05', 400.00, 'confirmed'),
(2, 2, 4, '2023-11-01', '2023-11-07', 1750.00, 'pending');

INSERT INSERT INTO TABLE payment (payment_id, booking_id, amount, payment_method) VALUES
(1, 1, 400.00, 'credit_card'),
(2, 2, 1750.00, 'paypal');

INSERT INTO TABLE review (review_id, property_id, user_id, rating, comment) VALUES
(1, 1, 1, 5, 'Excellent stay! Very clean and comfortable apartment.'),
(2, 2, 4, 4, 'Did not like the early morning gush of dust!');
