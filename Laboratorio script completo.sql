CREATE SCHEMA laboratorio1;
use laboratorio1;

CREATE TABLE Paciente (
    ID_Paciente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FechaNacimiento DATE,
    Genero VARCHAR(10),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100)
);

CREATE TABLE Medico (
    ID_Medico INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Especialidad VARCHAR(100),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100)
);

CREATE TABLE Prueba (
    ID_Prueba INT PRIMARY KEY,
    NombrePrueba VARCHAR(100),
    Descripcion VARCHAR(200),
    Costo DECIMAL(10, 2),
    TiempoEntrega VARCHAR(50)
);

CREATE TABLE Resultado (
    ID_Resultado INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Prueba INT,
    FechaRealizacion DATE,
    Resultado VARCHAR(200),
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Prueba) REFERENCES Prueba(ID_Prueba)
);

CREATE TABLE Orden (
    ID_Orden INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Medico INT,
    ID_Prueba INT,
    FechaOrden DATE,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico),
    FOREIGN KEY (ID_Prueba) REFERENCES Prueba(ID_Prueba)
);
INSERT INTO Paciente (ID_Paciente, Nombre, Apellido, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico)
VALUES
    (1, 'Juan', 'Pérez', '1980-05-15', 'M', 'Calle 123, Ciudad', '555-123-4567', 'juan.perez@example.com'),
    (2, 'María', 'Gómez', '1995-11-30', 'F', 'Av. Principal, Pueblo', '555-987-6543', 'maria.gomez@example.com'),
    (3, 'Pedro', 'López', '1975-09-22', 'M', 'Plaza Mayor, Villa', '555-222-3333', 'pedro.lopez@example.com'),
    (4, 'Laura', 'Rodríguez', '1988-03-10', 'F', 'Calle Secundaria, Ciudad', '555-444-7777', 'laura.rodriguez@example.com'),
    (5, 'Carlos', 'Martínez', '1999-07-02', 'M', 'Avenida Norte, Pueblo', '555-666-9999', 'carlos.martinez@example.com');

INSERT INTO Medico (ID_Medico, Nombre, Apellido, Especialidad, Telefono, CorreoElectronico)
VALUES
    (1, 'Ana', 'Sánchez', 'Medicina General', '555-111-2222', 'ana.sanchez@example.com'),
    (2, 'Luis', 'Ramírez', 'Cardiología', '555-333-4444', 'luis.ramirez@example.com'),
    (3, 'Elena', 'Torres', 'Gastroenterología', '555-555-6666', 'elena.torres@example.com'),
    (4, 'Javier', 'García', 'Radiología', '555-777-8888', 'javier.garcia@example.com'),
    (5, 'Marta', 'Vargas', 'Dermatología', '555-999-0000', 'marta.vargas@example.com');

INSERT INTO Prueba (ID_Prueba, NombrePrueba, Descripcion, Costo, TiempoEntrega)
VALUES
    (1, 'Hemograma Completo', 'Análisis de sangre completo', 50.00, '1 día'),
    (2, 'Perfil Lipídico', 'Medición de lípidos en sangre', 75.00, '2 días'),
    (3, 'Glucosa en Sangre', 'Prueba de nivel de glucosa', 30.00, '6 horas'),
    (4, 'Radiografía de Torax', 'Imagen de radiografía de tórax', 100.00, '3 días'),
    (5, 'Ecografía Abdominal', 'Ecografía de abdomen', 120.00, '2 días');

INSERT INTO Resultado (ID_Resultado, ID_Paciente, ID_Prueba, FechaRealizacion, Resultado)
VALUES
    (1, 1, 1, '2023-07-05', 'Dentro de los rangos normales'),
    (2, 2, 3, '2023-07-04', 'Alto nivel de glucosa'),
    (3, 3, 2, '2023-07-06', 'Colesterol elevado'),
    (4, 4, 4, '2023-07-07', 'Sin hallazgos relevantes'),
    (5, 5, 5, '2023-07-08', 'Presencia de cálculos biliares');

INSERT INTO Orden (ID_Orden, ID_Paciente, ID_Medico, ID_Prueba, FechaOrden)
VALUES
    (1, 1, 2, 1, '2023-07-01'),
    (2, 2, 4, 3, '2023-07-02'),
    (3, 3, 1, 2, '2023-07-03'),
    (4, 4, 5, 4, '2023-07-04'),
    (5, 5, 3, 5, '2023-07-05');
    
-- Vista 1: PacienteDetalles
CREATE VIEW PacienteDetalles AS
SELECT 
    p.ID_Paciente,
    p.Nombre,
    p.Apellido,
    p.FechaNacimiento,
    p.Genero,
    r.ID_Resultado,
    r.ID_Prueba,
    r.FechaRealizacion,
    r.Resultado
FROM Paciente p
LEFT JOIN Resultado r ON p.ID_Paciente = r.ID_Paciente;

-- Vista 2: Médico Pruebas
CREATE VIEW PruebasCostoPromedio AS
SELECT 
    p.ID_Prueba,
    p.NombrePrueba,
    AVG(p.Costo) AS CostoPromedio
FROM Prueba p
GROUP BY p.ID_Prueba, p.NombrePrueba;

-- Vista 3: Pruebas Costo Promedio
CREATE VIEW MedicoPruebas AS
SELECT 
    m.ID_Medico,
    m.Nombre,
    m.Apellido,
    m.Especialidad,
    COUNT(o.ID_Orden) AS CantidadPruebas
FROM Medico m
LEFT JOIN Orden o ON m.ID_Medico = o.ID_Medico
GROUP BY m.ID_Medico, m.Nombre, m.Apellido, m.Especialidad;

-- Vista 4: PacienteMasPruebas
CREATE VIEW PacienteMasPruebas AS
SELECT 
    p.ID_Paciente,
    p.Nombre,
    p.Apellido,
    COUNT(r.ID_Resultado) AS CantidadPruebas
FROM Paciente p
LEFT JOIN Resultado r ON p.ID_Paciente = r.ID_Paciente
GROUP BY p.ID_Paciente, p.Nombre, p.Apellido
ORDER BY CantidadPruebas DESC
LIMIT 1;

-- Vista 5: Resultados Anormales
CREATE VIEW ResultadosAnormales AS
SELECT 
    r.ID_Resultado,
    r.ID_Paciente,
    p.Nombre AS NombrePaciente,
    p.Apellido AS ApellidoPaciente,
    r.ID_Prueba,
    pr.NombrePrueba,
    r.FechaRealizacion,
    r.Resultado
FROM Resultado r
JOIN Prueba pr ON r.ID_Prueba = pr.ID_Prueba
JOIN Paciente p ON r.ID_Paciente = p.ID_Paciente
WHERE r.Resultado NOT LIKE 'Dentro de los rangos normales';

-- Función para obtener el costo total de pruebas realizadas por un paciente
SELECT * FROM PRUEBA;
DELIMITER //
CREATE FUNCTION CalcularCostoTotalPruebas(ID_Paciente INT) RETURNS DECIMAL(10, 2)
deterministic
BEGIN
    DECLARE costo_total DECIMAL(10, 2);

    SELECT SUM(p.Costo) INTO costo_total
    FROM Prueba p
    INNER JOIN Resultado r ON p.ID_Prueba = r.ID_Prueba
    WHERE r.ID_Paciente = ID_Paciente;

    RETURN costo_total;
END;
//
-- Función para calcular la edad de un paciente dado su ID
SELECT * FROM PACIENTE;
DELIMITER //
CREATE FUNCTION CalcularEdad(ID_Paciente INT) RETURNS INT
deterministic
BEGIN
    DECLARE fecha_nacimiento DATE;
    DECLARE edad INT;

    SELECT FechaNacimiento INTO fecha_nacimiento FROM Paciente WHERE ID_Paciente = ID_Paciente;
    
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
    
    RETURN edad;
END;
//
DELIMITER ;

-- TABLA DE LOG PARA PACIENTE
CREATE TABLE LogPaciente (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    TablaAfectada VARCHAR(50),
    Accion VARCHAR(20),
    ID_Paciente INT,
    Usuario VARCHAR(50),
    FechaRegistro DATE,
    HoraRegistro TIME
);
-- BEFORE para Paciente - Registro de Acción
-- Este Trigger se ejecuta antes de una operación de INSERT, UPDATE o DELETE en la tabla Paciente. 
-- Registra la acción realizada, el ID del paciente afectado, el usuario que realiza la operación, la fecha y la hora.
DELIMITER //
CREATE TRIGGER LogPacienteBeforeTrigger
BEFORE INSERT ON Paciente
FOR EACH ROW
BEGIN
    INSERT INTO LogPaciente (TablaAfectada, Accion, ID_Paciente, Usuario, FechaRegistro, HoraRegistro)
    VALUES ('Paciente', 'INSERT', NEW.ID_Paciente, USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;
-- AFTER para Paciente - Registro de Acción
-- Este Trigger se ejecuta después de una operación de INSERT, UPDATE o DELETE en la tabla Paciente. 
-- Registra la acción realizada, el ID del paciente afectado, el usuario que realizó la operación, la fecha y la hora.
DELIMITER //
CREATE TRIGGER LogPacienteAfterTrigger
AFTER INSERT ON Paciente
FOR EACH ROW
BEGIN
    INSERT INTO LogPaciente (TablaAfectada, Accion, ID_Paciente, Usuario, FechaRegistro, HoraRegistro)
    VALUES ('Paciente', 'INSERT', NEW.ID_Paciente, USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- TABLA DE LOG PARA RESULTADO
CREATE TABLE LogResultado (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    TablaAfectada VARCHAR(50),
    Accion VARCHAR(20),
    ID_Resultado INT,
    Usuario VARCHAR(50),
    FechaRegistro DATE,
    HoraRegistro TIME
);
-- BEFORE para Resultado - Registro de Acción
-- Este Trigger se ejecuta antes de una operación de INSERT, UPDATE o DELETE en la tabla Resultado. 
-- Registra la acción realizada, el ID del resultado afectado, el usuario que realiza la operación, la fecha y la hora.
DELIMITER //
CREATE TRIGGER LogResultadoBeforeTrigger
BEFORE INSERT ON Resultado
FOR EACH ROW
BEGIN
    INSERT INTO LogResultado (TablaAfectada, Accion, ID_Resultado, Usuario, FechaRegistro, HoraRegistro)
    VALUES ('Resultado', 'INSERT', NEW.ID_Resultado, USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;
-- AFTER para Paciente - Registro de Acción
-- Este Trigger se ejecuta después de una operación de INSERT, UPDATE o DELETE en la tabla Resultado. 
-- Registra la acción realizada, el ID del resultado afectado, el usuario que realizó la operación, la fecha y la hora.
DELIMITER //
CREATE TRIGGER LogResultadoAfterTrigger
AFTER INSERT ON Resultado
FOR EACH ROW
BEGIN
    INSERT INTO LogResultado (TablaAfectada, Accion, ID_Resultado, Usuario, FechaRegistro, HoraRegistro)
    VALUES ('Resultado', 'INSERT', NEW.ID_Resultado, USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;
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

CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contrasena_lectura';
-- Asignar permisos de solo lectura a todas las tablas
GRANT SELECT ON laboratorio.* TO 'usuario_lectura'@'localhost';

-- Crear el usuario con permisos de lectura, inserción y modificación
CREATE USER 'usuario_modificacion'@'localhost' IDENTIFIED BY 'contrasena_modificacion';
-- Asignar permisos de lectura, inserción y modificación a todas las tablas
GRANT SELECT, INSERT, UPDATE ON laboratorio.* TO 'usuario_modificacion'@'localhost';

-- Evitar que ambos usuarios puedan eliminar registros de cualquier tabla
REVOKE DELETE ON laboratorio.* FROM 'usuario_lectura'@'localhost';
REVOKE DELETE ON laboratorio.* FROM 'usuario_modificacion'@'localhost';

-- Procedimiento almacenado 1: OrdenarTabla
-- Este procedimiento te permite ordenar una tabla específica por un campo dado, en orden ascendente o descendente.
-- Stored Procedure para ordenar una tabla
DELIMITER //
CREATE PROCEDURE OrdenarTabla(IN tabla VARCHAR(50), IN campo VARCHAR(50), IN orden VARCHAR(10))
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', campo, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;
-- Llama al procedimiento necesario el nombre de la tabla, el campo por el cual desea ordenar y el orden (ASC o DESC).
CALL OrdenarTabla('Paciente', 'Nombre', 'ASC');
CALL OrdenarTabla('Resultado', 'FechaRealizacion', 'DESC');

-- Procedimiento almacenado 2: GestionarRegistros
-- Este procedimiento te permite insertar o eliminar registros en una tabla específica del proyecto.
-- Stored Procedure para gestionar registros en una tabla
DELIMITER //
CREATE PROCEDURE GestionarRegistros(IN accion INT, IN tabla VARCHAR(50), IN id INT)
BEGIN
    IF accion = 1 THEN
        INSERT INTO tabla VALUES (/* valores de los campos */);
    ELSEIF accion = 2 THEN
        DELETE FROM tabla WHERE ID = id;
    END IF;
END;
//
DELIMITER ;
-- Llama al procedimiento requerir la acción (1 para insertar, 2 para eliminar), el nombre de la tabla y el ID del registro (solo en caso de eliminación). 
CALL GestionarRegistros(1, 'Paciente', NULL); -- Insertar registro en tabla Paciente
CALL GestionarRegistros(2, 'Medico', 3); -- Eliminar registro en tabla Medico con ID 3

