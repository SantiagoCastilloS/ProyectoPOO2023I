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
