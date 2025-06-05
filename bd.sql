CREATE DATABASE IF NOT EXISTS TourBD;
USE TourBD;

-- usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ofertas
CREATE TABLE IF NOT EXISTS ofertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    detalles TEXT NOT NULL,
    itinerario TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- pagos
CREATE TABLE IF NOT EXISTS pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    metodo_pago VARCHAR(100) NOT NULL,
    estado_pago VARCHAR(100) NOT NULL,
    monto DECIMAL(10,2) NOT NULL
);

-- contactos
CREATE TABLE IF NOT EXISTS contactos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL
);

-- reservas
CREATE TABLE IF NOT EXISTS reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    id_tour INT NOT NULL,
    id_usuario INT NOT NULL,
    id_pago INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    cantidad_personas INT NOT NULL,
    FOREIGN KEY (id_tour) REFERENCES ofertas(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_pago) REFERENCES pagos(id)
);
DELIMITER //

-- usuarios
CREATE PROCEDURE SP_INSERTAR_USUARIOS (
    IN nombre VARCHAR(255), 
    IN email VARCHAR(255), 
    IN password_hash VARCHAR(255), 
    IN tipo VARCHAR(50), 
    IN creado_en DATETIME
)
BEGIN
    INSERT INTO usuarios(nombre, email, password_hash, tipo, creado_en)
    VALUES (nombre, email, password_hash, tipo, creado_en);
END;
//

CREATE PROCEDURE SP_ACTUALIZAR_USUARIOS (
    IN nombre VARCHAR(255), 
    IN email VARCHAR(255), 
    IN password_hash VARCHAR(255), 
    IN tipo VARCHAR(50), 
    IN creado_en DATETIME,
    IN id INT
)
BEGIN
    UPDATE usuarios 
    SET nombre = nombre, email = email, password_hash = password_hash, tipo = tipo, creado_en = creado_en
    WHERE id = id;
END;
//

CREATE PROCEDURE SP_LEER_USUARIOS ()
BEGIN
    SELECT * FROM usuarios;
END;
//

CREATE PROCEDURE SP_ELIMINAR_USUARIOS (
    IN id INT
)
BEGIN
    DELETE FROM usuarios WHERE id = id;
END;
//

-- ofertas
CREATE PROCEDURE SP_INSERTAR_OFERTAS (
    IN titulo VARCHAR(255), 
    IN descripcion TEXT,
    IN image_url VARCHAR(255), 
    IN detalles TEXT, 
    IN itinerario TEXT,
    IN precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO ofertas(titulo, descripcion, image_url, detalles, itinerario, precio)
    VALUES (titulo, descripcion, image_url, detalles, itinerario, precio);
END;
//

CREATE PROCEDURE SP_ACTUALIZAR_OFERTAS (
    IN titulo VARCHAR(255), 
    IN descripcion TEXT,
    IN image_url VARCHAR(255), 
    IN detalles TEXT, 
    IN itinerario TEXT,
    IN precio DECIMAL(10,2),
    IN id INT
)
BEGIN
    UPDATE ofertas 
    SET titulo = titulo, descripcion = descripcion, image_url = image_url, detalles = detalles, itinerario = itinerario, precio = precio
    WHERE id = id;
END;
//

CREATE PROCEDURE SP_LEER_OFERTAS ()
BEGIN
    SELECT * FROM ofertas;
END;
//

CREATE PROCEDURE SP_ELIMINAR_OFERTAS (
    IN id INT
)
BEGIN
    DELETE FROM ofertas WHERE id = id;
END;
//

-- pagos
CREATE PROCEDURE SP_INSERTAR_PAGOS (
    IN metodo_pago VARCHAR(100),
    IN estado_pago VARCHAR(100),
    IN monto DECIMAL(10,2)
)
BEGIN
    INSERT INTO pagos(metodo_pago, estado_pago, monto)
    VALUES (metodo_pago, estado_pago, monto);
END;
//

CREATE PROCEDURE SP_ACTUALIZAR_PAGOS (
    IN metodo_pago VARCHAR(100),
    IN estado_pago VARCHAR(100),
    IN monto DECIMAL(10,2),
    IN id INT
)
BEGIN
    UPDATE pagos 
    SET metodo_pago = metodo_pago, estado_pago = estado_pago, monto = monto
    WHERE id = id;
END;
//

CREATE PROCEDURE SP_LEER_PAGOS ()
BEGIN
    SELECT * FROM pagos;
END;
//

CREATE PROCEDURE SP_ELIMINAR_PAGOS (
    IN id INT
)
BEGIN
    DELETE FROM pagos WHERE id = id;
END;
//

-- contactos
CREATE PROCEDURE SP_INSERTAR_CONTACTOS (
    IN nombre VARCHAR(100),
    IN email VARCHAR(100),
    IN mensaje TEXT
)
BEGIN
    INSERT INTO contactos(nombre, email, mensaje)
    VALUES (nombre, email, mensaje);
END;
//

CREATE PROCEDURE SP_ACTUALIZAR_CONTACTOS (
    IN nombre VARCHAR(100),
    IN email VARCHAR(100),
    IN mensaje TEXT,
    IN id INT
)
BEGIN
    UPDATE contactos 
    SET nombre = nombre, email = email, mensaje = mensaje
    WHERE id = id;
END;
//

CREATE PROCEDURE SP_LEER_CONTACTOS ()
BEGIN
    SELECT * FROM contactos;
END;
//

CREATE PROCEDURE SP_ELIMINAR_CONTACTOS (
    IN id INT
)
BEGIN
    DELETE FROM contactos WHERE id = id;
END;
//

-- reservas
CREATE PROCEDURE SP_INSERTAR_RESERVAS (
    IN nombre_completo VARCHAR(100),
    IN email VARCHAR(100),
    IN telefono VARCHAR(20),
    IN id_tour INT,
    IN id_usuario INT,
    IN id_pago INT,
    IN fecha_reserva DATE,
    IN cantidad_personas INT
)
BEGIN
    INSERT INTO reservas(nombre_completo, email, telefono, id_tour, id_usuario, id_pago, fecha_reserva, cantidad_personas)
    VALUES (nombre_completo, email, telefono, id_tour, id_usuario, id_pago, fecha_reserva, cantidad_personas);
END;
//

CREATE PROCEDURE SP_ACTUALIZAR_RESERVAS (
    IN nombre_completo VARCHAR(100),
    IN email VARCHAR(100),
    IN telefono VARCHAR(20),
    IN id_tour INT,
    IN id_usuario INT,
    IN id_pago INT,
    IN fecha_reserva DATE,
    IN cantidad_personas INT,
    IN id INT
)
BEGIN
    UPDATE reservas 
    SET nombre_completo = nombre_completo, email = email, telefono = telefono, id_tour = id_tour, 
        id_usuario = id_usuario, id_pago = id_pago, fecha_reserva = fecha_reserva, cantidad_personas = cantidad_personas
    WHERE id = id;
END;
//

CREATE PROCEDURE SP_LEER_RESERVAS ()
BEGIN
    SELECT * FROM reservas;
END;
//

CREATE PROCEDURE SP_ELIMINAR_RESERVAS (
    IN id INT
)
BEGIN
    DELETE FROM reservas WHERE id = id;
END;
//
DELIMITER ;
