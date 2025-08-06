-- 1. Total de vuelos en la base de datos
SELECT COUNT(DISTINCT flight_number) AS TotalFlights
FROM Flights;

-- 2. Distancia promedio de los vuelos
SELECT AVG(flight_mileage) AS AverageFlightDistance
FROM Flights;

-- 3. Promedio de asientos por avión
SELECT AVG(total_seats) AS AverageSeats
FROM Aircrafts;

-- 4. Promedio de millas voladas por clientes, agrupadas por estado
SELECT customer_status, AVG(total_customer_mileage) AS AverageMiles
FROM Customers
GROUP BY customer_status;

-- 5. Máximo de millas voladas por clientes, agrupadas por estado
SELECT customer_status, MAX(total_customer_mileage) AS MaxMiles
FROM Customers
GROUP BY customer_status;

-- 6. Total de aeronaves con el nombre "Boeing"
SELECT COUNT(*) AS TotalBoeingAircrafts
FROM Aircrafts
WHERE aircraft_name LIKE '%Boeing%';

-- 7. Todos los vuelos con una distancia entre 300 y 2000 millas
SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 8. Distancia promedio de vuelos reservados, agrupados por estado del cliente
SELECT c.customer_status, AVG(f.flight_mileage) AS AverageDistanceBooked
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
GROUP BY c.customer_status;

-- 9. Aeronave más reservada por clientes con estatus "Gold"
SELECT a.aircraft_name, COUNT(b.booking_id) AS BookingCount
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
JOIN Aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY BookingCount DESC
LIMIT 1;