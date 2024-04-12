USE db_dmsystems;

INSERT INTO tb_niveles_usuarios(tipo_usuario) VALUES('Administrador'),
('Dependiente');

SELECT * FROM tb_niveles_usuarios;

INSERT INTO tb_usuarios(usuario, clave, correo, nombre, DUI, telefono, id_nivel_usuario) 
VALUES('JuanJ', '123456', 'JuanJ@gmail.com', 'Juan José', '12345678-9', '77655984', 1),
('JuliaM', '123456', 'JuliaM@gmail.com', 'Julia María', '12345679-8', '77123456', 1),
('JoseM', '123456', 'JoseM@gmail.com', 'José Miguel', '09876543-1', '76893425', 2),
('PedroE', '123456', 'PedroE@gmail.com', 'Pedro Emanuel', '74185296-3', '71728554', 2),
('MirnaE', '123456', 'MirnaE@gmail.com', 'Mirna Esmeralda', '96385274-1', '75533991', 2),
('GustavoE', '123456', 'GustavoE@gmail.com', 'Gustavo Enrique', '95175382-6', '22235248', 2),
('ErnestoE', '123456', 'ErnestoE@gmail.com', 'Ernesto Ezequiel', '14589623-7', '79745331', 2),
('ManuelJ', '123456', 'ManuelJ@gmail.com', 'Manuel José', '35725846-1', '74665329', 2),
('KarinaI', '123456', 'KarinaI@gmail.com', 'Karina Isabel', '86479253-8', '71402380', 2),
('AlbertoM', '123456', 'AlbertoM@gmail.com', 'Alberto Miguel', '31285964-7', '77534293', 2);

SELECT * FROM tb_usuarios;

INSERT INTO tb_tipo_clientes(tipo_cliente) 
VALUES(001),(002),(003),(004),(005),(006); 

SELECT * FROM tb_tipo_clientes;

INSERT INTO tb_clientes(nombre,direccion,codigo,telefono,correo,id_tipo_cliente)
VALUES('Josefino Ezquivel','San Juan Opico','34976128-5','76615348','JE@gmail.com',1),
('Irma Elizabeth','San Juan Opico','45213785-4','70554321','IE@gmail.com',1),
('María Julia','San Juan Opico','15983145-9','73020103','MJ@gmail.com',2),
('Mario Alberto','San Juan Opico','76215943-8','70524758','MA@gmail.com',3),
('Dina María','San Juan Opico','65482317-2','71856328','DM@gmail.com',4),
('Gabriela Alejandra','San Juan Opico','76142985-1','71536948','GA@gmail.com',5),
('Steven José','San Juan Opico','15785644-0','73355448','SJ@gmail.com',6),
('Hugo André','San Juan Opico','75135420-0','23215548','HA@gmail.com',2),
('Juan Humberto','San Juan Opico','76143585-0','72757874','JH@gmail.com',4),
('Ivania Isabel','San Juan Opico','45678912-0','74760203','II@gmail.com',6);

SELECT * FROM tb_clientes;


INSERT INTO tb_categorias(categoria)
VALUES('Medicamento'),('Maquillaje'),('Cuidado Personal'),('Alimentos'),('Otros');

SELECT * FROM tb_categorias;

INSERT INTO tb_iva(porcentaje) VALUES(13);

INSERT INTO tb_puntos_venta(punto_venta) 
VALUES('Punto 1'), ('Punto 2'), ('Punto 3'), ('Punto 4');

SELECT * FROM tb_puntos_venta;

INSERT INTO tb_detalle_punto_ventas(id_punto_venta,id_usuario)
VALUES(1,2),(2,3),(3,4),(4,5);

INSERT INTO tb_sub_categorias(descripcion,id_categoria)
VALUES('Medicamento Bebible',1),('Maquillaje en polvo',2),('Bebidas',4),('Papeleria',5),('Biblia',5);

SELECT * FROM tb_sub_categorias;


INSERT INTO tb_laboratorios(codigo,nombre_laboratorio)
VALUES(123,'Laboratorios López');


INSERT INTO tb_proveedores(nombre_proveedor,id_laboratorio)
VALUES('Ivan Ezequiel',1);

INSERT INTO tb_entradas(tipo_entrada,cantidad_entrada,descripcion)
VALUES('Devolución',20,'El cliente devolvió el medicamento porque se le entrego el equivocado');

SELECT * FROM tb_entradas;

INSERT INTO tb_salidas(tipo_salida,cantidad_salida,descripcion)
VALUES('Averia',10,'El medicamento estaba cadudado');


INSERT INTO tb_bodegas(nombre_bodega,id_salida,id_entrada)
VALUES('Bodega 1',1,1);

SELECT * FROM tb_bodegas;



INSERT INTO tb_productos (codigo, nombre, id_proveedor, precio_sin_iva, existencia, descuento, id_sub_categoria, id_iva, marca, presentacion, minimo, maximo, fecha_ultima_compra, precio_ultima_compra, entradas, salidas, exixtencias_actuales, costo_total)
VALUES (12345, 'Paracetamol 500mg', 1, 5.99, 100, NULL, 1, 1, 'Genérico', 'Tabletas', 20, 200, '2024-04-01', 5.50, 200, 100, 200, 1000),
(67890, 'Ibuprofeno 400mg', 1, 7.25, 150, NULL, 1, 1, 'Genérico', 'Cápsulas', 30, 300, '2024-03-25', 6.80, 180, 30, 300, 1350),
(24680, 'Amoxicilina 500mg', 1, 8.50, 80, NULL, 1, 1, 'Genérico', 'Cápsulas', 10, 100, '2024-04-03', 8.00, 100, 20, 160, 1400),
(13579, 'Omeprazol 20mg', 1, 6.75, 120, NULL, 1, 1, 'Genérico', 'Tabletas', 20, 150, '2024-03-28', 6.40, 150, 30, 240, 1012),
(11223, 'Loratadina 10mg', 1, 9.15, 90, NULL, 1, 1, 'Genérico', 'Tabletas', 15, 120, '2024-04-05', 8.70, 100, 10, 180, 920),
(54321, 'Vitamina C 500mg', 1, 4.99, 200, NULL, 1, 1, 'Genérico', 'Tabletas efervescentes', 50, 300, '2024-04-02', 4.75, 250, 50, 400, 1247.50),
(76942, 'Aspirina 100mg', 1, 3.75, 180, NULL, 1, 1, 'Genérico', 'Tabletas', 30, 250, '2024-03-30', 3.50, 200, 20, 360, 1350),
(98765, 'Dipirona 500mg', 1, 6.25, 150, NULL, 1, 1, 'Genérico', 'Tabletas', 25, 200, '2024-04-06', 5.80, 180, 30, 300, 1125),
(35791, 'Sulfato de Zinc 50mg', 1, 7.99, 120, NULL, 1, 1, 'Genérico', 'Tabletas', 20, 150, '2024-04-08', 7.50, 150, 30, 240, 1200),
(15973, 'Cetirizina 10mg', 1, 8.50, 100, NULL, 1, 1, 'Genérico', 'Tabletas', 30, 200, '2024-04-10', 8.00, 120, 20, 180, 1020);

SELECT * FROM tb_productos;



INSERT INTO tb_inventarios(id_bodega,id_producto)
VALUES(1,1);



INSERT INTO tb_compras(id_proveedor,id_usuario)
VALUES(1,1),(1,2),(1,3);

INSERT INTO tb_detalle_compras(cantidad_producto,fecha_ingreso,costo_compra,id_producto,id_compra)
VALUES(15,'01/22/2024',150,1,1),
(15,'02/01/2024',150,5,2),
(15,'03/15/2024',150,3,3);

SELECT * FROM tb_detalle_compras;

INSERT INTO tb_ventas(monto_venta,fecha_venta,id_cliente,id_producto)
VALUES(150,'01/22/2024',3,1),
(150,'02/01/2024',2,5),
(150,'03/15/2024',7,2);

INSERT INTO tb_facturas(fecha,id_cliente,id_detalle_pventa)
VALUES('04/11/2024',1,1);

INSERT INTO tb_detalles_factura(cantidad_producto,precio_producto,id_producto)
VALUES(15,4.99,1);
