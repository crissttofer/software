use academic_hub;

-- registro rol.
INSERT INTO Rol (Nombre_rol) VALUES ('usuario');
INSERT INTO Rol (Nombre_rol) VALUES ('Centro_federado');
INSERT INTO Rol (Nombre_rol) VALUES ('Director_academico');
INSERT INTO Rol (Nombre_rol) VALUES ('Relaciones_publicas');
INSERT INTO Rol (Nombre_rol) VALUES ('Admin');

select *from Rol;


-- registro de usuarios.
INSERT INTO usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Password) 
VALUES ('John', 'Doe', 'john.doe@example.com', '123456789', 'securepassword');
INSERT INTO usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Password) 
VALUES ('Cristopher', 'Tinoco Mamani', '1001020@xvideos.com', '987654321', 'securepassword');

select *from usuarios;

select *from rol_usuario;

-- actualizar rol de usuario.
CALL ActualizarRolUsuario(3, 2); -- 3 está es el Id_usuario y 2 Id_rol

-- registro estados
INSERT INTO estado (nombre_estado) VALUES
    ('Publicado'),
    ('Rechazado'),
    ('Pendiente');
 
select *from estado;

-- registro eventos
CALL InsertarEventoConCategoria('Taller de programacion', '2024-08-01', 'Auditorio central unajma', 'Descripción del evento', 'flayer.jpg', 'portada.jpg', 'Presencial', 4); -- el número 4 es el id de la categoria

select *from estado_evento;
select *from evento;



-- registro categoria
INSERT INTO Categoria (Nombre_categoria)
VALUES ('Conferencia'),
       ('Taller'),
       ('Seminario'),
       ('Curso'),
       ('Webinar');
       
select *from categoria_evento;

CALL InsertarEventoConCategoria('Taller de programacion', '2024-08-01', 'Auditorio central unajma', 'Descripción del evento', 'flayer.jpg', 'portada.jpg', 'Presencial', 4); -- el número 4 es el id de la categoria


