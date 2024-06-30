DROP DATABASE IF EXISTS academic_hub;
CREATE DATABASE academic_hub;  
USE academic_hub;


-- tabla rol

DROP TABLE IF EXISTS Rol;
CREATE TABLE Rol (
    ID_rol INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_rol VARCHAR(50) NOT NULL
);

-- Tabla Usuarios

DROP TABLE IF EXISTS Usuarios;
CREATE TABLE Usuarios (
    Id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Alias VARCHAR(50) NOT NULL,
    Nombre_usuario VARCHAR(20) NOT NULL,
    Apellido_usuario VARCHAR(50) NOT NULL,
    Codigo_estudiante VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Telefono VARCHAR(9),
    Password VARCHAR(255) NOT NULL
);


-- TAbla intermedia Rol_usuario: Guarda la relación entre el usuario y el rol que tiene.

DROP TABLE IF EXISTS Rol_usuario;
CREATE TABLE Rol_usuario (
    Id_rol INT NOT NULL ,
    Id_usuario INT NOT NULL,
    PRIMARY KEY (Id_rol, Id_usuario),
    FOREIGN KEY (Id_rol) REFERENCES Rol(ID_rol),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario),
    UNIQUE (Id_usuario)
);


-- Tabla Evento

DROP TABLE IF EXISTS Evento;
CREATE TABLE Evento (
    Id_evento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_evento VARCHAR(255) NOT NULL,
    Fecha_evento DATE NOT NULL,
    Ubicacion_evento VARCHAR(100) NOT NULL,
    Descripcion_evento TEXT NULL,
    Flayer_evento VARCHAR(50) NOT NULL,
    Portada_Evento VARCHAR(50) NOT NULL,
    Modalidad_evento VARCHAR(50) NOT NULL
);
ALTER TABLE Evento
ADD COLUMN Fecha_publicacion DATE NULL;

-- Tabla Estado

DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado (
    Id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

-- Tabla Intermedia: Guarda la relación de un evento y su estado actual

DROP TABLE IF EXISTS Estado_evento;
CREATE TABLE Estado_evento (
    Id_evento INT NOT NULL,
    Id_estado INT NOT NULL,
    PRIMARY KEY (Id_evento, Id_estado),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_estado) REFERENCES Estado(Id_estado),
    UNIQUE (Id_evento)
);

-- Tabla Intermedia: GUarda la relación de todos los asistente a un evento.alter

DROP TABLE IF EXISTS Asistentes_evento;
CREATE TABLE Asistentes_evento (
    Id_evento INT NOT NULL,
    Id_usuario INT NOT NULL,
    Fecha_asistencia DATE NOT NULL,
    PRIMARY KEY (Id_evento, Id_usuario),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario)
);


-- Tabla Categoria

DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria (
    Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_categoria VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla intermedia: Relaciona un evento con una categoría.

DROP TABLE IF EXISTS Categoria_evento;
CREATE TABLE Categoria_Evento (
    Id_evento INT NOT NULL,
    Id_categoria INT NOT NULL,
    PRIMARY KEY (Id_evento, Id_categoria),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_categoria) REFERENCES Categoria(Id_categoria)
);

-- Tabla intermedia: Almacena todos los eventos publicados

DROP TABLE IF EXISTS eventos_publicados;
CREATE TABLE eventos_publicados (
    Id_evento INT NOT NULL,
    Fecha_publicacion DATE NOT NULL,
    PRIMARY KEY (Id_evento),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento)
);


-- Tabla intermedia: Almacena info de los Usuario que participan en un evento.
DROP TABLE IF EXISTS Usuario_eventoPublicado;
CREATE TABLE Usuario_eventoPublicado (
    Id_evento INT NOT NULL,
    Id_usuario INT NOT NULL,
    PRIMARY KEY (Id_evento, Id_usuario),
    FOREIGN KEY (Id_evento) REFERENCES Evento(Id_evento),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario)
);