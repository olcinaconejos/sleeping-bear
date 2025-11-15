CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

CREATE TABLE Usuario (
    id_usuario   INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(50) NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
) ENGINE=InnoDB;

CREATE TABLE Perfil (
    id_perfil    INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario   INT NOT NULL UNIQUE,               -- UNIQUE garantiza 1‑1
    foto_url     VARCHAR(255),
    biografia    TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Publicacion (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario     INT NOT NULL,
    titulo         VARCHAR(150) NOT NULL,
    contenido      TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Etiqueta (
    id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Publicacion_Etiqueta (
    id_publicacion INT NOT NULL,
    id_etiqueta    INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_etiqueta),   -- clave compuesta
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_etiqueta) REFERENCES Etiqueta(id_etiqueta)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Amistad (
    id_usuario1 INT NOT NULL,
    id_usuario2 INT NOT NULL,
    fecha_amistad DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_usuario1, id_usuario2),
    CONSTRAINT chk_distintos CHECK (id_usuario1 <> id_usuario2),
    FOREIGN KEY (id_usuario1) REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario2) REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

