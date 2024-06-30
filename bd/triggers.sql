use academic_hub;
-- Triggers

-- despues de insertar un usuario se ejecutará este trigger para agregar valores a la tabla rol_usuario.
DROP TRIGGER IF EXISTS after_insert_usuario;
DELIMITER //
CREATE TRIGGER after_insert_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    DECLARE Id_rol INT;
    SET Id_rol = 1;  -- ID del rol predeterminado

    INSERT INTO rol_usuario (Id_rol, Id_usuario)
    VALUES (Id_rol, NEW.Id_usuario);  -- Usa NEW.Id_usuario para el ID del usuario recién insertado
END; //
DELIMITER ;

-- evento_estado

DROP TRIGGER IF EXISTS after_insert_evento;
DELIMITER //
CREATE TRIGGER after_insert_evento
AFTER INSERT ON evento
FOR EACH ROW
BEGIN
    DECLARE Id_estado INT;
    SET Id_estado = 1;  -- ID del estado predeterminado

    INSERT INTO Estado_evento (Id_evento, Id_estado)
    VALUES (NEW.Id_evento, Id_estado);
END; //
DELIMITER ;


-- Crear el disparador después de insertar en la tabla Evento
DROP TRIGGER IF EXISTS after_insert_evento;
DELIMITER //
CREATE TRIGGER after_insert_evento
AFTER INSERT ON Evento
FOR EACH ROW
BEGIN
    -- Insertar automáticamente en la tabla eventos_publicados
    INSERT INTO eventos_publicados (Id_evento, Fecha_publicacion)
    VALUES (NEW.Id_evento, CURDATE()); -- Puedes usar CURDATE() para obtener la fecha actual automáticamente
END //
DELIMITER ;







