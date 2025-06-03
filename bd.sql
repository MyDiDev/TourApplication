Create database TourBD
drop database TourBD

Select * from usuarios 

CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    creado_en DATETIME DEFAULT GETDATE()
);

CREATE TABLE ofertas (
    id INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(100),
    descripcion TEXT,
    image_url VARCHAR(255),
    detalles TEXT,
    itinerario TEXT,
    precio DECIMAL(10,2)
);

CREATE TABLE pagos (
    id INT PRIMARY KEY IDENTITY(1,1),
    metodo_pago VARCHAR(100),
    estado_pago VARCHAR(100),
    monto DECIMAL(10,2)
);

CREATE TABLE contactos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    email VARCHAR(100),
    mensaje TEXT
);

CREATE TABLE reservas (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre_completo VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    id_tour INT,
    id_usuario INT,
    id_pago INT,
    fecha_reserva DATE,
    cantidad_personas INT,

    FOREIGN KEY (id_tour) REFERENCES ofertas(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_pago) REFERENCES pagos(id)
);