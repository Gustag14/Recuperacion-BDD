-- 004 - Claves primarias

-- Clave primaria simple con AUTO_INCREMENT
CREATE TABLE libros (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn   CHAR(13) UNIQUE NOT NULL
);

-- Clave primaria compuesta
CREATE TABLE prestamos (
    id_socio INT  NOT NULL,
    id_libro INT  NOT NULL,
    fecha    DATE NOT NULL,
    PRIMARY KEY (id_socio, id_libro, fecha)
);

INSERT INTO libros (titulo, isbn) VALUES
    ('Don Quijote de la Mancha', '9788420412146'),
    ('Cien años de soledad',     '9780060883287');

SELECT * FROM libros;
