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
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    detalles TEXT NOT NULL,
    itinerario TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE pagos (
    id INT PRIMARY KEY IDENTITY(1,1),
    metodo_pago VARCHAR(100) NOT NULL,
    estado_pago VARCHAR(100) NOT NULL,
    monto DECIMAL(10,2) NOT NULL
);

CREATE TABLE contactos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL
);

CREATE TABLE reservas (
    id INT PRIMARY KEY IDENTITY(1,1),
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
