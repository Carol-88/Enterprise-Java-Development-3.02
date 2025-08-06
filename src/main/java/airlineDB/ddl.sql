-- DDL para la tabla Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    total_customer_mileage INT
);

-- DDL para la tabla Aircrafts
CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_name VARCHAR(255) UNIQUE NOT NULL,
    total_seats INT
);

-- DDL para la tabla Flights
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(50) UNIQUE NOT NULL,
    flight_mileage INT,
    aircraft_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
);

-- DDL para la tabla Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);