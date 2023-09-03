-- Crear el usuario con permisos de solo lectura
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
