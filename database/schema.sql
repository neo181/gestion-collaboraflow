-- Crear base de datos
CREATE DATABASE mi_proyecto;
USE mi_proyecto;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla de productos
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    categoria VARCHAR(100),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('pendiente', 'completado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Datos de ejemplo
INSERT INTO usuarios (nombre, email, password_hash) VALUES
('Juan Pérez', 'juan@email.com', 'hash_seguro_123'),
('María García', 'maria@email.com', 'hash_seguro_456');

INSERT INTO productos (nombre, descripcion, precio, categoria) VALUES
('Laptop HP', 'Laptop de 15 pulgadas, 8GB RAM', 899.99, 'Tecnología'),
('Smartphone Samsung', 'Teléfono Android de última generación', 699.99, 'Tecnología');