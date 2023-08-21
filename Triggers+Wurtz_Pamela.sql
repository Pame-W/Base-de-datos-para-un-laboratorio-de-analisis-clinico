use laboratorio;
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
