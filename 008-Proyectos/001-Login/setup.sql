-- setup.sql - Base de datos para el proyecto Login

CREATE DATABASE IF NOT EXISTS proyecto_login;
USE proyecto_login;

CREATE TABLE usuarios (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    creado_en     DATETIME DEFAULT NOW()
);

-- Insertar usuario de prueba (password: '1234')
INSERT INTO usuarios (nombre, email, password_hash)
VALUES ('Admin', 'admin@demo.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');
