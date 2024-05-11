-- Inserting data into the "users" table
INSERT INTO users (username, email, user_type, phone_prefix, phone, password) VALUES
    ('bgrabek', 'Bartek', 'Grabek', 'admin@example.com', 'regular', '123', '123456789', 'admin_password'),
    ('mtaczala', 'Michal', 'Taczala', 'regular@example.com', 'regular', '456', '987654321', 'regular_password'),
    ('pwysocka', 'Patrycja', 'Wysocka', 'guest@example.com', 'regular', '789', '567891234', 'guest_password');

-- Inserting data into the "address" table
INSERT INTO address (long, lat, street, house_no, postal_code, city, region, district, country) VALUES
    (40.7128, -74.0060, 'Broadway', '1', '10007', 'New York', 'NY', NULL, 'USA'),
    (51.5074, -0.1278, 'Buckingham Palace Road', '1', 'SW1A 1AA', 'London', NULL, 'Westminster', 'UK'),
    (48.8566, 2.3522, 'Champs-Élysées', '1', '75008', 'Paris', NULL, NULL, 'France');

-- Inserting data into the "parking_spots" table
INSERT INTO parking_spots (description, size, parking_no, availability, internal, wide_spot, easy_access, level, security, charging, owner_id, address_id) VALUES
    ('Spacious spot near Times Square', 1, 'A1', TRUE, FALSE, TRUE, TRUE, 1, TRUE, FALSE, 1, 1),
    ('Cozy spot in central London', 1, 'B1', TRUE, TRUE, FALSE, TRUE, 2, TRUE, TRUE, 2, 2),
    ('Convenient spot in the heart of Paris', 1, 'C1', TRUE, FALSE, FALSE, FALSE, 0, FALSE, TRUE, 3, 3);

-- Inserting data into the "rental_offers" table
INSERT INTO rental_offers (auto_accept, price, start_date, end_date, status, spot_id) VALUES
    (TRUE, 10.00, '2024-05-01', '2024-05-07', 'active', 1),
    (FALSE, 15.00, '2024-06-01', '2024-06-07', 'active', 2),
    (TRUE, 20.00, '2024-07-01', '2024-07-07', 'inactive', 3);

-- Inserting data into the "bookings" table
INSERT INTO bookings (booking_start, booking_end, status, price_total, user_id, offer_id) VALUES
    ('2024-05-01 12:00:00', '2024-05-07 12:00:00', 'confirmed', 70.00, 1, 1),
    ('2024-06-01 12:00:00', '2024-06-07 12:00:00', 'pending', 0.00, 2, 2),
    ('2024-07-01 12:00:00', '2024-07-07 12:00:00', 'cancelled', 0.00, 3, 3);
