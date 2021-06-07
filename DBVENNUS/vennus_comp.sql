
--Crear bd_Vennus
create database bd_Vennus
go

--Poniendo en Uso
use bd_Vennus
go

-- Eliminar bd_Vennus
DROP DATABASE bd_Vennus

--Crear tabla tb_Departamento
CREATE TABLE tb_Departamento(
	codigo_departamento CHAR(5) NOT NULL,
	departamento VARCHAR(50) NOT NULL,
	CONSTRAINT tb_Departamento_codigo_departamento_pk PRIMARY KEY(codigo_departamento),
	CONSTRAINT tb_Departamento_departamento_uk UNIQUE(departamento)
)
GO

--Crear tabla tb_Provincia
CREATE TABLE tb_Provincia(
	codigo_provincia CHAR(5) NOT NULL,
	provincia VARCHAR(50) NOT NULL,
	provincia_codigo_dpto CHAR(5) NOT NULL,
	CONSTRAINT tb_Provincia_codigo_provincia_pk PRIMARY KEY (codigo_provincia),
	CONSTRAINT tb_Provincia_provincia_codigo_dpto_fk FOREIGN KEY (provincia_codigo_dpto)
		REFERENCES tb_Departamento(codigo_departamento)
)
GO

--Seleccionar tb_Provincia
SELECT * FROM tb_Provincia
GO

--Crear tabla tb_Distrito 
CREATE TABLE tb_Distrito(
	codigo_distrito CHAR(5) NOT NULL,
	distrito VARCHAR(50) NOT NULL,
	distrito_codigo_provincia CHAR(5) NOT NULL, 
	CONSTRAINT tb_Distrito_codigo_distrito_pk PRIMARY KEY (codigo_distrito),
	CONSTRAINT tb_Distrito_distrito_codigo_provincia_fk FOREIGN KEY (distrito_codigo_provincia)
		REFERENCES tb_Provincia(codigo_provincia)
)
GO

--Seleccionar tb_Distrito
SELECT * from tb_Distrito
GO


--Crear tabla tb_Cliente 
create table tb_Cliente(
	id_cliente CHAR(5) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(20) NOT NULL,
	celular VARCHAR(13),
	correo VARCHAR(50),
	distrito CHAR(5) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	CONSTRAINT tb_Cliente_id_cliente_pk PRIMARY KEY (id_cliente),
	CONSTRAINT tb_Cliente_correo_uk UNIQUE (correo),
	CONSTRAINT tb_Cliente_distrito_fk FOREIGN KEY (distrito)
		REFERENCES tb_Distrito(codigo_distrito)
)
GO

--Crear tabla tb_Categoria
CREATE TABLE tb_Categoria(
	id_categoria CHAR(5) NOT NULL,
	categoria CHAR(20) NOT NULL,
	CONSTRAINT tb_Categoria_id_categoria_pk PRIMARY KEY (id_categoria)
)
GO

--Crear tabla tb_Producto
CREATE TABLE tb_Producto(
	id_producto CHAR(5) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(100),
	marca VARCHAR(20) NOT NULL,
	estado CHAR(1) NOT NULL,
	seccion CHAR(1) NOT NULL,
	producto_id_categoria CHAR(5) NOT NULL,
	CONSTRAINT tb_Producto_id_producto_pk PRIMARY KEY (id_producto),
	CONSTRAINT tb_Producto_producto_id_categoria_fk FOREIGN KEY (producto_id_categoria)
		REFERENCES tb_Categoria(id_categoria)
)
GO

--Crear tabla tb_Color
CREATE TABLE tb_Color(
	id_color CHAR(5) NOT NULL,
	color VARCHAR(15) NOT NULL,
	CONSTRAINT tb_Color_id_color_pk PRIMARY KEY (id_color)
)
GO

--Crear tabla tb_Dproducto
CREATE TABLE tb_Dproducto(
	id_detalle_producto CHAR(5) NOT NULL,
	id_producto CHAR(5) NOT NULL,
	talla VARCHAR(2) NOT NULL,
	id_color CHAR(5) NOT NULL,
	precio NUMERIC(7,2),
	CONSTRAINT tb_Dproducto_id_detalle_producto_pk PRIMARY KEY (id_detalle_producto),
	CONSTRAINT tb_Dproducto_id_producto_fk FOREIGN KEY (id_producto)
		REFERENCES tb_Producto(id_producto),
	CONSTRAINT tb_Dproducto_id_color_fk FOREIGN KEY (id_color)
		REFERENCES tb_Color(id_color),		
)
GO

--Crear tb_Pais 
CREATE TABLE tb_Pais(
	id_pais CHAR(5) NOT NULL,
	pais VARCHAR(30) NOT NULL,
	CONSTRAINT tb_Pais_id_pais_pk PRIMARY KEY (id_pais)
)
GO

--Crear tb_Proveedor
CREATE TABLE tb_Proveedor(
	id_proveedor CHAR(5) NOT NULL,
	nombre_proveedor VARCHAR(30) NOT NULL,
	correo VARCHAR(50) NOT NULL,
	telefono VARCHAR(13),
	id_pais CHAR(5) NOT NULL,
	CONSTRAINT tb_Proveedor_id_proveedor_pk PRIMARY KEY (id_proveedor),
	CONSTRAINT tb_Proveedor_id_pais_fk FOREIGN KEY (id_pais)
		REFERENCES tb_Pais(id_pais)
)
GO

--Crear tabla tb_Producto_Proveedor
--!Agregando pk a dos columas
CREATE TABLE tb_Producto_Proveedor(
	id_proveedor CHAR(5) NOT NULL,
	id_producto CHAR(5) NOT NULL,
	CONSTRAINT tb_Producto_Proveedor_id_proveedor_fk FOREIGN KEY (id_proveedor)
		REFERENCES tb_Proveedor(id_proveedor),
	CONSTRAINT tb_Producto_Proveedor_id_producto_fk FOREIGN KEY (id_producto)
		REFERENCES tb_Producto(id_producto),
	CONSTRAINT tb_Producto_Proveedor_id_proveedor_producto_pk PRIMARY KEY (id_producto,id_proveedor)
)
GO


--Crear tb_Pedido
CREATE TABLE tb_Pedido(
	id_pedido CHAR(5) NOT NULL,
	id_cliente CHAR(5) NOT NULL,
	fecha DATE,
	hora TIME,
	importe NUMERIC(7,2) NOT NULL,
	proceso CHAR(1) NOT NULL,
	CONSTRAINT tb_Pedido_id_pedido_pk PRIMARY KEY (id_pedido),
	CONSTRAINT tb_Pedido_id_cliente_fk FOREIGN KEY (id_cliente)
		REFERENCES tb_Cliente(id_cliente)
)
GO

--Crear tb_Det_Pedido
CREATE TABLE tb_Det_Pedido(
	id_pedido CHAR(5) NOT NULL,
	id_det_producto  CHAR(5) NOT NULL,
	cantidad smallint NOT NULL,
	precio numeric(7,2) NOT NULL,
	CONSTRAINT tb_Det_Pedido_id_pedido_fk FOREIGN KEY (id_pedido)
		REFERENCES tb_Pedido(id_pedido),
	CONSTRAINT tb_Det_Pedido_id_det_producto_fk FOREIGN KEY (id_det_producto)
		REFERENCES tb_Dproducto(id_detalle_producto)
)
GO