Create database TourBD
USE TourBD
    
CREATE TABLE usuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
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

--TABLA USUSARIOS
CREATE PROCEDURE SP_INSERTAR_USUARIOS
	@nombre VARCHAR(255), 
	@email VARCHAR(255), 
	@password_hash varchar(255), 
	@tipo VARCHAR(50), 
	@creado_en DATETIME
AS
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT INTO usuarios VALUES (@nombre, @email, @password_hash, @tipo, @creado_en);
	COMMIT TRANSACTION;
	PRINT 'TRANSACCION HECHA'		
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION;
	PRINT 'ERROR'
END CATCH

SELECT * FROM usuarios

EXEC SP_INSERTAR_USUARIOS @nombre= '40', @email = '45', @password_hash = '5254165', @tipo = 'ASDFS', @creado_en = '2022-01-10'

DROP PROCEDURE SP_INSERTAR_USUARIOS

DELETE FROM usuarios WHERE id = 24;

-------------------------------------------------------------

CREATE PROCEDURE SP_ACTUALIZAR_USUARIOS
	@nombre VARCHAR(255), 
	@email VARCHAR(255), 
	@password_hash varchar(255), 
	@tipo VARCHAR(50), 
	@creado_en DATETIME,
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE usuarios SET nombre = @nombre, email = @email, password_hash = @password_hash, tipo = @tipo, creado_en = @creado_en
	WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ACTUALIZAR_USUARIOS @nombre = 'ayuda', @email = 'asdda', @password_hash = 'asds', @tipo = 'sadfgh', @creado_en = '2020-05-12', @id = 25

DROP PROCEDURE SP_ACTUALIZAR_USUARIOS 

SELECT * FROM usuarios

-------------------------------------------------------------

CREATE PROCEDURE SP_LEER_USUARIOS
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM usuarios
		PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_LEER_USUARIOS

DROP PROCEDURE SP_LEER_USUARIOS

-------------------------------------------------------------

CREATE PROCEDURE SP_ELIMINAR_USUARIOS
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	DELETE FROM usuarios WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ELIMINAR_USUARIOS @id = 26

DROP PROCEDURE SP_ACTUALIZAR_USUARIOS 

SELECT * FROM usuarios




--TABLA OFERTAS
CREATE PROCEDURE SP_INSERTAR_OFERTAS
	@titulo VARCHAR(255), 
	@descripcion TEXT,
	@image_url varchar(255), 
	@detalles TEXT, 
	@itinerario TEXT,
	@precio DECIMAL(10,2)
AS
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT INTO ofertas VALUES (@titulo, @descripcion, @image_url, @detalles, @itinerario, @precio);
	COMMIT TRANSACTION;
	PRINT 'TRANSACCION HECHA'		
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION;
	PRINT 'ERROR'
END CATCH

SELECT * FROM ofertas

EXEC SP_INSERTAR_OFERTAS @titulo= '40', @descripcion = '45', @image_url = '5254165', @detalles = 'ASDFS', @itinerario = '2022-01-10', @precio = 10

DROP PROCEDURE SP_INSERTAR_OFERTAS

DELETE FROM ofertas WHERE id = 1;

-------------------------------------------------------------

CREATE PROCEDURE SP_ACTUALIZAR_OFERTAS
	@titulo VARCHAR(255), 
	@descripcion TEXT,
	@image_url varchar(255), 
	@detalles TEXT, 
	@itinerario TEXT,
	@precio DECIMAL(10,2),
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE ofertas SET titulo = @titulo, descripcion = @descripcion, image_url = @image_url, detalles = @detalles, itinerario = @itinerario, precio = @precio
	WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ACTUALIZAR_OFERTAS @titulo = 'ayuda', @descripcion = 'asdda', @image_url = 'asds', @detalles = 'sadfgh', @itinerario = '2020-05-12', @precio = 54 , @id = 2

DROP PROCEDURE SP_ACTUALIZAR_USUARIOS 

SELECT * FROM ofertas

-------------------------------------------------------------

CREATE PROCEDURE SP_LEER_OFERTAS
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM ofertas
		PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_LEER_OFERTAS

DROP PROCEDURE SP_LEER_USUARIOS

-------------------------------------------------------------

CREATE PROCEDURE SP_ELIMINAR_OFERTAS
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	DELETE FROM ofertas WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ELIMINAR_OFERTAS @id = 2

DROP PROCEDURE SP_ELIMINAR_OFERTAS 

SELECT * FROM ofertas




--TABLA PAGOS
CREATE PROCEDURE SP_INSERTAR_PAGOS
	@metodo_pago VARCHAR(100),
    @estado_pago VARCHAR(100),
    @monto DECIMAL(10,2)
AS
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT INTO pagos VALUES (@metodo_pago, @estado_pago, @monto);
	COMMIT TRANSACTION;
	PRINT 'TRANSACCION HECHA'		
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION;
	PRINT 'ERROR'
END CATCH

SELECT * FROM pagos

EXEC SP_INSERTAR_PAGOS @metodo_pago= '41', @estado_pago = '45', @monto = '5254165'

DROP PROCEDURE SP_INSERTAR_PAGOS

DELETE FROM pagos WHERE id = 1;

-------------------------------------------------------------

CREATE PROCEDURE SP_ACTUALIZAR_PAGOS
	@metodo_pago VARCHAR(100),
    @estado_pago VARCHAR(100),
    @monto DECIMAL(10,2),
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE pagos SET metodo_pago = @metodo_pago, estado_pago = @estado_pago, monto = @monto
	WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ACTUALIZAR_PAGOS @metodo_pago = '@metodo_pago', @estado_pago = 'estado_pago', @monto = 20.3, @id = 2

DROP PROCEDURE SP_ACTUALIZAR_PAGOS 

SELECT * FROM pagos

-------------------------------------------------------------

CREATE PROCEDURE SP_LEER_PAGOS
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM pagos
		PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_LEER_PAGOS

DROP PROCEDURE SP_LEER_PAGOS

-------------------------------------------------------------

CREATE PROCEDURE SP_ELIMINAR_PAGOS
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	DELETE FROM pagos WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ELIMINAR_PAGOS @id = 2

DROP PROCEDURE SP_ELIMINAR_PAGOS 

SELECT * FROM pagos

-------------------------------------------------------------





--TABLA CONTACTOS
CREATE PROCEDURE SP_INSERTAR_CONTACTOS
    @nombre VARCHAR(100),
    @email VARCHAR(100),
    @mensaje TEXT
AS
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT INTO contactos VALUES (@nombre, @email, @mensaje);
	COMMIT TRANSACTION;
	PRINT 'TRANSACCION HECHA'		
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION;
	PRINT 'ERROR'
END CATCH

SELECT * FROM contactos

EXEC SP_INSERTAR_CONTACTOS @nombre= '41', @email = '45', @mensaje = '5254165'

DROP PROCEDURE SP_INSERTAR_CONTACTOS

DELETE FROM contactos WHERE id = 1;

-------------------------------------------------------------

CREATE PROCEDURE SP_ACTUALIZAR_CONTACTOS
    @nombre VARCHAR(100),
    @email VARCHAR(100),
    @mensaje TEXT,
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE contactos SET nombre = @nombre, email = @email, mensaje = @mensaje
	WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ACTUALIZAR_CONTACTOS @nombre = '@metodo_pago', @email = 'estado_pago', @mensaje = '20.3', @id = 2

DROP PROCEDURE SP_ACTUALIZAR_CONTACTOS

SELECT * FROM contactos

-------------------------------------------------------------

CREATE PROCEDURE SP_LEER_CONTACTOS
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM contactos
		PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_LEER_PAGOS

DROP PROCEDURE SP_LEER_PAGOS

-------------------------------------------------------------

CREATE PROCEDURE SP_ELIMINAR_CONTACTOS
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	DELETE FROM contactos WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ELIMINAR_CONTACTOS @id = 1

DROP PROCEDURE SP_ELIMINAR_CONTACTOS 

SELECT * FROM contactos

-------------------------------------------------------------




-- TABLA RESERVAS
CREATE PROCEDURE SP_INSERTAR_RESERVAS
    @nombre_completo VARCHAR(100),
    @email VARCHAR(100),
    @telefono VARCHAR(20),
    @id_tour INT,
    @id_usuario INT,
    @id_pago INT,
    @fecha_reserva DATE,
    @cantidad_personas INT
AS
BEGIN TRY
	BEGIN TRANSACTION;
	INSERT INTO reservas VALUES (@nombre_completo, @email, @telefono, @id_tour, @id_usuario, @id_pago, @fecha_reserva, @cantidad_personas);
	COMMIT TRANSACTION;
	PRINT 'TRANSACCION HECHA'		
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION;
	PRINT 'ERROR'
END CATCH

SELECT * FROM reservas

EXEC SP_INSERTAR_RESERVAS @nombre_completo= '41', @email = '45', @telefono = '5254165', @id_tour = 3 , @id_usuario = 27, @id_pago = 1, @fecha_reserva = '2020-2-3', @cantidad_personas = 2

DROP PROCEDURE SP_INSERTAR_PAGOS

DELETE FROM reservas WHERE id = 1;

SELECT * FROM ofertas

SELECT * FROM usuarios

SELECT * FROM pagos

SELECT * FROM contactos

-------------------------------------------------------------

CREATE PROCEDURE SP_ACTUALIZAR_RESERVAS
    @nombre_completo VARCHAR(100),
    @email VARCHAR(100),
    @telefono VARCHAR(20),
    @id_tour INT,
    @id_usuario INT,
    @id_pago INT,
    @fecha_reserva DATE,
    @cantidad_personas INT,
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	UPDATE reservas SET nombre_completo = @nombre_completo, email = @email, telefono = @telefono, id_tour = @id_tour, id_usuario = @id_usuario, id_pago = @id_pago, fecha_reserva = @fecha_reserva, cantidad_personas = @cantidad_personas
	WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ACTUALIZAR_RESERVAS @nombre_completo = '@metodo_pago', @email = 'estado_pago', @telefono = '20.3', @id_tour = 3, @id_usuario = 27, @id_pago = 1, @fecha_reserva = '2020-02-5', @cantidad_personas = 3, @id = 2

DROP PROCEDURE SP_ACTUALIZAR_CONTACTOS

SELECT * FROM reservas

-------------------------------------------------------------

CREATE PROCEDURE SP_LEER_RESERVAS
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM reservas
		PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_LEER_RESERVAS

DROP PROCEDURE SP_LEER_RESERVAS

-------------------------------------------------------------

CREATE PROCEDURE SP_ELIMINAR_RESERVAS
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
	DELETE FROM reservas WHERE id = @id;
	PRINT 'TRANSACCION HECHA'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
	PRINT 'ERROR'
END CATCH

EXEC SP_ELIMINAR_RESERVAS @id = 2

DROP PROCEDURE SP_ELIMINAR_RESERVAS



