-- 1. Crear la base de datos de cero
CREATE DATABASE penca_mundial;
USE penca_mundial;

-- 2. Crear tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    puntos_totales INT DEFAULT 0
);

-- 3. Crear tabla partidos con la columna 'grupo' integrada de nacimiento
CREATE TABLE partidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grupo VARCHAR(20),
    equipo_local VARCHAR(50) NOT NULL,
    equipo_visitante VARCHAR(50) NOT NULL,
    fecha_hora DATETIME,
    goles_reales_local INT DEFAULT NULL,
    goles_reales_visitante INT DEFAULT NULL,
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
);

-- 4. Crear tabla predicciones
CREATE TABLE predicciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    partidoid INT NOT NULL,
    goles_pred_local INT NOT NULL,
    goles_pred_visitante INT NOT NULL,
    puntos_ganados INT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (partidoid) REFERENCES partidos(id) ON DELETE CASCADE,
    UNIQUE KEY uq_usuario_partido (usuario_id, partidoid)
);

-- 5. Insertar el fixture del Mundial 2026
INSERT INTO partidos (id, grupo, equipo_local, equipo_visitante, fecha_hora, estado) VALUES
(1, 'Grupo A', 'México', 'Sudáfrica', '2026-06-11 12:00:00', 'PENDIENTE'),
(2, 'Grupo A', 'Corea del Sur', 'República Checa', '2026-06-11 12:00:00', 'PENDIENTE'),
(3, 'Grupo B', 'Canadá', 'Bosnia y Herzegovina', '2026-06-12 12:00:00', 'PENDIENTE'),
(4, 'Grupo D', 'Estados Unidos', 'Paraguay', '2026-06-12 12:00:00', 'PENDIENTE'),
(5, 'Grupo C', 'Haití', 'Escocia', '2026-06-13 12:00:00', 'PENDIENTE'),
(6, 'Grupo D', 'Australia', 'Turquía', '2026-06-13 12:00:00', 'PENDIENTE'),
(7, 'Grupo C', 'Brasil', 'Marruecos', '2026-06-13 12:00:00', 'PENDIENTE'),
(8, 'Grupo B', 'Catar', 'Suiza', '2026-06-13 12:00:00', 'PENDIENTE'),
(9, 'Grupo E', 'Costa de Marfil', 'Ecuador', '2026-06-14 12:00:00', 'PENDIENTE'),
(10, 'Grupo E', 'Alemania', 'Curazao', '2026-06-14 12:00:00', 'PENDIENTE'),
(11, 'Grupo F', 'Países Bajos', 'Japón', '2026-06-14 12:00:00', 'PENDIENTE'),
(12, 'Grupo F', 'Suecia', 'Túnez', '2026-06-14 12:00:00', 'PENDIENTE'),
(13, 'Grupo H', 'España', 'Cabo Verde', '2026-06-15 12:00:00', 'PENDIENTE'),
(14, 'Grupo G', 'Bélgica', 'Egipto', '2026-06-15 12:00:00', 'PENDIENTE'),
(15, 'Grupo H', 'Arabia Saudita', 'Uruguay', '2026-06-15 12:00:00', 'PENDIENTE'),
(16, 'Grupo G', 'Irán', 'Nueva Zelanda', '2026-06-16 12:00:00', 'PENDIENTE'),
(17, 'Grupo I', 'Francia', 'Senegal', '2026-06-16 12:00:00', 'PENDIENTE'),
(18, 'Grupo I', 'Irak', 'Noruega', '2026-06-16 12:00:00', 'PENDIENTE'),
(19, 'Grupo J', 'Argentina', 'Argelia', '2026-06-16 12:00:00', 'PENDIENTE'),
(20, 'Grupo J', 'Austria', 'Jordania', '2026-06-16 12:00:00', 'PENDIENTE'),
(21, 'Grupo L', 'Ghana', 'Panamá', '2026-06-17 12:00:00', 'PENDIENTE'),
(22, 'Grupo L', 'Inglaterra', 'Croacia', '2026-06-17 12:00:00', 'PENDIENTE'),
(23, 'Grupo K', 'Portugal', 'RD del Congo', '2026-06-17 12:00:00', 'PENDIENTE'),
(24, 'Grupo K', 'Uzbekistán', 'Colombia', '2026-06-17 12:00:00', 'PENDIENTE'),
(25, 'Grupo A', 'República Checa', 'Sudáfrica', '2026-06-18 12:00:00', 'PENDIENTE'),
(26, 'Grupo B', 'Suiza', 'Bosnia y Herzegovina', '2026-06-18 12:00:00', 'PENDIENTE'),
(27, 'Grupo B', 'Canadá', 'Catar', '2026-06-18 12:00:00', 'PENDIENTE'),
(28, 'Grupo A', 'México', 'Corea del Sur', '2026-06-18 12:00:00', 'PENDIENTE'),
(29, 'Grupo C', 'Brasil', 'Haití', '2026-06-19 12:00:00', 'PENDIENTE'),
(30, 'Grupo C', 'Escocia', 'Marruecos', '2026-06-19 12:00:00', 'PENDIENTE'),
(31, 'Grupo D', 'Turquía', 'Paraguay', '2026-06-19 12:00:00', 'PENDIENTE'),
(32, 'Grupo D', 'Estados Unidos', 'Australia', '2026-06-19 12:00:00', 'PENDIENTE'),
(33, 'Grupo E', 'Alemania', 'Costa de Marfil', '2026-06-20 12:00:00', 'PENDIENTE'),
(34, 'Grupo E', 'Ecuador', 'Curazao', '2026-06-20 12:00:00', 'PENDIENTE'),
(35, 'Grupo F', 'Países Bajos', 'Suecia', '2026-06-20 12:00:00', 'PENDIENTE'),
(36, 'Grupo F', 'Túnez', 'Japón', '2026-06-20 12:00:00', 'PENDIENTE'),
(37, 'Grupo H', 'España', 'Arabia Saudita', '2026-06-21 12:00:00', 'PENDIENTE'),
(38, 'Grupo G', 'Bélgica', 'Irán', '2026-06-21 12:00:00', 'PENDIENTE'),
(39, 'Grupo H', 'Uruguay', 'Cabo Verde', '2026-06-21 12:00:00', 'PENDIENTE'),
(40, 'Grupo G', 'Nueva Zelanda', 'Egipto', '2026-06-21 12:00:00', 'PENDIENTE'),
(41, 'Grupo I', 'Noruega', 'Senegal', '2026-06-22 12:00:00', 'PENDIENTE'),
(42, 'Grupo I', 'Francia', 'Irak', '2026-06-22 12:00:00', 'PENDIENTE'),
(43, 'Grupo J', 'Argentina', 'Austria', '2026-06-22 12:00:00', 'PENDIENTE'),
(44, 'Grupo J', 'Jordania', 'Argelia', '2026-06-22 12:00:00', 'PENDIENTE'),
(45, 'Grupo L', 'Inglaterra', 'Ghana', '2026-06-23 12:00:00', 'PENDIENTE'),
(46, 'Grupo L', 'Panamá', 'Croacia', '2026-06-23 12:00:00', 'PENDIENTE'),
(47, 'Grupo K', 'Portugal', 'Uzbekistán', '2026-06-23 12:00:00', 'PENDIENTE'),
(48, 'Grupo K', 'Colombia', 'RD del Congo', '2026-06-23 12:00:00', 'PENDIENTE'),
(49, 'Grupo B', 'Suiza', 'Canadá', '2026-06-24 12:00:00', 'PENDIENTE'),
(50, 'Grupo B', 'Bosnia y Herzegovina', 'Catar', '2026-06-24 12:00:00', 'PENDIENTE'),
(51, 'Grupo C', 'Escocia', 'Brasil', '2026-06-24 12:00:00', 'PENDIENTE'),
(52, 'Grupo C', 'Marruecos', 'Haití', '2026-06-24 12:00:00', 'PENDIENTE'),
(53, 'Grupo A', 'República Checa', 'México', '2026-06-24 12:00:00', 'PENDIENTE'),
(54, 'Grupo A', 'Sudáfrica', 'Corea del Sur', '2026-06-24 12:00:00', 'PENDIENTE'),
(55, 'Grupo E', 'Ecuador', 'Alemania', '2026-06-25 12:00:00', 'PENDIENTE'),
(56, 'Grupo E', 'Curazao', 'Costa de Marfil', '2026-06-25 12:00:00', 'PENDIENTE'),
(57, 'Grupo F', 'Túnez', 'Países Bajos', '2026-06-25 12:00:00', 'PENDIENTE'),
(58, 'Grupo F', 'Japón', 'Suecia', '2026-06-25 12:00:00', 'PENDIENTE'),
(59, 'Grupo D', 'Turquía', 'Estados Unidos', '2026-06-25 12:00:00', 'PENDIENTE'),
(60, 'Grupo D', 'Paraguay', 'Australia', '2026-06-25 12:00:00', 'PENDIENTE'),
(61, 'Grupo I', 'Noruega', 'Francia', '2026-06-26 12:00:00', 'PENDIENTE'),
(62, 'Grupo I', 'Senegal', 'Irak', '2026-06-26 12:00:00', 'PENDIENTE'),
(63, 'Grupo H', 'Uruguay', 'España', '2026-06-26 12:00:00', 'PENDIENTE'),
(64, 'Grupo H', 'Cabo Verde', 'Arabia Saudita', '2026-06-26 12:00:00', 'PENDIENTE'),
(65, 'Grupo G', 'Nueva Zelanda', 'Bélgica', '2026-06-26 12:00:00', 'PENDIENTE'),
(66, 'Grupo G', 'Egipto', 'Irán', '2026-06-26 12:00:00', 'PENDIENTE'),
(67, 'Grupo L', 'Panamá', 'Inglaterra', '2026-06-27 12:00:00', 'PENDIENTE'),
(68, 'Grupo L', 'Croacia', 'Ghana', '2026-06-27 12:00:00', 'PENDIENTE'),
(69, 'Grupo K', 'Colombia', 'Portugal', '2026-06-27 12:00:00', 'PENDIENTE'),
(70, 'Grupo K', 'RD del Congo', 'Uzbekistán', '2026-06-27 12:00:00', 'PENDIENTE'),
(71, 'Grupo J', 'Jordania', 'Argentina', '2026-06-27 12:00:00', 'PENDIENTE'),
(72, 'Grupo J', 'Argelia', 'Austria', '2026-06-27 12:00:00', 'PENDIENTE');