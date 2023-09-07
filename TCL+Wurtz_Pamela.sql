USE laboratorio;
-- Iniciar la transacción
START TRANSACTION;

-- Eliminar algunos registros de la tabla Pruebas
DELETE FROM orden ORDER BY ID_orden LIMIT 3; -- Condiciones para eliminar

-- Rollback para deshacer los cambios si es necesario
-- ROLLBACK;

-- Commit para confirmar los cambios
-- COMMIT;

USE laboratorio;
-- Iniciar la transacción
START TRANSACTION;

-- Insertar registros en la tabla
INSERT INTO Paciente (ID_Paciente, Nombre, Apellido, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico)
VALUES -- Registros #1 a #8
('6', 'Laura','Pérez', '1992-07-30','F','Avenida Sur,Pueblo','555-444-4444','laura.perez@example.com'),
('7','Ricardo','Morales','2000-02-18','M','Plaza Central, Ciudad','555-999-9999','ricardo.morales@example.com'),
('8','Ignacio','Murk','1975-09-22','M','Plaza Mayor, Villa','555-456-3333','ignacio.murk@example.com'),
('9','Patricia','Rodríguez','1993-03-10','F','Calle Natal, Ciudad','555-123-7777','patricia.rodriguez@example.com'),
('10','Carlos','Ramirez','1999-07-02','M','Avenida Norte, Villa','555-656-8899','carlos.ramirez@example.com'),
('11','Isabel','García','1990-08-20','F','Calle 456, Ciudad','555-555-5555','isabel.garcia@example.com'),
('12','Antonio','Martínez','1978-04-12','M','Avenida Central, Pueblo','555-777-7777','antonio.martinez@example.com'),
('13','Sofia','Fernández','1985-11-02','F','Calle 789, Villa','555-888-8888','sofia.fernandez@example.com');

-- Agregar un savepoint después del registro #4
SAVEPOINT savepoint4;

-- Insertar registros adicionales si es necesario

-- Agregar un savepoint después del registro #8
SAVEPOINT savepoint8;

-- Comentado: Eliminar el savepoint para los primeros 4 registros insertados
-- ROLLBACK TO savepoint4;

-- Commit para confirmar los cambios
-- COMMIT;
