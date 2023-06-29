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
	descripcion_envio VARCHAR (300)
);
ALTER TABLE tipo_envio MODIFY COLUMN descripcion_envio VARCHAR (300);
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
ALTER TABLE seguimiento_pedido
MODIFY COLUMN descripcion_seguimiento VARCHAR(100);
-- PRODUCTO 
SELECT c.nombre_categ FROM categoria c INNER JOIN producto p ON (c.id_categ = p.id_prod); -- JENS 
SELECT p.nombre_prod, d.porcentaje_desc, d.fecha_inicio_desc, d.fecha_fin_desc FROM producto p INNER JOIN descuento d ON (d.id_prod = p.id_prod); -- JENS
SELECT p.id_prod, p.nombre_prod, p.descripcion_prod, p.stock_prod, p.precio_prod, d.porcentaje_desc, p.precio_prod * d.porcentaje_desc AS precio_final, v.nombre_ven FROM producto p INNER JOIN descuento d ON d.id_prod = p.id_prod INNER JOIN vendedor v ON v.id_ven = p.id_ven; -- SANTIAGO (hecho)
SELECT * FROM producto p WHERE (p.nombre_prod = ?); -- SANTIAGO
-- VENDEDOR
SELECT * FROM vendedor; -- SANTIAGO ()
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
-- VALORACION
INSERT INTO valoracion VALUES (?,?,?,?,?);


-- INSERCION

-- insertacion de datos de tablas
-- datos de tabla usuario
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (1,'Jose Rodriguez','joserodriguez1996@gmail.com','1996JR2705','51264857159','2645815931');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (2,'Maria Fernandez','mariafernandez001@gmail.com','mariaF1988','52254831597','2541064809');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (3,'Camilo Huamani','camilohuamani007@gmail.com','CH007DFP12','51542648210','5241036970');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (4,'César Pinedo','cesarp96690224@gmail.com','ces1996feb','51258945619','5201459703');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (5,'Adrián Perez','Adrianitoperez@gmail.com','perez2000M','52245978420','2015406789');
-- datos de tabla tipo_envio
INSERT INTO tipo_envio (id_tipo_envio, nombre_envio, costo_envio, descripcion_envio) VALUES (1,'Compra directa',15.00,'Solo agrega el producto al carrito y continua el proceso de pago. El pago puede realizarse con tarjeta de crédito u otros métodos de pago aceptados por el sitio.');
INSERT INTO tipo_envio (id_tipo_envio, nombre_envio, costo_envio, descripcion_envio) VALUES (2,'Compra inmediata',20.00,'El producto es enviado de forma inmediata y rapida solo al vendedor y realiza el proceso de pago');
INSERT INTO tipo_envio (id_tipo_envio, nombre_envio, costo_envio, descripcion_envio) VALUES (3,'Compra presencial',5.00,'Realiza el proceso de pago del producto y selecciona una tienda asociada a nuestra pagina con el producto disponible, se le dara un boleto virtual con el cual adquiran el producto');
INSERT INTO tipo_envio (id_tipo_envio, nombre_envio, costo_envio, descripcion_envio) VALUES (4,'Usuario miembro',0.00,'Si usted es un usuario con menbresia o recurrente tiene la opción de no pagar el envio');
-- datos de tabla envio
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (1,'Lima','Peru','casa de Jose','Jose Rodriguez',1);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (2,'Lima','Peru','casa de Jose','Jose Rodriguez',2);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (3,'Ciudad de Mexico','Mexico','casa de Maria','Maria Fernandez',4);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (4,'Ciudad de Mexico','Mexico','casa de Maria','Maria Fernandez',1);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (5,'Lima','Peru','tienda de ropa saga farabella','Camilo Huamani',3);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (6,'Lima','Peru','tienda de electrodomesticos hiraoka','Camilo Huamani',3);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (7,'Piura','Peru','casa de Cesar','César Pinedo',4);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (8,'Piura','Peru','casa de Cesar','César Pinedo',1);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (9,'Guadalajara','Mexico','casa de Adrian','Adrián Perez',2);
INSERT INTO envio (id_envio, ciudad, pais, direccion_envio, destinatario, id_tipo_envio) VALUES (10,'Guadalajara','Mexico','casa de Adrian','Adrián Perez',4);
-- datos de tabla pedido
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (1,'24/05/2023','10:34','1',1,1);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (2,'24/05/2023','10:43','1',2,1);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (3,'27/05/2023','13:45','0',3,2);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (4,'01/06/2023','16:27','1',4,2);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (5,'28/05/2023','19:54','0',5,3);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (6,'29/05/2023','20:10','0',6,3);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (7,'27/05/2023','10:30','1',7,4);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (8,'28/05/2023','14:21','1',8,4);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (9,'27/05/2023','13:54','0',9,5);
INSERT INTO pedido (id_pedido, fecha_creacion_ped, hora_creacion_ped, estado_pedido, id_envio, id_usuario) VALUES (10,'29/05/2023','15:34','1',10,5);
-- datos de tabla seguimiento_pedido
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (1,'0','26/05/2023','14:34','el producto ya se entrego',1);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (2,'0','24/05/2023','22:43','el producto ya se entrego',2);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (3,'0','01/06/2023','19:54','el producto ya se entrego',3);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (4,'1','04/06/2023','20:00','el producto esta en camino, ya se encuentra en su ciudad',4);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (5,'1','28/05/2023','19:54','el producto ya esta en la tienda, el comprador aun no lo recoje',5);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (6,'1','29/05/2023','20:10','el prodructo aun esta en la tienda, el coprador aun no lo recoje',6);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (7,'0','02/06/2023','13:23','el producto ya se entrego',7);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (8,'1','05/06/2023','14:30','el producto esta en camino, ya se encuentra en su ciudad',8);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (9,'0','01/06/2023','15:36','el producto ya se entrego',9);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (10,'1','06/06/2023','15:30','el producto esta en camino, ya se encuentra en su país',10);


