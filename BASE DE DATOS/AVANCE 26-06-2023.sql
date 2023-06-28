CREATE DATABASE app_data;

CREATE TABLE usuario(
	id_usuario NUMERIC (4) PRIMARY KEY,
	nombre_usuario VARCHAR (50),
	email_usuario VARCHAR (50), 
	contraseña_usuario VARCHAR (50),
	telefono_usuario VARCHAR(20),
	dni_usuario CHAR (10)
);

CREATE TABLE vendedor(
	id_ven NUMERIC (4) PRIMARY KEY,
	nombre_ven VARCHAR (50),
	descripcion_ven VARCHAR (100),
	direccion_ven VARCHAR (70),
	telefono_ven VARCHAR (20),
	email_ven VARCHAR (50),
	valoracion NUMERIC (2,1),
	nroventas NUMERIC (5)
);

CREATE TABLE categoria (
	id_categ NUMERIC (4) PRIMARY KEY,
	nombre_categ VARCHAR (30),
	descripcion_categ VARCHAR (100)
);

CREATE TABLE producto (
	id_prod NUMERIC (4) PRIMARY KEY,
	nombre_prod VARCHAR (100),
	descripcion_prod VARCHAR (100),
	precio_prod NUMERIC (5.2),
	stock_prod NUMERIC (4),
	id_ven NUMERIC (4),
	id_categ NUMERIC (4),
	FOREIGN KEY (id_ven) REFERENCES vendedor (id_ven),
	FOREIGN KEY (id_categ) REFERENCES categoria (id_categ)
);

CREATE TABLE descuento (
	id_desc NUMERIC (4) PRIMARY KEY,
	porcentaje_desc NUMERIC (6,5),
	fecha_inicio_desc CHAR (10),
	fecha_fin_desc CHAR (10),
	id_prod NUMERIC (4),
	FOREIGN KEY (id_prod) REFERENCES producto (id_prod)
);

CREATE TABLE valoracion (
	id_valoracion NUMERIC (4) PRIMARY KEY,
	puntuacion NUMERIC (2,1),
	reseña VARCHAR (300),
	id_usuario NUMERIC (4),
	id_prod NUMERIC (4),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
	FOREIGN KEY (id_prod) REFERENCES producto (id_prod)
);

CREATE TABLE carrito (
	id_carrito NUMERIC (4) PRIMARY KEY,
	fecha_creacion_car CHAR(10),
	hora_creacion_car CHAR (5),
	estado CHAR (1),
	id_usuario NUMERIC (4),
	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE detalle_carrito (
	id_detalle_carrito NUMERIC (4) PRIMARY KEY,
	cantidad NUMERIC (5),
	id_carrito NUMERIC (4),
	id_prod NUMERIC (4),
	FOREIGN KEY (id_carrito) REFERENCES carrito (id_carrito),
	FOREIGN KEY (id_prod) REFERENCES producto (id_prod)
);

CREATE TABLE tipo_envio (
	id_tipo_envio NUMERIC (4) PRIMARY KEY,
	nombre_envio VARCHAR (20),
	costo_envio NUMERIC (4,2),
	descripcion_envio VARCHAR (100)
);

CREATE TABLE envio (
	id_envio NUMERIC (4) PRIMARY KEY,
	ciudad VARCHAR (30),
	pais VARCHAR (30),
	direccion_envio VARCHAR (60),
	destinatario VARCHAR (50),
	id_tipo_envio NUMERIC (4),
	FOREIGN KEY (id_tipo_envio) REFERENCES tipo_envio (id_tipo_envio)
);

CREATE TABLE pedido (
	id_pedido NUMERIC (4) PRIMARY KEY,
	fecha_creacion_ped CHAR (10),
	hora_creacion_ped CHAR (5),
	estado_pedido CHAR(1),
	id_envio NUMERIC (4),
	id_usuario NUMERIC (4),
	FOREIGN KEY (id_envio) REFERENCES envio (id_envio),
	FOREIGN KEY (id_usuario)  REFERENCES usuario (id_usuario)
);

CREATE TABLE pago (
	id_pago NUMERIC (4) PRIMARY KEY,
	marca_tarjeta VARCHAR (50),
	nro_tarjeta CHAR (10),
	cvv_tarjeta CHAR (3),
	fechaexp_tarjeta CHAR (10),
	saldo_tarjeta NUMERIC (10,2),
	id_pedido NUMERIC (4),
	FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

CREATE TABLE seguimiento_pedido (
	id_seguimiento_pedido NUMERIC (4) PRIMARY KEY,
	estado_seguimiento CHAR (1),
	fecha_cambio_estado CHAR (10),
	hora_cambio_estado CHAR (5),
	descripcion_seguimiento VARCHAR (30),
	id_pedido NUMERIC (4),
	FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

-- PRODUCTO 
SELECT c.nombre_categ FROM categoria c INNER JOIN producto p ON (c.id_categ = p.id_prod); -- JENS 
SELECT p.nombre_prod, d.porcentaje_desc, d.fecha_inicio_desc, d.fecha_fin_desc FROM producto p INNER JOIN descuento d ON (d.id_prod = p.id_prod); -- JENS
SELECT p.nombre_prod, p.descripcion_prod, p.precio_prod, p.precio_prod * d.porcentaje_desc AS precio_final, p.stock_prod, d.porcentaje_desc, v.nombre_ven, va.id_usuario, u.nombre_usuario, va.puntuacion, va.reseña FROM producto p
																																																																							INNER JOIN descuento d ON d.id_prod = p.id_prod
																																																																							INNER JOIN vendedor v ON v.id_ven = p.id_ven
																																																																							INNER JOIN valoracion va ON va.id_prod = p.id_prod
																																																																							INNER JOIN usuario u ON u.id_usuario = va.id_usuario; -- SANTIAGO
SELECT * FROM producto p WHERE (p.nombre_prod = ?); -- SANTIAGO
-- VENDEDOR
SELECT * FROM vendedor; -- SANTIAGO 
-- USUARIO
INSERT INTO usuario VALUES (?,?,?,?,?,?); -- SANTIAGO
SELECT u.nombre_usuario, pr.nombre_prod, pr.precio_prod, dc.cantidad, p.fecha_creacion_ped 'fecha_pedido', p.hora_creacion_ped 'hora_pedido', te.nombre_envio, sp.estado_seguimiento 'estado_seguimiento' FROM usuario u INNER JOIN carrito c ON (u.id_usuario = c.id_usuario) INNER JOIN detalle_carrito dc ON (dc.id_carrito = dc.id_carrito) INNER JOIN producto pr ON (dc.id_prod = pr.id_prod) INNER JOIN pedido p ON (u.id_usuario = p.id_usuario ) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido) INNER JOIN envio en ON (p.id_envio = en.id_envio) INNER JOIN tipo_envio te ON (en.id_tipo_envio = te.id_tipo_envio) INNER JOIN seguimiento_pedido sp ON (sp.id_pedido = p.id_pedido) WHERE (u.nombre_usuario = ?); -- RODRIGO
SELECT u.nombre_usuario, pa.saldo_tarjeta FROM usuario u INNER JOIN pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido);	-- RODRIGO 
-- CARRITO
SELECT p.nombre_prod, p.descripcion_prod, p.precio_prod, p.precio_prod*d.procentaje_desc AS precio_final, p.precio_prod - p.precio_prod*d.procentaje_desc AS precio_final,     FROM usuario u INNER JOIN carrito c ON (u.id_usuario = c.id_usuario)
							 INNER JOIN detalle_carrito dc ON (dc.id_carrito = c.id_carrito)
							 INNER JOIN producto p ON (p.id_prod = dc.id_prod); -- falta completar -- SANTIAGO
-- TIPO_ENVIO
SELECT * from tipo_envio te ON (e.id_envio = te.id_tipo_envio); -- SANTIAGO
-- PEDIDO
INSERT INTO envio VALUES (?,?,?,?,?,?); -- EDWIN 
SELECT u.nombre_usuario, p.fecha_creacion_ped, p.hora_creacion_ped, p.estado_pedido, e.pais, e.ciudad, e.direccion_envio, e.destinatario, te.nombre_envio, te.descripcion_envio FROM usuario u inner join pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN envio e ON (e.id_envio = p.id_envio ) INNER JOIN tipo_envio te ON (te.id_tipo_envio = e.id_tipo_envio) WHERE (u.nombre_usuario = ?); -- EDWIN 
-- PAGO
INSERT INTO pago VALUES (?,?,?,?,?,?,?); -- EDWIN
SELECT u.nombre_usuario, pa.marca_tarjeta, pa.nro_tarjeta, pa.cvv_tarjeta, pa.fechaexp_tarjeta FROM usuario u inner join pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido ) WHERE (u.nombre_usuario = ?); -- EDWIN
-- SEGUIMIENTO
SELECT u.nombre_usuario, pro.nombre_prod, dc.cantidad, p.estado_pedido, sp.estado_seguimiento, sp.fecha_cambio_estado, sp.hora_cambio_estado, sp.descripcion_seguimiento FROM usuario u inner join pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN carrito c ON (u.id_usuario = c.id_usuario) INNER JOIN detalle_carrito dc ON (dc.id_carrito = c.id_carrito)INNER JOIN producto pro ON (pro.id_prod = dc.id_prod) INNER JOIN seguimiento_pedido sp ON (sp.id_pedido = p.id_pedido ) WHERE (u.nombre_usuario = ?); -- EDWIN

