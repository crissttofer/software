DROP DATABASE IF EXISTS academic_hub;
CREATE DATABASE academic_hub;
USE academic_hub;

DROP TABLE IF EXISTS evento;
CREATE TABLE evento(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(250) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(250) NULL,
    portada VARCHAR(250) NOT NULL,
    imgDescripcion VARCHAR(250) NOT NULL
);

DROP TABLE IF  EXISTS usuario;
CREATE TABLE usuario(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    apellido VARCHAR(250) NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    password VARCHAR(250) NOT NULL
);

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(250) NOT NULL
    );

DROP TABLE IF EXISTS estado;
CREATE TABLE estado(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) not null
);

DROP TABLE IF EXISTS rol;
CREATE TABLE rol(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) NOT NULL
);

-- TALBAS INTERMEDIAS

DROP TABLE IF EXISTS categoria_evento;
CREATE TABLE categoria_evento(
    idEvento INT NOT NULL,
    idCategoria INT NOT NULL,
    primary key (idEvento,idCategoria),
    FOREIGN KEY(idEvento) REFERENCES evento(id),
    FOREIGN KEY(idCategoria) REFERENCES categoria(id)
);

DROP TABLE IF EXISTS usuario_evento;
CREATE TABLE usuario_evento(
    idUsuario INT NOT NULL,
    idEvento INT NOT NULL,
    PRIMARY KEY (idUsuario,idEvento),
    FOREIGN KEY (idUsuario) REFERENCES usuario(id),
    FOREIGN KEY (idEvento) REFERENCES evento(id)
);

DROP TABLE IF EXISTS rol_usuario;
CREATE TABLE rol_usuario(
    idUsuario INT NOT NULL,
    idRol INT NOT NULL,
    PRIMARY KEY (idUsuario,idRol),
    FOREIGN KEY (idUsuario) REFERENCES usuario (id),
    FOREIGN KEY (idRol) REFERENCES rol (id)
);

DROP TABLE IF EXISTS estado_evento;
CREATE TABLE estado_evento(
    idEvento INT NOT NULL,
    idEstado INT NOT NULL,
    PRIMARY KEY (idEvento,idEstado),
    FOREIGN KEY (idEvento) REFERENCES evento(id),
    FOREIGN KEY (idEstado) REFERENCES estado(id)
);