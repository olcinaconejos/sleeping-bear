-- Usuarios
INSERT INTO Usuario (nombre, email) VALUES
('Ana García', 'ana@example.com'),
('Luis Pérez', 'luis@example.com'),
('María López', 'maria@example.com');

-- Perfiles (uno por usuario)
INSERT INTO Perfil (id_usuario, foto_url, biografia) VALUES
(1, 'https://example.com/fotos/ana.jpg', 'Desarrolladora front‑end.'),
(2, 'https://example.com/fotos/luis.jpg', 'Ingeniero de datos.'),
(3, 'https://example.com/fotos/maria.jpg', 'Diseñadora UX.');

-- Publicaciones
INSERT INTO Publicacion (id_usuario, titulo, contenido) VALUES
(1, 'Mi primer post', '¡Hola mundo! Este es mi primer artículo.'),
(2, 'Análisis de datos', 'Hoy revisamos un dataset de ventas.'),
(2, 'Tips de SQL', 'Cómo optimizar consultas en MySQL.'),
(3, 'Diseño accesible', 'Principios para crear UI inclusiva.');

-- Etiquetas
INSERT INTO Etiqueta (nombre) VALUES
('Introducción'), ('SQL'), ('DataScience'), ('UX'), ('Accesibilidad');

-- Enlazando publicaciones con etiquetas (N:M)
INSERT INTO Publicacion_Etiqueta (id_publicacion, id_etiqueta) VALUES
(1, 1),                     -- Post de Ana → Introducción
(2, 3), (2, 2),             -- Análisis de datos → DataScience + SQL
(3, 2),                     -- Tips de SQL → SQL
(4, 4), (4, 5);             -- Diseño accesible → UX + Accesibilidad

-- Relaciones reflexivas (Amistad)
INSERT INTO Amistad (id_usuario1, id_usuario2) VALUES
(1,2), (2,1),   -- Ana y Luis son amigos (bidireccional)
(1,3), (3,1);   -- Ana y María también
