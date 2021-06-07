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


--!Añadir fk a marca
--modificar el tipo de la columna marca
ALTER TABLE tb_Producto ALTER COLUMN marca CHAR(5) NOT NULL
GO
--añadir el constraint
ALTER TABLE tb_Producto ADD CONSTRAINT tb_Producto_marca_fk FOREIGN KEY (marca)
	REFERENCES tb_Marca(id_marca)
GO

--Seleccionar tb_Producto
SELECT * FROM tb_Producto
GO

--Insertar tb_Producto
INSERT INTO tb_Producto VALUES
('P0001','LEVI JEANS 512 SLIM TAPER',null,'MA001','I','H','CA001'),
('P0002','KANSAS JEAN 1551 59',null,'MA002','I','H','CA001'),
('P0003','Casaca Hombre Cruzada',null,'MA003','N','H','CA003'),
('P0004','Polera con Capucha',null,'MA004','I','H','CA003'),
('P0005','Cárdigan University Club',null,'MA005','N','M','CA006'),
('P0006','Cárdigan Mujer Newport',null,'MA005','N','M','CA006'),
('P0007','MARQUIS VESTIDO',null,'MA008','I','M','CA008'),
('P0008','MICKEY POLO MIK-1561-A',null,'MA006','I','N','CA011'),
('P0009','POLO NIÑO RAYAS 834040',null,'MA007','I','N','CA011')
GO

INSERT INTO tb_Producto VALUES
('P0010','Polo rosa con diseño hawai',null,'MA009','I','H','CA011')
GO

--Seleccionar producto por marca
SELECT * FROM tb_Producto
GO

--Seleccionar, nombre del producto, conteo de tallas de cierta categoria
select nombre,tm.marca,count(talla) as 'cantidad de tallas'
from tb_Producto tbp inner join tb_Dproducto tbdp
on(tbdp.id_producto = tbp.id_producto) INNER JOIN tb_Marca tm
ON(tbp.marca=tm.id_marca)
group by nombre, tm.marca
order by nombre
go


