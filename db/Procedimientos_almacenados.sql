

-- Agregar Rol

CREATE PROCEDURE AgregarRol (
    IN p_Nombre_rol VARCHAR(50)
)
BEGIN
    INSERT INTO Rol (Nombre_rol) VALUES (p_Nombre_rol);
END


-- Agregar Usuario

CREATE PROCEDURE AgregarUsuario (
    IN p_Nombre_usuario VARCHAR(20),
    IN p_Apellido_usuario VARCHAR(50),
    IN p_Email VARCHAR(50),
    IN p_Telefono VARCHAR(9),
    IN p_Password VARCHAR(50)
)
BEGIN
    INSERT INTO Usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Password) 
    VALUES (p_Nombre_usuario, p_Apellido_usuario, p_Email, p_Telefono, p_Password);
END



-- Agregar Estado

CREATE PROCEDURE AgregarEstado (
    IN p_Nombre_estado VARCHAR(50)
)
BEGIN
    INSERT INTO Estado (nombre_estado) VALUES (p_Nombre_estado);
END





-- Agregar Categoría

CREATE PROCEDURE AgregarCategoria (
    IN p_Nombre_categoria VARCHAR(50)
)
BEGIN
    INSERT INTO Categoria (Nombre_categoria) VALUES (p_Nombre_categoria);
END



-- Registrar Usuario en Evento

CREATE PROCEDURE RegistrarUsuarioEnEvento (
    IN p_Id_evento INT,
    IN p_Id_usuario INT,
    IN p_Fecha_asistencia DATE
)
BEGIN
    INSERT INTO Asistentes_evento (Id_evento, Id_usuario, Fecha_asistencia) VALUES (p_Id_evento, p_Id_usuario, p_Fecha_asistencia);
END
