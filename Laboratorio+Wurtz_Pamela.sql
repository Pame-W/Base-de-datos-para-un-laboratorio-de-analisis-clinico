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
