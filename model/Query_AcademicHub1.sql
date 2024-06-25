USE academic_hub;

CREATE TABLE Rol (
    ID_rol INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE Usuarios (
    Id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_usuario VARCHAR(20) NOT NULL,
    Apellido_usuario VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Telefono VARCHAR(9),
    Contraseña VARCHAR(50) NOT NULL
);

CREATE TABLE Rol_usuario (
    Id_rol INT,
    Id_usuario INT,
    PRIMARY KEY (Id_rol, Id_usuario),
    FOREIGN KEY (Id_rol) REFERENCES Rol(ID_rol),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario),
    UNIQUE (Id_usuario)
);

CREATE TABLE Evento (
    Id_evento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_evento VARCHAR(255) NOT NULL,
    Fecha_evento DATE,
    Ubicacion_evento VARCHAR(100),
    Descripcion_evento TEXT,
    Flayer_evento VARCHAR(50),
    Portada_Evento VARCHAR(50),
    Video_evento VARCHAR(50),
    Modalidad_evento VARCHAR(50)
);

CREATE TABLE Estado (
    Id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

CREATE TABLE Estado_evento (
    Id_evento INT,
    Id_estado INT,
    PRIMARY KEY (Id_evento, Id_estado),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_estado) REFERENCES Estado(Id_estado),
    UNIQUE (Id_evento)
);

CREATE TABLE Asistentes_evento (
    Id_evento INT,
    Id_usuario INT,
    Fecha_asistencia DATE,
    PRIMARY KEY (Id_evento, Id_usuario),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario)
);

CREATE TABLE Categoria (
    Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Categoria_Evento (
    Id_evento INT,
    Id_categoria INT,
    PRIMARY KEY (Id_evento, Id_categoria),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_categoria) REFERENCES Categoria(Id_categoria)
);

CREATE TABLE eventos_publicados (
    Id_eventoPublicado INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_publicacion DATE,
    FOREIGN KEY (Id_eventoPublicado) REFERENCES Evento(Id_evento)
);

CREATE TABLE Usuario_evento (
    Id_usuario INT,
    Id_evento INT,
    PRIMARY KEY (Id_usuario, Id_evento),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento)
);

---------------------------------------------------------------------------------------------------------------------
-- Insertando datos en la tabla Rol
INSERT INTO Rol (Nombre_rol) VALUES 
('Administrador'), 
('Usuario'), 
('Centro_Federado'), 
('Director_Academico')

-- Insertando datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Contraseña) VALUES 
('Juan', 'Perez', 'juan.perez@example.com', '123456789', 'password123'),
('Ana', 'Gomez', 'ana.gomez@example.com', '987654321', 'password123'),
('Carlos', 'Lopez', 'carlos.lopez@example.com', '123123123', 'password123'),
('Maria', 'Martinez', 'maria.martinez@example.com', '321321321', 'password123'),
('Jose', 'Sanchez', 'jose.sanchez@example.com', '456456456', 'password123');

-- Insertando datos en la tabla Rol_usuario
INSERT INTO Rol_usuario (Id_rol, Id_usuario) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(3, 5);

-- Insertando datos en la tabla Evento
INSERT INTO Evento (Nombre_evento, Fecha_evento, Ubicacion_evento, Descripcion_evento, Flayer_evento, Portada_Evento, Video_evento, Modalidad_evento) VALUES 
('Conferencia Anual', '2024-07-01', 'Auditorio Central', 'Una conferencia sobre tecnología.', 'flyer1.jpg', 'portada1.jpg', 'video1.mp4', 'Presencial'),
('Taller de Programación', '2024-08-15', 'Sala de Computo', 'Un taller práctico de programación.', 'flyer2.jpg', 'portada2.jpg', 'video2.mp4', 'Virtual'),
('Seminario de Marketing', '2024-09-10', 'Sala de Conferencias', 'Seminario sobre estrategias de marketing.', 'flyer3.jpg', 'portada3.jpg', 'video3.mp4', 'Presencial'),
('Feria de Empleo', '2024-10-05', 'Patio Principal', 'Feria con diversas empresas buscando talento.', 'flyer4.jpg', 'portada4.jpg', 'video4.mp4', 'Presencial'),
('Mesa Redonda de Ciencia', '2024-11-20', 'Sala de Reuniones', 'Discusión sobre avances científicos.', 'flyer5.jpg', 'portada5.jpg', 'video5.mp4', 'Híbrido');

-- Insertando datos en la tabla Estado
INSERT INTO Estado (nombre_estado) VALUES 
('Aceptado'), 
('Rechazado'), 
('En espera');

-- Insertando datos en la tabla Estado_evento
INSERT INTO Estado_evento (Id_evento, Id_estado) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(5, 3), 
(4, 3);

-- Insertando datos en la tabla Asistentes_evento
INSERT INTO Asistentes_evento (Id_evento, Id_usuario, Fecha_asistencia) VALUES 
(1, 1, '2024-07-28'), 
(2, 2, '2024-08-29'), 
(3, 3, '2024-09-30'), 
(4, 4, '2024-10-28'), 
(5, 5, '2024-11-25');

-- Insertando datos en la tabla Categoria
INSERT INTO Categoria (Nombre_categoria) VALUES 
('Tecnología'), 
('Educación'), 
('Deportes'), 
('Arte y cultura'), 
('Ciencia');

-- Insertando datos en la tabla Categoria_Evento
INSERT INTO Categoria_Evento (Id_evento, Id_categoria) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5);

-- Insertando datos en la tabla eventos_publicados
INSERT INTO eventos_publicados (Id_eventoPublicado, Fecha_publicacion) VALUES 
(1, '2024-06-24'), 
(2, '2024-06-23'), 
(3, '2024-06-17'), 
(4, '2024-06-15'), 
(5, '2024-06-10');


------------------------------------------------------------------------------------------------------------------

-- Insertando datos adicionales en la tabla Usuarios
INSERT INTO Usuarios (Nombre_usuario, Apellido_usuario, Email, Telefono, Contraseña) VALUES 
('Luis', 'Ramirez', 'luis.ramirez@example.com', '112233445', 'password123'),
('Elena', 'Rojas', 'elena.rojas@example.com', '998877665', 'password123'),
('David', 'Nunez', 'david.nunez@example.com', '223344556', 'password123'),
('Sofia', 'Morales', 'sofia.morales@example.com', '667788990', 'password123'),
('Miguel', 'Vargas', 'miguel.vargas@example.com', '554433221', 'password123'),
('Lucia', 'Torres', 'lucia.torres@example.com', '776655443', 'password123'),
('Diego', 'Castro', 'diego.castro@example.com', '889900112', 'password123'),
('Carmen', 'Ortega', 'carmen.ortega@example.com', '334455667', 'password123'),
('Jorge', 'Guerrero', 'jorge.guerrero@example.com', '445566778', 'password123'),
('Patricia', 'Hernandez', 'patricia.hernandez@example.com', '556677889', 'password123'),
('Roberto', 'Flores', 'roberto.flores@example.com', '667788990', 'password123'),
('Adriana', 'Mendez', 'adriana.mendez@example.com', '778899001', 'password123'),
('Fernando', 'Ruiz', 'fernando.ruiz@example.com', '889900112', 'password123'),
('Gloria', 'Martinez', 'gloria.martinez@example.com', '990011223', 'password123'),
('Hugo', 'Gonzalez', 'hugo.gonzalez@example.com', '112233445', 'password123'),
('Isabel', 'Diaz', 'isabel.diaz@example.com', '223344556', 'password123'),
('Juan', 'Fernandez', 'juan.fernandez@example.com', '334455667', 'password123'),
('Karen', 'Jimenez', 'karen.jimenez@example.com', '445566778', 'password123'),
('Leonardo', 'Reyes', 'leonardo.reyes@example.com', '556677889', 'password123'),
('Monica', 'Palacios', 'monica.palacios@example.com', '667788990', 'password123');

-- Insertando datos adicionales en la tabla Rol_usuario
INSERT INTO Rol_usuario (Id_rol, Id_usuario) VALUES 
(1, 6), 
(2, 7), 
(3, 8), 
(4, 9), 
(3, 10), 
(1, 11), 
(2, 12), 
(3, 13), 
(4, 14), 
(3, 15), 
(1, 16), 
(2, 17), 
(3, 18), 
(4, 19), 
(3, 20), 
(1, 21), 
(2, 22), 
(3, 23), 
(4, 24), 
(3, 25);

-- Insertando datos adicionales en la tabla Evento
INSERT INTO Evento (Nombre_evento, Fecha_evento, Ubicacion_evento, Descripcion_evento, Flayer_evento, Portada_Evento, Video_evento, Modalidad_evento) VALUES 
('Hackathon 2024', '2024-12-01', 'Sala de Computo', 'Competencia de programación.', 'flyer6.jpg', 'portada6.jpg', 'video6.mp4', 'Presencial'),
('Expo Ciencia', '2024-11-25', 'Sala de Reuniones', 'Exposición sobre avances científicos.', 'flyer7.jpg', 'portada7.jpg', 'video7.mp4', 'Virtual'),
('Foro de Educación', '2024-10-10', 'Auditorio Principal', 'Foro sobre nuevas metodologías educativas.', 'flyer8.jpg', 'portada8.jpg', 'video8.mp4', 'Híbrido'),
('Concurso de Arte', '2024-09-15', 'Sala de Arte', 'Concurso de obras artísticas.', 'flyer9.jpg', 'portada9.jpg', 'video9.mp4', 'Presencial'),
('Jornada de Salud', '2024-08-20', 'Auditorio Secundario', 'Jornada sobre salud y bienestar.', 'flyer10.jpg', 'portada10.jpg', 'video10.mp4', 'Virtual'),
('Feria Tecnológica', '2024-07-05', 'Patio Central', 'Feria de innovación tecnológica.', 'flyer11.jpg', 'portada11.jpg', 'video11.mp4', 'Presencial'),
('Cumbre de Negocios', '2024-06-15', 'Sala de Conferencias', 'Cumbre sobre negocios y economía.', 'flyer12.jpg', 'portada12.jpg', 'video12.mp4', 'Híbrido'),
('Festival de Música', '2024-05-20', 'Anfiteatro', 'Festival con bandas locales.', 'flyer13.jpg', 'portada13.jpg', 'video13.mp4', 'Presencial'),
('Simposio de Historia', '2024-04-25', 'Sala de Historia', 'Simposio sobre eventos históricos.', 'flyer14.jpg', 'portada14.jpg', 'video14.mp4', 'Virtual'),
('Torneo de Ajedrez', '2024-03-30', 'Sala de Juegos', 'Torneo de ajedrez abierto.', 'flyer15.jpg', 'portada15.jpg', 'video15.mp4', 'Presencial'),
('Encuentro de Literatura', '2024-02-28', 'Biblioteca Central', 'Encuentro con escritores.', 'flyer16.jpg', 'portada16.jpg', 'video16.mp4', 'Híbrido'),
('Feria de Emprendimiento', '2024-01-25', 'Plaza Principal', 'Feria para nuevos emprendedores.', 'flyer17.jpg', 'portada17.jpg', 'video17.mp4', 'Virtual'),
('Maratón de Lectura', '2024-01-15', 'Sala de Lectura', 'Lectura ininterrumpida de obras.', 'flyer18.jpg', 'portada18.jpg', 'video18.mp4', 'Presencial'),
('Exhibición Fotográfica', '2024-02-05', 'Galería de Arte', 'Exhibición de fotógrafos locales.', 'flyer19.jpg', 'portada19.jpg', 'video19.mp4', 'Híbrido'),
('Congreso de Medicina', '2024-03-10', 'Auditorio Médico', 'Congreso con profesionales de la salud.', 'flyer20.jpg', 'portada20.jpg', 'video20.mp4', 'Presencial'),
('Seminario de Robótica', '2024-04-05', 'Sala de Innovación', 'Seminario sobre robótica avanzada.', 'flyer21.jpg', 'portada21.jpg', 'video21.mp4', 'Virtual'),
('Jornada de Derecho', '2024-05-10', 'Sala Jurídica', 'Jornada sobre temas legales actuales.', 'flyer22.jpg', 'portada22.jpg', 'video22.mp4', 'Híbrido'),
('Encuentro de Ingenieros', '2024-06-20', 'Sala de Ingenierías', 'Encuentro de profesionales de la ingeniería.', 'flyer23.jpg', 'portada23.jpg', 'video23.mp4', 'Presencial'),
('Taller de Pintura', '2024-07-15', 'Sala de Arte', 'Taller práctico de técnicas de pintura.', 'flyer24.jpg', 'portada24.jpg', 'video24.mp4', 'Virtual'),
('Festival de Cine', '2024-08-05', 'Cine Auditorio', 'Festival de cine independiente.', 'flyer25.jpg', 'portada25.jpg', 'video25.mp4', 'Híbrido');

-- Insertando datos adicionales en la tabla Estado_evento
INSERT INTO Estado_evento (Id_evento, Id_estado) VALUES 
(6, 1), 
(7, 2), 
(8, 3), 
(9, 1), 
(10, 2), 
(11, 3), 
(12, 1), 
(13, 2), 
(14, 3), 
(15, 1), 
(16, 2), 
(17, 3), 
(18, 1), 
(19, 2), 
(20, 3), 
(21, 1), 
(22, 2), 
(23, 3), 
(24, 1), 
(25, 2);

-- Insertando datos adicionales en la tabla Asistentes_evento
INSERT INTO Asistentes_evento (Id_evento, Id_usuario, Fecha_asistencia) VALUES
(6, 16, '2024-12-01'),
(6, 17, '2024-12-01'),
(6, 18, '2024-12-01'),
(6, 19, '2024-12-01'),
(6, 20, '2024-12-01'),
(7, 1, '2024-11-25'),
(7, 2, '2024-11-25'),
(7, 3, '2024-11-25'),
(7, 4, '2024-11-25'),
(7, 5, '2024-11-25'),
(8, 6, '2024-10-10'),
(8, 7, '2024-10-10'),
(8, 8, '2024-10-10'),
(8, 9, '2024-10-10'),
(8, 10, '2024-10-10'),
(9, 11, '2024-09-15'),
(9, 12, '2024-09-15'),
(9, 13, '2024-09-15'),
(9, 14, '2024-09-15'),
(9, 15, '2024-09-15'),
(10, 1, '2024-08-20'),
(10, 2, '2024-08-20'),
(10, 3, '2024-08-20'),
(10, 4, '2024-08-20'),
(10, 5, '2024-08-20');


-- Insertando datos adicionales en la tabla Categoria_Evento
INSERT INTO Categoria_Evento (Id_evento, Id_categoria) VALUES 
(6, 1), 
(7, 2), 
(8, 3), 
(9, 4), 
(10, 5), 
(11, 1), 
(12, 2), 
(13, 3), 
(14, 4), 
(15, 5), 
(16, 1), 
(17, 2), 
(18, 3), 
(19, 4), 
(20, 5), 
(21, 1), 
(22, 2), 
(23, 3), 
(24, 4), 
(25, 5);

-- Insertando datos adicionales en la tabla eventos_publicados
INSERT INTO eventos_publicados (Id_eventoPublicado, Fecha_publicacion) VALUES 
(6, '2024-06-24'), 
(7, '2024-06-23'), 
(8, '2024-06-22'), 
(9, '2024-06-21'), 
(10, '2024-06-20'), 
(11, '2024-06-19'), 
(12, '2024-06-18'), 
(13, '2024-06-17'), 
(14, '2024-06-16'), 
(15, '2024-06-15'), 
(16, '2024-06-14'), 
(17, '2024-06-13'), 
(18, '2024-06-12'), 
(19, '2024-06-11'), 
(20, '2024-06-10'), 
(21, '2024-06-09'), 
(22, '2024-06-08'), 
(23, '2024-06-07'), 
(24, '2024-06-06'), 
(25, '2024-06-05');


-- Insertando datos en la tabla Usuario_evento
INSERT INTO Usuario_evento (Id_usuario, Id_evento) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25);

-- Borrar todos los registros de la tabla Usuario_evento
DELETE FROM Usuario_evento;

-- Verificar que la tabla está vacía
SELECT * FROM Usuario_evento;


INSERT INTO Usuario_evento (Id_usuario, Id_evento) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 20),
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25);




-- consulta para conocer la lista de eventos por categoria:
SELECT c.Nombre_categoria, e.Id_evento, e.Nombre_evento, e.Fecha_evento, e.Ubicacion_evento, e.Descripcion_evento
FROM Evento e
JOIN Categoria_Evento ce ON e.Id_evento = ce.Id_evento
JOIN Categoria c ON ce.Id_categoria = c.Id_categoria
ORDER BY c.Nombre_categoria;

-- Consutla para conocer los eventos que publicó cierto usuario
SELECT u.Id_usuario, e.Id_evento, e.Nombre_evento, e.Fecha_evento, e.Ubicacion_evento, e.Descripcion_evento
FROM Evento e
JOIN Usuario_evento ue ON e.Id_evento = ue.Id_evento
JOIN Usuarios u ON ue.Id_usuario = u.Id_usuario
WHERE u.Id_usuario = 1; -- Reemplaza '1' con el ID del usuario que deseas consultar


-- Consulta para saber que usuarios están regustrados en un evento
SELECT ae.Id_evento, ae.Id_usuario, u.Nombre_usuario AS nombre, u.Apellido_usuario AS apellido, ae.Fecha_asistencia
FROM asistentes_evento ae
JOIN Usuarios u ON ae.Id_usuario = u.Id_usuario
WHERE ae.Id_evento = 6; -- Reemplaza 1 con el ID del evento específico que deseas consultar

-- Consulta para conocer el estado de los eventos
SELECT e.Nombre_evento, est.nombre_estado
FROM Evento e
JOIN Estado_evento ee ON e.Id_evento = ee.Id_evento
JOIN Estado est ON ee.Id_estado = est.Id_estado;








