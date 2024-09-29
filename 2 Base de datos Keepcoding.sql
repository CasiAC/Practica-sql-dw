
CREATE TABLE alumno (
    alumno_id SERIAL PRIMARY KEY,
    dni VARCHAR(15),
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    start_date DATE,
    end_date DATE
);

CREATE TABLE profesor (
    profesor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE modulo (
    modulo_id SERIAL PRIMARY KEY,
    profesor_id INT,
    start_date DATE,
    end_date DATE,
    practica VARCHAR(255),
    FOREIGN KEY (profesor_id) REFERENCES profesor(profesor_id)
);

CREATE TABLE bootcamp (
    bootcamp_id SERIAL PRIMARY KEY,
    modulo_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (modulo_id) REFERENCES modulo(modulo_id)
);

CREATE TABLE matricula (
    matricula_id SERIAL PRIMARY KEY,
    alumno_id INT,
    bootcamp_id INT,
    FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
    UNIQUE (alumno_id, bootcamp_id)
);

-- Insertar datos en la tabla alumno
INSERT INTO alumno (dni, name, surname, email, start_date, end_date) VALUES
('12345678A', 'Juan', 'Pérez', 'juan.perez@email.com', '2022-01-15', '2023-01-15'),
('23456789B', 'María', 'López', 'maria.lopez@email.com', '2021-02-01', '2022-02-01'),
('34567890C', 'Carlos', 'García', 'carlos.garcia@email.com', '2020-03-10', '2021-03-10'),
('45678901D', 'Lucía', 'Martínez', 'lucia.martinez@email.com', '2022-04-05', '2023-04-05'),
('56789012E', 'Ana', 'Hernández', 'ana.hernandez@email.com', '2021-05-01', '2022-05-01'),
('67890123F', 'David', 'Rodríguez', 'david.rodriguez@email.com', '2020-06-15', '2021-06-15'),
('78901234G', 'Laura', 'Fernández', 'laura.fernandez@email.com', '2021-07-20', '2022-07-20'),
('89012345H', 'Miguel', 'González', 'miguel.gonzalez@email.com', '2019-08-25', '2020-08-25'),
('90123456I', 'Sofía', 'Ruiz', 'sofia.ruiz@email.com', '2022-09-01', '2023-09-01'),
('01234567J', 'Pablo', 'Jiménez', 'pablo.jimenez@email.com', '2020-10-10', '2021-10-10');

-- Insertar datos en la tabla profesor
INSERT INTO profesor (name, surname, email) VALUES
('Laura', 'Sánchez', 'laura.sanchez@email.com'),
('David', 'Gómez', 'david.gomez@email.com'),
('Elena', 'Torres', 'elena.torres@email.com'),
('Carlos', 'Vega', 'carlos.vega@email.com'),
('Inés', 'Ramírez', 'ines.ramirez@email.com'),
('Javier', 'Ortiz', 'javier.ortiz@email.com'),
('Silvia', 'Luna', 'silvia.luna@email.com'),
('José', 'Castro', 'jose.castro@email.com'),
('Patricia', 'Molina', 'patricia.molina@email.com'),
('Ricardo', 'Díaz', 'ricardo.diaz@email.com');

-- Insertar datos en la tabla modulo
INSERT INTO modulo (profesor_id, start_date, end_date, practica) VALUES
(1, '2021-01-10', '2021-07-10', 'Práctica de Desarrollo Web'),
(2, '2021-02-15', '2021-08-15', 'Práctica de Data Science'),
(3, '2021-03-01', '2021-09-01', 'Práctica de Machine Learning'),
(4, '2021-04-20', '2021-10-20', 'Práctica de Ciberseguridad'),
(5, '2021-05-05', '2021-11-05', 'Práctica de Cloud Computing'),
(6, '2021-06-01', '2021-12-01', 'Práctica de DevOps'),
(7, '2021-07-10', '2022-01-10', 'Práctica de Diseño UX/UI'),
(8, '2021-08-20', '2022-02-20', 'Práctica de Inteligencia Artificial'),
(9, '2021-09-15', '2022-03-15', 'Práctica de Programación Python'),
(10, '2021-10-05', '2022-04-05', 'Práctica de Arquitectura de Software');

-- Insertar datos en la tabla bootcamp
INSERT INTO bootcamp (modulo_id, start_date, end_date) VALUES
(1, '2021-01-15', '2021-07-15'),
(2, '2021-02-01', '2021-08-01'),
(3, '2021-03-10', '2021-09-10'),
(4, '2021-04-05', '2021-10-05'),
(5, '2021-05-01', '2021-11-01'),
(6, '2021-06-10', '2021-12-10'),
(7, '2021-07-15', '2022-01-15'),
(8, '2021-08-01', '2022-02-01'),
(9, '2021-09-10', '2022-03-10'),
(10, '2021-10-05', '2022-04-05');

-- Insertar datos en la tabla matricula
INSERT INTO matricula (alumno_id, bootcamp_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
