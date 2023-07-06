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
	valoracion_ven NUMERIC (2,1),
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
	descripcion_seguimiento VARCHAR (100),
	id_pedido NUMERIC (4),
	FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

-- PRODUCTO 
SELECT c.nombre_categ FROM categoria c INNER JOIN producto p ON (c.id_categ = p.id_prod); -- JENS
SELECT p.nombre_prod, d.porcentaje_desc, d.fecha_inicio_desc, d.fecha_fin_desc FROM producto p INNER JOIN descuento d ON (d.id_prod = p.id_prod); -- JENS
SELECT p.id_prod, p.nombre_prod, p.descripcion_prod, p.stock_prod, p.precio_prod, d.porcentaje_desc, p.precio_prod - p.precio_prod * d.porcentaje_desc AS precio_final, v.nombre_ven FROM producto p INNER JOIN descuento d ON d.id_prod = p.id_prod INNER JOIN vendedor v ON v.id_ven = p.id_ven; -- SANTIAGO (hecho)
SELECT * FROM producto p WHERE (p.nombre_prod = ?); -- SANTIAGO
-- VENDEDOR
SELECT * FROM vendedor; -- SANTIAGO (Hecho)
-- USUARIO
INSERT INTO usuario VALUES (?,?,?,?,?,?); -- SANTIAGO
SELECT u.nombre_usuario, pr.nombre_prod, pr.precio_prod, dc.cantidad, p.fecha_creacion_ped 'fecha_pedido', p.hora_creacion_ped 'hora_pedido', te.nombre_envio, sp.estado_seguimiento 'estado_seguimiento' FROM usuario u INNER JOIN carrito c ON (u.id_usuario = c.id_usuario) INNER JOIN detalle_carrito dc ON (dc.id_carrito = dc.id_carrito) INNER JOIN producto pr ON (dc.id_prod = pr.id_prod) INNER JOIN pedido p ON (u.id_usuario = p.id_usuario ) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido) INNER JOIN envio en ON (p.id_envio = en.id_envio) INNER JOIN tipo_envio te ON (en.id_tipo_envio = te.id_tipo_envio) INNER JOIN seguimiento_pedido sp ON (sp.id_pedido = p.id_pedido) WHERE (u.nombre_usuario = ?); -- RODRIGO
SELECT u.nombre_usuario, pa.saldo_tarjeta FROM usuario u INNER JOIN pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido);	-- RODRIGO 
-- CARRITO
SELECT p.nombre_prod, p.descripcion_prod, p.precio_prod, p.precio_prod*d.procentaje_desc AS precio_final, p.precio_prod - p.precio_prod*d.procentaje_desc AS precio_final,     FROM usuario u INNER JOIN carrito c ON (u.id_usuario = c.id_usuario) INNER JOIN detalle_carrito dc ON (dc.id_carrito = c.id_carrito) INNER JOIN producto p ON (p.id_prod = dc.id_prod); -- falta completar -- SANTIAGO
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
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (6,'Ramiro Camilo','ramiroCam234@gmail.com','camilo993K','5259184814','6754329970');
INSERT INTO usuario (id_usuario, nombre_usuario, email_usuario, contraseña_usuario, telefono_usuario, dni_usuario) VALUES (7,'Valeria Gimenez','VALgimenez1@gmail.com','val9912F','5295128884','9326654710');
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
-- pago
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (1,'American Express','1542534891','322','01/02/2025',1000.00,1);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (2,'American Express','1542534891','322','01/02/2025',1000.00,2);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (3,'Mastercard','2015486031','644','01/08/2026',1200.00,3);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (4,'Mastercard','2015486031','644','01/08/2026',1200.00,4);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (5,'Discover','2015203649','159','01/11/2024',900.00,5);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (6,'Discover','2015203649','159','01/11/2024',900.00,6);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (7,'Visa','1542698730','655','01/12/2023',900.00,7);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (8,'Visa','1542698730','655','01/12/2023',900.00,8);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (9,'American Express','2254896314','122','01/03/2028',1300.00,9);
INSERT INTO pago (id_pago, marca_tarjeta, nro_tarjeta, cvv_tarjeta, fechaexp_tarjeta, saldo_tarjeta, id_pedido) VALUES (10,'American Express','2254896314','122','01/03/2028',1300.00,10);
-- vendedor
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(0001,'GameConnect','Venta de consolas, disponible 8 horas','Av. Elmer Faucett',994389483,'hanna@gmail.com',7,1500);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(0002,'FreshFridge','Venta de refrigeradoras, disponible 5 horas','Av. Aviación',972747923,'beto@hotmail.com',4,1200);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(0003,'AudioVerse','Venta de audífonos, disponible 15 horas','Av. La Marina',9750264504,'samuel@gmail.com',9,2000);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(0004,'MobileZone','Venta de celulares, disponible 12 horas','Av. Elmer Faucett',965025857,'ale.32332@gmail.com',5,1300);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion_ven, nroventas) VALUES(0005,'TechHaven','Venta de harware, disponible 18 horas','Av. Aviación',983073458,'nest7748@outlook.com',8,2500);
-- categoria
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0001,'Electrodomésticos', 'Aparatos electrónico que ayudarán para las funciones en el hogar');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0002,'Refrigeradoras','Puedes almacenar tus alimentos');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0003,'Celulares','Los mejores celulares disponibles para el entretenimiento');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0004,'Autos','Las mejores marcas de autos ya están disponibles');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0005,'Audifonos','Escucha música con las diferentes marcas de audífonos disponibles');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0006,'Consolas','Las mejores consolas ya están aquí');
-- producto
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0001,'Samsung','Samsung 361L No Frost Rt35K5930S8 Plata',1950,200, 0002, 0001);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0002,'LG','LG 312L No Frost GT32WPPDC Plateado', 1900,300, 0002, 0001);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0003,'Electrolux','Refrigerador Side by Side Electrolux', 3000,200, 0002, 0001);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0004,'MABE','Refrigerador 250 lt RMA255FYPG', 1399,350, 0002, 0001);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0005,'HISENSE','Refrigeradora Hisense 418L Top Mount', 1600,250, 0002, 0001);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0006,'Samsung','Refrigeradora 361Lt Twin Cooling Silver', 1900,200, 0002, 0001);

INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0007,'Xiaomi','POCO X5 Pro 5G Black 8GB256GB', 1600, 500 ,0004, 0002);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0008,'Samsung','Galaxy A54 128GB 6GB 5G', 1400, 550 ,0004, 0002);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0009,'Realme','Realme C55 256GB 8GB Ram 64Mpx Negro', 1000, 600 ,0004, 0002); #-25%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0010,'Apple','Apple iPhone 12 - 64GB - Negro', 4900, 400 ,0004, 0002); #-47%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0011,'Motorola','Motorola Moto E30 32GB 2GB GRIS', 5900, 550 ,0004, 0002); #-27%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0012,'Honor','Smartphone HONOR MAGIC 5 LITE 5G 6+128GB', 1500, 750 ,0004, 0002); #-13%

INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0013,'Tarjeta Grafica', 'Tarjeta de video ASUS NVIDIA GeForce RTX 3080 Ti, 12GB GDDR6X, PCI-E',14700 , 50 ,5, 0004);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0014,'Laptop', 'Laptop Acer Aspire 3 AMD Ryzen 5 Serie 7520U 8GB RAM 256GB SSD 15.6"',2600 , 100 ,5, 0004);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0015,'Monitor', 'Monitor TEROS 21.5 75hz IPS FULL HD 5MS HDMI VGA Monitor GAMING GAMER',699 , 92 ,0005, 0004);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0016,'Teclado mecanico', 'Teclado Razer Blackwidow V3 Tenkeyless Mechanical español',475 , 120 ,0005, 0004);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0017,'Impresora', 'IMPRESORA MULTIFUNCIONAL EPSON ECOTANK L5590 USBLANWI-FI',1999 , 70 ,0005, 0004);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0018,'Memoria USB','MEMORIA USB 3.2 KINGSTON EXODIA 128 GB NEGRO',90 , 120 ,0005, 0004);

INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0019,'SKULLCANDY','Audífonos Inalámbricos Skullcandy Bluetooth',559.00 , 175 ,0003, 0004);  #0%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0020,'SONY','AUDIFONOS C NOISE CANCELLING', 1499.00, 150 ,0003, 0004);  #-40%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0021,'XIAOMI','Audifonos Xiaomi Redmi Buds 3 Youth Lite Edition',129.90, 175 ,0003, 0004);  #-42%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0022,'CC GROUP','Mini Audífono Bluetooth Inalámbrico S530 - Blanco', 19.99 , 130 ,0003, 0004);  #-50%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0023,'GENERICO','Audifonos Inalambricos Bluetooth Handsfree',99 , 300 ,0003, 0004);  #-51%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0024,'APPLE','AirPods Pro (2da generación)', 1399, 115 ,0003, 0004);  #-21%

INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0025,'Playstation 5','Consola Playstation 5 con lector de discos Ps5',2700, 120 ,0001, 0005);  #3%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0026,'Xbox','Nueva consola Xbox Series S 512 Gb',1430, 200 ,0001, 0005);  #9%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0027,'Playstation 5','Mando Playstation 5 Dualsense Midnight Black',349.90, 250 ,0001, 0005);  #25%
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0028,'Nintendo Switch','Consola Nintendo Switch Oled The Legend Of Zelda: Totk',1759.00, 150 ,0001, 0005);  #20%
-- descuento
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0001,0.15,'04-08-2023','20-08-2023',0001);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0002,0.10,'06-08-2023','30-08-2023',0002);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0003,0.15,'02-08-2023','15-08-2023',0003);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0004,0.17,'07-08-2023','30-08-2023',0004);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0005,0.20,'01-08-2023','15-09-2023',0005);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0006,0.15,'07-08-2023','17-09-2023',0006);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0007,0.12,'04-08-2023','20-08-2023',0007);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0008,0.10,'09-08-2023','30-08-2023',0008);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0009,0.19,'11-08-2023','17-08-2023',0009);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0010,0.17,'04-08-2023','29-08-2023',0010);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0011,0.20,'03-08-2023','15-09-2023',0011);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0012,0.15,'06-08-2023','17-09-2023',0012);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0013,0.12,'04-08-2023','17-08-2023',0013);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0014,0.25,'05-08-2023','28-08-2023',0014);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0015,0.15,'02-08-2023','15-08-2023',0015);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0016,0.17,'07-08-2023','30-08-2023',0016);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0017,0.20,'14-08-2023','15-09-2023',0017);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0018,0.12,'13-08-2023','18-09-2023',0018);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0019,0.15,'04-08-2023','20-08-2023',0019);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0020,0.14,'06-08-2023','30-08-2023',0020);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0021,0.25,'02-08-2023','15-08-2023',0021);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0022,0.17,'05-08-2023','17-08-2023',0022);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0023,0.20,'01-08-2023','12-09-2023',0023);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0024,0.15,'09-08-2023','24-09-2023',0024);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0025,0.15,'04-08-2023','20-08-2023',0025);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0026,0.10,'06-08-2023','30-08-2023',0026);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0027,0.15,'13-08-2023','19-08-2023',0027);
INSERT INTO descuento(id_desc, porcentaje_desc, fecha_inicio_desc, fecha_fin_desc, id_prod) VALUES (0028,0.17,'07-08-2023','25-08-2023',0028);
-- valoracion
INSERT INTO valoracion VALUES (1,4,'"Diseño elegante, se adapta bien a la cocina"',5,1);
INSERT INTO valoracion VALUES (2,4,'"Buen espacio para almacenamiento de alimentos"',4,2);
INSERT INTO valoracion VALUES (3,3,'"Enfriamiento aceptable, pero no muy uniforme"',3,3);
INSERT INTO valoracion VALUES (4,4.5,'"Consumo energético moderado"',5,4);
INSERT INTO valoracion VALUES (5,5,'"Organización interna conveniente"',6,5);
INSERT INTO valoracion VALUES (6,5,'"Buena distribución de temperaturas"',4,6);
INSERT INTO valoracion VALUES (7,4.5,'"Increíble calidad de pantalla, colores vibrantes"',6,7);
INSERT INTO valoracion VALUES (8,4,'"Seguridad sólida, protección de datos"',3,8);
INSERT INTO valoracion VALUES (9,3.5,'"Interfaz decente, aunque un poco confusa"',2,9);
INSERT INTO valoracion VALUES (10,3.5 ,'"Relación calidad-precio justa, nada excepcional"',2,10);
INSERT INTO valoracion VALUES (11,4,'"Cámara de alta resolución"',1,11);
INSERT INTO valoracion VALUES (12,4,'"Buena duración de la batería"',4,12);
--
INSERT INTO valoracion VALUES (13,5,'"Potente rendimiento, juegos fluidos"',5,13);
INSERT INTO valoracion VALUES (14,5,'"Excelente rendimiento, rápida"',6,14);
INSERT INTO valoracion VALUES (15,4,'"Imágenes nítidas, colores vivos"',7,15);
INSERT INTO valoracion VALUES (16,5,'"Rápida velocidad de escritura"',6,16);
INSERT INTO valoracion VALUES (17,4.5,'"Buena velocidad de impresión"',1,17);
INSERT INTO valoracion VALUES (18,5,'"Gran capacidad de almacenamiento"',4,18);
--
INSERT INTO valoracion VALUES (19,3,'"Barato, pero de cuestionable calidad"',5,19);
INSERT INTO valoracion VALUES (20,3.5,'"Cómodo y ajustable, pero fragil"',6,20);
INSERT INTO valoracion VALUES (21,4,'"Buena relación calidad-precio"',1,21);
INSERT INTO valoracion VALUES (22,4,'"Sonido claro y potente"',3,22);
INSERT INTO valoracion VALUES (23,3.5,'"Buena calidad de sonido, llego muy tarde"',1,23);
INSERT INTO valoracion VALUES (24,4,'"Cámara de alta resolución"',1,24);
INSERT INTO valoracion VALUES (25,3,'"Gráficos impresionantes, detalle asombroso"',6,25);
INSERT INTO valoracion VALUES (26,4,'"Excelente experiencia de juego multijugador"',1,26);
INSERT INTO valoracion VALUES (27,4,'"Experiencia de juego inmersiva"',4,27);
INSERT INTO valoracion VALUES (28,5,'"Portátil y versátil, perfecta para viajes"',6,28);
INSERT INTO valoracion VALUES (29,4,'"Buen soporte de software y controladores actualizados"',4,13);
INSERT INTO valoracion VALUES (30,5,'"Batería de larga duración, puedo trabajar todo el día sin problemas"',7,14);
-- carrito
INSERT INTO carrito VALUES (1,'24/05/2023','10:30','1',1);
INSERT INTO carrito VALUES (2,'24/05/2023','10:40','1',1);
INSERT INTO carrito VALUES (3,'26/05/2023','21:30','0',2);
INSERT INTO carrito VALUES (4,'01/06/2023','15:30','1',2);
INSERT INTO carrito VALUES (5,'28/05/2023','19:50','0',3);
INSERT INTO carrito VALUES (6,'29/05/2023','20:00','0',3);
INSERT INTO carrito VALUES (7,'26/05/2023','21:50','1',4);
INSERT INTO carrito VALUES (8,'28/05/2023','09:30','1',4);
INSERT INTO carrito VALUES (9,'27/05/2023','13:00','0',5);
INSERT INTO carrito VALUES (10,'29/05/2023','15:30','1',5);
-- detalle carrito
INSERT INTO detalle_carrito VALUES (1,1,1,);
INSERT INTO detalle_carrito VALUES (2,1,2,);
INSERT INTO detalle_carrito VALUES (3,1,4,);
INSERT INTO detalle_carrito VALUES (4,1,7,);
INSERT INTO detalle_carrito VALUES (5,1,8,);
INSERT INTO detalle_carrito VALUES (6,1,10,);
