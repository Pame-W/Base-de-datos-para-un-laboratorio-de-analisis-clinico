
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
