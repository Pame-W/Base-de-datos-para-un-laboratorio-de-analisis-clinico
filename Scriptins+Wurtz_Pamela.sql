CREATE SCHEMA laboratorio;
use laboratorio;

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
