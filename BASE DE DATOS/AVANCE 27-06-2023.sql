

<<<<<<< HEAD


=======
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
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (5,'1','28/05/2023','19:54','el producto ya esta en la tienda, el comprador aun no lo recoge',5);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (6,'1','29/05/2023','20:10','el prodructo aun esta en la tienda, el coprador aun no lo recoge',6);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (7,'0','02/06/2023','13:23','el producto ya se entrego',7);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (8,'1','05/06/2023','14:30','el producto esta en camino, ya se encuentra en su ciudad',8);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (9,'0','01/06/2023','15:36','el producto ya se entrego',9);
INSERT INTO seguimiento_pedido (id_seguimiento_pedido, estado_seguimiento, fecha_cambio_estado, hora_cambio_estado, descripcion_seguimiento, id_pedido) VALUES (10,'1','06/06/2023','15:30','el producto esta en camino, ya se encuentra en su país',10);
-- datos de tabla de pago
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
>>>>>>> 5dc2421dd64480465b7b8730d85c40df7f97567f

