Use  laboratorio;
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
