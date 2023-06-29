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



/*

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
*/

INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion, nroventas) VALUES(0001,'Hanna','Vendedora de consolas, disponible 8 horas','av. Elmer Faucett',994389483,'hanna@gmail.com',7,1500);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion, nroventas) VALUES(0002,'Beto','Vendedor de refrigeradoras, disponible 5 horas','Av. Aviación',972747923,'beto@hotmail.com',4,1200);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion, nroventas) VALUES(0003,'Samuel','Vendedor de audífonos, disponible 15 horas',9750264504,'samuel@gmail.com','Av. La Marina',9,2000);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion, nroventas) VALUES(0004,'Alejandra','Vendedora de celulares, disponible 12 horas',965025857,'ale.32332@gmail.com','Av. Elmer Faucett',5,1300);
INSERT INTO vendedor(id_ven, nombre_ven, descripcion_ven, direccion_ven, telefono_ven, email_ven, valoracion, nroventas) VALUES(0005,'Ernesto','Vendedor de autos, disponible 18 horas',983073458,'nest7748@outlook.com','Av. Aviación',8,2500);





/*
CREATE TABLE categoria (
	id_categ NUMERIC (4) PRIMARY KEY,
	nombre_categ VARCHAR (30),
	descripcion_categ VARCHAR (100)
);
*/

#INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0001,'Electrodomésticos', 'Aparatos electrónico que ayudarán para las funciones en el hogar');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0001,'Refrigeradoras','Puedes almacenar tus alimentos');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0002,'Celulares','Los mejores celulares disponibles para el entretenimiento');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0003,'Autos','Las mejores marcas de autos ya están disponibles');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0004,'Audifonos','Escucha música con las diferentes marcas de audífonos disponibles');
INSERT INTO categoria(id_categ, nombre_categ, descripcion_categ) VALUES (0005,'Consolas','Las mejores consolas ya están aquí');






/*
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
*/

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


INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0013,'Suzuki Alto 800', 'ABS PS',39500 , 100 ,0005, 0003);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0014,'Changan Auto New Van', '1.2L 8 Asientos',38500 , 95 ,0005, 0003);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0015,'Changan Auto New Alsvin', 'Comfortable 1.4 MT',42312 , 92 ,0005, 0003);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0016,'Renault New Kwid', 'ZEN 1.0 MT',46160 , 110 ,0005, 0003);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0017,'Suzuki All New Celerio', 'All New Celerio GA 1.0 MT 4X2',49335 , 90 ,0005, 0003);
INSERT INTO producto(id_prod, nombre_prod, descripcion_prod, precio_prod, stock_prod, id_ven, id_categ) VALUES (0018,'JAC JS2','1.5 MT COMFORT',51300 , 85 ,0005, 0003);

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

/*  'Refrigeradoras','Celulares','Autos','Audifonos','Consolas'  */

/*
CREATE TABLE descuento (
	id_desc NUMERIC (4) PRIMARY KEY,
	porcentaje_desc NUMERIC (6,5),
	fecha_inicio_desc CHAR (10),
	fecha_fin_desc CHAR (10),
	id_prod NUMERIC (4),
	FOREIGN KEY (id_prod) REFERENCES producto (id_prod)
);
*/

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




#Vendedor


#Descuento

#Categoría

#Producto