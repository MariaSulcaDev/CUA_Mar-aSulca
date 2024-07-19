DROP DATABASE IF EXISTS hotel_Villa_del_Sur;

CREATE DATABASE IF NOT EXISTS hotel_Villa_del_Sur;
USE hotel_Villa_del_Sur;

CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,----
    client_first_name VARCHAR(70) NOT NULL,
    client_last_name VARCHAR(70) NOT NULL,
    client_email VARCHAR(40) NOT NULL,
    document_type VARCHAR(3) NOT NULL CHECK (document_type IN ('DNI', 'CNE')),
    document_number VARCHAR(15) NOT NULL CHECK (CHAR_LENGTH(document_number) BETWEEN 8 AND 15),
    client_phone VARCHAR(9),
    arrival_date DATE NOT NULL,
    departure_date DATE NOT NULL,
    number_of_people INT NOT NULL CHECK (number_of_people > 0),
    room_type VARCHAR(10)  CHECK (room_type IN ('Simple', 'Doble', 'Familiar')),
    payment_method VARCHAR(40)  CHECK (payment_method IN ('Efectivo', 'Tarjeta de Crédito', 'Transferencia Bancaria')),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    reservation_status VARCHAR(10) DEFAULT 'Pendiente' CHECK (reservation_status IN ('Confirmada', 'Pendiente', 'Cancelada'))
);


INSERT INTO reservations (
    client_first_name, client_last_name, client_email, document_type, document_number, client_phone, arrival_date, departure_date, number_of_people, room_type, payment_method, notes, reservation_status
) VALUES 
('Juan', 'Perez', 'juan.perez@example.com', 'DNI', '12345678', '940482714', '2024-08-01', '2024-08-05', 2, 'Simple', 'Tarjeta de Crédito', 'Reserva para Fiestas Patrias', 'Confirmada'),
('Andrea', 'Lopez', 'andrea.lopez@example.com', 'DNI', '87654321', '940123456', '2024-07-20', '2024-07-25', 3, 'Familiar', 'Efectivo', 'Vacaciones familiares', 'Pendiente'),
('Carlos', 'Gomez', 'carlos.gomez@example.com', 'CNE', 'A1234567', '940654321', '2024-07-15', '2024-07-18', 1, 'Doble', 'Transferencia Bancaria', 'Viaje de negocios', 'Confirmada'),
('Andrés', 'Martinez', 'andres.martinez@example.com', 'DNI', '23456789', '940987654', '2024-08-10', '2024-08-15', 2, 'Doble', 'Tarjeta de Crédito', 'Luna de miel', 'Confirmada'),
('Piero', 'Díaz', 'piero.diaz@example.com', 'CNE', 'B9876543', '940112233', '2024-08-05', '2024-08-10', 4, 'Familiar', 'Efectivo', 'Reunión familiar', 'Pendiente');

SELECT * FROM reservations;

UPDATE reservations
SET client_phone = '999000111',
    reservation_status = 'Confirmada'
WHERE id = 1;


DELETE FROM reservations
WHERE id = 5;