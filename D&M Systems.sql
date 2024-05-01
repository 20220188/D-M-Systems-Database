/*BASE DE DATOS SIN INSERCIONES*/

DROP DATABASE if EXISTS db_dmsystems;

CREATE DATABASE db_dmsystems;

USE db_dmsystems;

CREATE TABLE tb_dependientes(
id_dependiente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo INT UNIQUE,
nombre_dependiente VARCHAR(50)
);

CREATE TABLE tb_formas_pago(
id_forma_pago INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
forma_pago VARCHAR(25)
);

CREATE TABLE tb_niveles_usuarios(
id_nivel_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_usuario VARCHAR(20)
);

CREATE TABLE tb_usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
usuario VARCHAR(10) unique,
clave VARCHAR(10),
correo VARCHAR(50) unique,
nombre VARCHAR(25),
DUI VARCHAR(10) unique,
telefono VARCHAR(10) unique,
id_nivel_usuario INT,
CONSTRAINT fk_usuarios_niveles_usuarios
FOREIGN KEY (id_nivel_usuario)
REFERENCES tb_niveles_usuarios (id_nivel_usuario)
);

CREATE TABLE tb_tipo_clientes(
id_tipo_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_cliente VARCHAR(10)
);


CREATE TABLE tb_clientes( 
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(15),
nombre_comercial VARCHAR(50) NULL,
direccion VARCHAR(250),
codigo VARCHAR(10) UNIQUE, /*codigo o DUI*/
telefono VARCHAR(9) unique,
correo VARCHAR(50) unique,
NIT VARCHAR(20) NULL unique,
NRC VARCHAR(10) NULL UNIQUE,
id_tipo_cliente INT,
CONSTRAINT fk_tipo_cliente_cliente
FOREIGN KEY (id_tipo_cliente)
REFERENCES tb_tipo_clientes (id_tipo_cliente)
);

CREATE TABLE tb_categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
categoria VARCHAR(30),
descripcion VARCHAR(100) NULL
);

CREATE TABLE tb_iva(
id_iva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
porcentaje INT NOT NULL
CHECK (porcentaje >0) 
);

CREATE TABLE tb_puntos_venta(
id_punto_venta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
punto_venta VARCHAR(10)
);

CREATE TABLE tb_detalle_punto_ventas(
id_detalle_pventa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_punto_venta INT,
CONSTRAINT fk_detalle_punto_venta
FOREIGN KEY (id_punto_venta)
REFERENCES tb_puntos_venta (id_punto_venta),
id_usuario INT,
CONSTRAINT fk_detalle_usuario
FOREIGN KEY (id_usuario)
REFERENCES tb_usuarios (id_usuario)
);


CREATE TABLE tb_sub_categorias(
id_sub_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(30) NULL,
id_categoria INT,
CONSTRAINT fk_categoria_sub_categoria
FOREIGN KEY (id_categoria)
REFERENCES tb_categorias (id_categoria)
);

CREATE TABLE tb_laboratorios(
id_laboratorio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo INT UNIQUE,
nombre_laboratorio VARCHAR(50)
);


CREATE TABLE tb_proveedores(
id_proveedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_proveedor VARCHAR(15),
NRC VARCHAR(10),
DUI varchar(10),
NIT VARCHAR(20),
telefono VARCHAR(9),
razon_social VARCHAR(250),
id_laboratorio INT,
CONSTRAINT fk_proveedor_laboratorio
FOREIGN KEY (id_laboratorio)
REFERENCES tb_laboratorios (id_laboratorio)
);

CREATE TABLE tb_bodegas(
id_bodega INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_bodega VARCHAR(15)
);

CREATE TABLE tb_tipo_entradas(
id_tipo_entrada INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_entrada VARCHAR(25)
);

CREATE TABLE tb_entradas(
id_entrada INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(250),
fecha_entrada DATETIME DEFAULT(NOW()),
numero_entrada INT AUTO_INCREMENT,
nota_entrada VARCHAR(250),
id_tipo_entrada INT,
CONSTRAINT fk_entrada_tipo
FOREIGN KEY (id_tipo_entrada)
REFERENCES tb_tipo_entradas (id_tipo_entrada),
id_cliente INT NULL,
CONSTRAINT fk_entrada_cliente
FOREIGN KEY (id_cliente)
REFERENCES tb_clientes (id_cliente),
id_dependiente INT,
CONSTRAINT fk_entrada_dependiente
FOREIGN KEY (id_dependiente)
REFERENCES tb_dependientes (id_dependiente),
id_productos INT,
CONSTRAINT fk_entrada_producto
FOREIGN KEY (id_productos)
REFERENCES tb_productos (id_productos),
id_bodega,
CONSTRAINT fk_salida_bodega
FOREIGN KEY (id_bodega)
REFERENCES tb_bodegas (id_bodega)
);


CREATE TABLE tb_tipo_salidas(
id_tipo_salida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_salida VARCHAR(25)
);

CREATE TABLE tb_salidas(
id_salida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion VARCHAR(250),
fecha_salida DATETIME DEFAULT(NOW()),
numero_salida INT AUTO_INCREMENT, /*Campo que se debe mandar a llamar en un label*/
notas_salida VARCHAR(250),
id_tipo_salida INT,
CONSTRAINT fk_salida_tipo
FOREIGN KEY (id_tipo_salida)
REFERENCES tb_tipo_salidas (id_tipo_salida),
id_cliente INT NULL,
CONSTRAINT fk_salida_cliente
FOREIGN KEY (id_cliente)
REFERENCES tb_clientes (id_cliente),
id_bodega,
CONSTRAINT fk_salida_bodega
FOREIGN KEY (id_bodega)
REFERENCES tb_bodegas (id_bodega),
id_productos INT,
CONSTRAINT fk_salida_producto
FOREIGN KEY (id_productos)
REFERENCES tb_productos (id_productos)
);


CREATE TABLE tb_productos(
id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo INT unique,
nombre VARCHAR(250),
descripcion VARCHAR(250),
id_proveedor INT,
marca VARCHAR(50),
presentacion VARCHAR(25),
fecha_vencimiento DATETIME,
CONSTRAINT fk_producto_proveedor
FOREIGN KEY (id_proveedor)
REFERENCES tb_proveedores (id_proveedor),
precio_sin_iva FLOAT, /*Precio de compra sin iva*/
CHECK (precio_sin_iva>0),
existencia INT
CHECK (existencia>=0),
descuento INT NULL
CHECK (descuento>=0),
id_sub_categoria INT,
CONSTRAINT fk_producto_sub_categoria
FOREIGN KEY (id_sub_categoria)
REFERENCES tb_sub_categorias (id_sub_categoria),
id_iva INT,
CONSTRAINT fk_producto_iva
FOREIGN KEY (id_iva)
REFERENCES tb_iva (id_iva),
minimo INT,
maximo INT,
/*datos para los reportes*/
fecha_ultima_compra DATETIME,
precio_ultima_compra NUMERIC(5,2)
CHECK (precio_ultima_compra >=0),
entradas INT,
salidas INT,
exixtencias_actuales INT
CHECK (exixtencias_actuales >0),
costo_total INT
CHECK (costo_total >0) 
);


CREATE TABLE tb_inventarios(
id_inventario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_bodega INT,
CONSTRAINT fk_inventario_bodega
FOREIGN KEY (id_bodega)
REFERENCES tb_bodegas (id_bodega),
id_producto INT,
CONSTRAINT fk_inventario_producto
FOREIGN KEY (id_producto)
REFERENCES tb_productos (id_producto)
);

CREATE TABLE tb_compras(
id_compra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_proveedor INT,
CONSTRAINT fk_compra_proveedor
FOREIGN KEY (id_proveedor)
REFERENCES tb_proveedores (id_proveedor),
id_usuario INT,
CONSTRAINT fk_compra_usuario
FOREIGN KEY (id_usuario)
REFERENCES tb_usuarios (id_usuario),
id_bodega,
CONSTRAINT fk_compra_bodega
FOREIGN KEY (id_bodega)
REFERENCES tb_bodegas (id_bodega),
id_forma_pago int,
CONSTRAINT fk_compra_pago
FOREIGN KEY (id_forma_pago)
REFERENCES tb_formas_pago (id_forma_pago)
);

CREATE TABLE tb_detalle_compras(
id_detalle_compra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
cantidad_producto INT CHECK (cantidad_producto >=0),
numero_factura VARCHAR(25),
fecha_ingreso DATETIME DEFAULT(NOW()),
costo_compra INT CHECK(costo_compra >=0),
notas_compra VARCHAR(250),
id_producto INT,
CONSTRAINT fk_detalle_compra_producto
FOREIGN KEY (id_producto)
REFERENCES tb_productos (id_producto),
id_compra INT,
CONSTRAINT fk_detalle_compra_compras
FOREIGN KEY (id_compra)
REFERENCES tb_compras (id_compra)
);

CREATE TABLE tb_ventas(
id_venta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
monto_venta FLOAT CHECK (monto_venta >=0) ,
fecha_venta DATE,
id_cliente INT,
CONSTRAINT fk_venta_cliente
FOREIGN KEY (id_cliente)
REFERENCES tb_clientes (id_cliente),
id_producto INT,
CONSTRAINT fk_venta_producto
FOREIGN KEY (id_producto)
REFERENCES tb_productos (id_producto)
);

CREATE TABLE tb_facturas(
id_factura_consumidor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha DATE,
id_cliente INT,
CONSTRAINT fk_cliente_consumidor_final
FOREIGN KEY (id_cliente)
REFERENCES tb_clientes (id_cliente),
id_detalle_pventa INT,
CONSTRAINT fk_factura_detalle_pventa
FOREIGN KEY (id_detalle_pventa)
REFERENCES tb_detalle_punto_ventas (id_detalle_pventa)
);

CREATE TABLE tb_detalles_factura(
id_detalle_factura INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
cantidad_producto INT CHECK (cantidad_producto>=0),
precio_producto FLOAT CHECK (precio_producto>=0),
id_producto INT,
CONSTRAINT fk_detalle_facturas_productos
FOREIGN KEY (id_producto)
REFERENCES tb_productos (id_producto)
);


CREATE TABLE tb_notas_creditos( 
id_nota_credito INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numero_docmuento INT unique,
fecha_documento DATE,
monto FLOAT,
id_producto INT,
CONSTRAINT fk_producto_notas_credito
FOREIGN KEY (id_producto)
REFERENCES tb_productos (id_producto),
id_detalle_factura INT,
CONSTRAINT fk_notas_credito_fiscal
FOREIGN KEY (id_detalle_factura)
REFERENCES tb_detalles_factura (id_detalle_factura)
);

CREATE TABLE tb_devoluciones_farmacia_proveedor(
id_devolucion_farmapro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
descripcion_devolucion VARCHAR(250) NOT NULL,
id_nota_credito INT,
CONSTRAINT fk_notas_devoluciones_farmapro
FOREIGN KEY (id_nota_credito)
REFERENCES tb_notas_creditos (id_nota_credito)
);


/*tabla para crear los reportes debe ir aqui*/
