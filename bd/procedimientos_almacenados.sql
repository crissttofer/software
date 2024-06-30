-- procedimientos almacenados
USE `academic_hub`;
  
-- para designar categoria a un evento
DROP procedure IF EXISTS `InsertarEventoConCategoria`;
DELIMITER $$
USE `academic_hub`$$
CREATE PROCEDURE InsertarEventoConCategoria(
    IN p_Nombre_evento VARCHAR(255),
    IN p_Fecha_evento DATE,
    IN p_Ubicacion_evento VARCHAR(255),
    IN p_Descripcion_evento TEXT,
    IN p_Flayer_evento VARCHAR(50),
    IN p_Portada_Evento VARCHAR(50),
    IN p_Modalidad_evento VARCHAR(50),
    IN p_Id_categoria INT
)
BEGIN
    -- Insertar en la tabla Evento
    INSERT INTO Evento (Nombre_evento, Fecha_evento, Ubicacion_evento, Descripcion_evento, Flayer_evento, Portada_Evento, Modalidad_evento)
    VALUES (p_Nombre_evento, p_Fecha_evento, p_Ubicacion_evento, p_Descripcion_evento, p_Flayer_evento, p_Portada_Evento, p_Modalidad_evento);

    -- Obtener el Id_evento generado
    SET @last_id_evento = LAST_INSERT_ID();

    -- Insertar en la tabla intermedia Categoria_evento
    INSERT INTO Categoria_evento (Id_evento, Id_categoria)
    VALUES (@last_id_evento, p_Id_categoria);
END$$

DELIMITER ;



-- actulizar rol de usuario.
DROP procedure IF EXISTS `ActualizarRolUsuario`;

DELIMITER $$
USE `academic_hub`$$
CREATE PROCEDURE ActualizarRolUsuario(
    IN p_id_usuario INT,
    IN p_id_rol INT
)
BEGIN
    UPDATE Rol_usuario
    SET Id_rol = p_id_rol
    WHERE Id_usuario = p_id_usuario;
END$$

DELIMITER ;