CREATE TYPE user_type AS ENUM ('admin', 'regular', 'guest');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(31) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    type user_type DEFAULT 'regular', -- Assuming this is a valid enum type
    -- phone_prefix VARCHAR(3), -- Check for valid phone prefix format
    -- phone VARCHAR(15) NOT NULL UNIQUE,
    -- password VARCHAR(50) NOT NULL
);

--TODO: check phone_prefix and phone

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    long NUMERIC(9, 6) NOT NULL,
    lat NUMERIC (8, 6) NOT NULL,
    street VARCHAR(255) NOT NULL,
    house_no VARCHAR(8) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    city VARCHAR(127) NOT NULL,
    region VARCHAR(127) NOT NULL,
    district VARCHAR(127),
    country VARCHAR(100) NOT NULL
);


CREATE TABLE parking_spots (
    spot_id SERIAL PRIMARY KEY,
    description VARCHAR(511),
    size INT CHECK (size > 0), -- Ensuring size is a positive integer
    parking_no VARCHAR(8) NOT NULL,
    -- availability BOOLEAN NOT NULL, -- WHAT FOR?
    internal BOOLEAN NOT NULL,
    wide_spot BOOLEAN NOT NULL,
    easy_access BOOLEAN NOT NULL,
    level INT NOT NULL,
    security BOOLEAN NOT NULL,
    charging BOOLEAN NOT NULL,
    owner_id INT REFERENCES users (user_id) ON DELETE CASCADE, -- Referencing user_id and cascading deletes
    address_id INT REFERENCES address (address_id) ON DELETE SET NULL -- Referencing address_id and setting to NULL on delete
);

CREATE TYPE rental_status AS ENUM ('active', 'inactive');

CREATE TABLE rental_offers (
    offer_id SERIAL PRIMARY KEY,
    auto_accept BOOLEAN NOT NULL,
    price NUMERIC(4, 2) CHECK (price > 0), -- Ensuring price is a positive integer
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Defaulting to the current timestamp when record is inserted
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > start_date), -- Ensuring end_date is after start_date
    status rental_status DEFAULT 'active' NOT NULL,
    spot_id INT REFERENCES parking_spots(spot_id) ON DELETE CASCADE -- Referencing spot_id and cascading deletes
);

CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'cancelled');


CREATE TABLE bookings (
    booking_id BIGSERIAL PRIMARY KEY,
    booking_start TIMESTAMP NOT NULL,
    booking_end TIMESTAMP NOT NULL,
    status booking_status NOT NULL,
    price_total NUMERIC(8, 2) CHECK (price_total >= 0), -- Ensuring price_total is non-negative
    user_id INT NOT NULL REFERENCES users (user_id),
    offer_id INT NOT NULL REFERENCES rental_offers(offer_id)
);

