CREATE DATABASE app_data;

CREATE TABLE usuario(
	id_us CHAR(10),
	nombre_us VARCHAR(30),
	apellidos_us VARCHAR (30),
	direccion_us VARCHAR(30),
	ciudad_us VARCHAR(50),
	pais_us VARCHAR (50),
	telefono_us VARCHAR(20),
	email_us VARCHAR (50),
	contraseña_us VARCHAR (50),
	nro_pedidos_us INT,
	fondos_us NUMERIC(10,2),
	PRIMARY KEY (id_us)
);

CREATE TABLE vendedor (
	id_ven CHAR(10),
	nombre_ven VARCHAR(20),
	descripicion_ven VARCHAR (100),
	direccion_ven VARCHAR(30),
	telefono_ven VARCHAR(20),
	sitioweb_ven VARCHAR(20),
	valoraciones_ven NUMERIC(5),
	PRIMARY KEY (id_ven)
);

CREATE TABLE producto(
	id_producto CHAR(10),
	nombre VARCHAR(30),
	informacion VARCHAR(500),
	precio NUMERIC(6,2),
	categoria VARCHAR(20),
	subcategoria VARCHAR(20),
	descuento NUMERIC(4,2),
	garantia BOOLEAN,
	calidad FLOAT(1),
	costo_de_envio NUMERIC(6,2),
	stock INT(10),
	fecha_de_produccion VARCHAR(10),
	metodo_de_compra VARCHAR(40),
	us CHAR(10),
	ven CHAR(10),
	PRIMARY KEY (id_producto),
	FOREIGN KEY (us) REFERENCES usuario (id_us),
	FOREIGN KEY (ven) REFERENCES vendedor (id_ven)
);

CREATE TABLE tarjeta_credito(
 	nro_tarjeta VARCHAR(20),
 	cvv NUMERIC(5),
 	fecha_expiracion VARCHAR(40),
 	propietario VARCHAR(50),
 	fondos NUMERIC(10,2),
 	marca VARCHAR (15),
 	userr CHAR(10),
 	PRIMARY KEY (nro_tarjeta),
 	FOREIGN KEY (userr) REFERENCES usuario (id_us)
 );
DROP TABLE tarjeta_credito;
INSERT INTO usuario VALUES ('U412489330','MANUEL','FERNANDEZ','AV.10 DE JUNIO 1010','LIMA','PERU','51-913-869-307','nombre@gmail.com','ff2ndaefo323nf',3,523.50);
INSERT INTO usuario VALUES ('U510385019','CARL','SMITH','123 MAIN STREET,','NUEVA YORK','ESTADOS UNIDOS','9-725-557-890','random123@gmail.com','nvsda8ga79h3',5,200.00);
INSERT INTO usuario VALUES ('U853234235','ABELARDO','DEL RIO','CARRERA 789 # 10-23','MEDELLIN','COLOMBIA','573-047-772-222','email4567@gmail.com','B45fFQnj^q',1,100.50);
INSERT INTO usuario VALUES ('U023235333','ELIJAH','BROW','321 MAPLE STREET','CALIFORNIA','ESTADOS UNIDOS','2-125-556-789','username321@gmail.com','FNASD.F3$',3,467.80);
INSERT INTO usuario VALUES ('U784394234','CARLOS','FLORES','CALLE PRINCIPAL 123','MADRID','ESPAÑA','34600111-777','randomuser456@gmail.com','{4Ffasx23*3',3,0);

INSERT INTO vendedor VALUES ('V102234515','RIPLEY','TEXT...','Jirón de la Unión 704, Lima','01-512-3333','www.ripley.com.pe',4.5);
INSERT INTO vendedor VALUES ('V009562222','RADIOSHAK','TEXT...','Angamos Este 1803, Surquillo,','01-983-3423','www.coolbox.pe',4.0);
INSERT INTO vendedor VALUES ('V152356777','ELEKTRA','TEXT...','C. A 149, Callao 07036','51-989-673-930','www.elektra.mx',3.2);
INSERT INTO vendedor VALUES ('V059432345','SAGA FALABELLA','TEXT...','Jirón de la Unión 517, Lima','01-611-5959','www.falabella.com.pe',4.5);

-- Tecnologia Celulares --

INSERT INTO producto VALUES ('A109351084','Android A10','Teléfonos celulares desbloqueados por GSM, Blackview BV4900 Rugged Smartphone, 4G Android 10 Android, 5580 mAh 5.7 pulgadas HD+ teléfono inteligente desbloqueado, 3 GB + 32 GB resistente al agua, NFC Face ID resistente teléfonos desbloqueados',129.99,'tecnologia','telefonia',0,TRUE,4.5,25,1000,'1/3/2019','Compra directa','U023235333','V009562222');
INSERT INTO producto VALUES ('A109834617','Android A10','Teléfonos celulares desbloqueados por GSM, Blackview BV4900 Rugged Smartphone, 4G Android 10 Android, 5580 mAh 5.7 pulgadas HD+ teléfono inteligente desbloqueado, 3 GB + 32 GB resistente al agua, NFC Face ID resistente teléfonos desbloqueados',65.00,'tecnologia','telefonia',0,FALSE,4.0,10,10,'1/6/2020','Subasta','U784394234','V009562222');
INSERT INTO producto VALUES ('A129848517','Android A12','Teléfono celular desbloqueado, pantalla amplia de 6.82 pulgadas, batería de 5000 mAh, teléfono inteligente Android 12, cámara trasera de 50 MP + cámara frontal de 13 MP, 6 GB de RAM + 64 GB de ROM, versión estadounidense, altavoz dual, teléfono LTE 4G, niebla nocturna',139.99,'tecnologia','telefonia',0,TRUE,4.6,25,1500,'12/1/2022','Compra inmediata','U023235333','V009562222');

-- Tecnologia Television --

INSERT INTO producto VALUES ('D40FJ09585','Smart TV D40F-J09','VIZIO - Smart TV Full HD 1080p de 40 pulgadas con Apple AirPlay y Chromecast integrados, compatibilidad con Alexa, D40f-J09, modelo 2022',229.99,'tecnologia','televison',0,TRUE,4.8,30,1000,'15/4/2022','Programas de membresía','U412489330','V152356777');
INSERT INTO producto VALUES ('D40FJ09825','Smart TV D40F-J09','VIZIO - Smart TV Full HD 1080p de 40 pulgadas con Apple AirPlay y Chromecast integrados, compatibilidad con Alexa, D40f-J09, modelo 2022',229.99,'tecnologia','televison',27,FALSE,4.8,0,1000,'15/4/2022','Compra a través de vendedores externos','U784394234','V152356777');

-- Ropa Camisa --

INSERT INTO producto VALUES ('CLCF153492','Camisa de lino','COOFANDY - Camisas de lino y algodón con cuello Henley, de manga larga, estilo hippie informal, camisas de playa',29.99,'ropa','camisa',0,TRUE,4.1,2,800,'20/1/2018','Compra inmediata','U510385019','V059432345');
INSERT INTO producto VALUES ('CLCF185349','Camisa casual','COOFANDY Camisa casual Henley para hombre, cuello de banda, manga corta, camisa hippie para verano y playa',28.99,'ropa','camisa',0,TRUE,4.3,2,700,'23/5/2017','Compra directa','U412489330','V059432345');

-- Ropa Pantalon --

INSERT INTO producto VALUES ('HSPM529741','Pantalon de mezclilla','HUNGSON Pantalones de mezclilla ajustados para hombre, elásticos, rasgados, rasgados, con rayas laterales',39.99,'ropa','pantalon',10,TRUE,4.2,2,800,'10/8/2018','Compra inmediata','U853234235','V059432345');
INSERT INTO producto VALUES ('HSPM411203','Pantalon de mezclilla','HUNGSON Pantalones de mezclilla ajustados y elásticos para hombre, ajuste recto',33.99,'ropa','pantalon',0,TRUE,4.0,2,900,'15/9/2018','Compra directa','U510385019','V059432345');
INSERT INTO producto VALUES ('HSJ5639480','Jeans','HUNGSON Jeans ajustados para hombre, pantalones de mezclilla elásticos ajustados para hombre, corte recto',49.99,'ropa','pantalon',28,TRUE,4.2,2,700,'10/11/2018','Compra inmediata','U412489330','V102234515');

INSERT INTO tarjeta_credito VALUES ('4301996412221829',462,'06/2026','FERNANDEZ QUIÑONES, MANUEL',8000.43,'VISA','U412489330');
INSERT INTO tarjeta_credito VALUES ('4160101505745830',750,'07/2024','SMITH O´CONNOR, CARL',3251.50,'VISA','U510385019');
INSERT INTO tarjeta_credito VALUES ('6011377674154345',615,'04/2027','DEL RIO SILVA, ABELARDO',4125.10,'DISCOVER','U853234235');
INSERT INTO tarjeta_credito VALUES ('5476458286066349',194,'06/2024','BROW MILLER, ELIJAH',1980.40,'MASTERCARD','U023235333');
INSERT INTO tarjeta_credito VALUES ('3551004766004369',588,'03/2025','FLORES DE ALBORNOZ, CARLOS',4503.10,'JCB','U784394234');
