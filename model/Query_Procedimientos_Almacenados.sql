-- Registrar un nuevo usuario:
CREATE PROCEDURE sp_registrar_usuario(
    IN p_nombre VARCHAR(20),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_telefono VARCHAR(9),
    IN p_contraseña VARCHAR(50)
)
BEGIN
    INSERT INTO Usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Contraseña)
    VALUES (p_nombre, p_apellido, p_email, p_telefono, p_contraseña);
END

-- Crear un nuevo evento:

CREATE PROCEDURE sp_crear_evento(
    IN p_nombre VARCHAR(255),
    IN p_fecha DATE,
    IN p_ubicacion VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_flayer VARCHAR(50),
    IN p_portada VARCHAR(50),
    IN p_video VARCHAR(50),
    IN p_modalidad VARCHAR(50)
)
BEGIN
    INSERT INTO Evento (Nombre_evento, Fecha_evento, Ubicacion_evento, Descripcion_evento, Flayer_evento, Portada_Evento, Video_evento, Modalidad_evento)
    VALUES (p_nombre, p_fecha, p_ubicacion, p_descripcion, p_flayer, p_portada, p_video, p_modalidad);
END

-- Asignar un rol a un usuario:

CREATE PROCEDURE sp_asignar_rol_usuario(
    IN p_id_usuario INT,
    IN p_id_rol INT
)
BEGIN
    INSERT INTO Rol_usuario (Id_rol, Id_usuario)
    VALUES (p_id_rol, p_id_usuario)
    ON DUPLICATE KEY UPDATE Id_rol = p_id_rol;
END

-- Registrar la asistencia de un usuario a un evento:
CREATE PROCEDURE sp_registrar_asistencia(
    IN p_id_evento INT,
    IN p_id_usuario INT
)
BEGIN
    INSERT INTO Asistentes_evento (Id_evento, Id_usuario, Fecha_asistencia)
    VALUES (p_id_evento, p_id_usuario, CURDATE());
END

-- Obtener todos los eventos de una categoría específica:
CREATE PROCEDURE sp_obtener_eventos_por_categoria(
    IN p_id_categoria INT
)
BEGIN
    SELECT e.*
    FROM Evento e
    JOIN Categoria_Evento ce ON e.Id_evento = ce.Id_evento
    WHERE ce.Id_categoria = p_id_categoria;
END

-- Cambiar el estado de un evento:
CREATE PROCEDURE sp_cambiar_estado_evento(
    IN p_id_evento INT,
    IN p_id_nuevo_estado INT
)
BEGIN
    UPDATE Estado_evento
    SET Id_estado = p_id_nuevo_estado
    WHERE Id_evento = p_id_evento;
    
    IF ROW_COUNT() = 0 THEN
        INSERT INTO Estado_evento (Id_evento, Id_estado)
        VALUES (p_id_evento, p_id_nuevo_estado);
    END IF;
END

CALL sp_registrar_usuario('Juan', 'Pérez', 'juan@email.com', '123456789', 'contraseña123');
CALL sp_crear_evento('Conferencia de IA', '2024-07-15', 'Auditorio Principal', 'Descripción del evento...', 'flayer.jpg', 'portada.jpg', 'video.mp4', 'Presencial');
CALL sp_asignar_rol_usuario(1, 2);
CALL sp_registrar_asistencia(1, 1);
CALL sp_obtener_eventos_por_categoria(3);
CALL sp_cambiar_estado_evento(1, 2);


