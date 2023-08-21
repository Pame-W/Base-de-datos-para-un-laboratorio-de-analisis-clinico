
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
