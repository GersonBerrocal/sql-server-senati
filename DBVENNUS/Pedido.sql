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


--Insertar tb_Pedido
INSERT INTO tb_Pedido VALUES
('P0001','C0001','01-31-2021','12:05:00','310.3','E'),
('P0002','C0002','02-06-2021','08:15:00','112.9','E'),
('P0003','C0003','02-15-2021','10:00:00','179','E'),
('P0004','C0003','02-24-2021','03:42:00','41.0','R'),
('P0005','C0006','02-27-2021','01:25:00','69.4','R'),
('P0006','C0011','02-27-2021','05:11:00','131.2','R')
GO


--Seleccionar tb_Pedido
SELECT * FROM tb_Pedido
GO

--Seleccionar cantidas de tallas q hay de un producto
SELECT nombre, COUNT(*) AS 'cantidad de tallas'
FROM tb_Producto tp INNER JOIN tb_Dproducto AS tdp
ON (tdp.id_producto=tp.id_producto)
GROUP BY nombre
GO

--seleccionar : id_pedido, id_cliente, nombre del cliente, producto, cantidad,precio, cantidad*precio
SELECT tp.id_pedido, tp.id_cliente,tc.nombre+' '+tc.apellidos AS cliente, tpro.nombre AS producto,
tdpe.cantidad, tdpe.precio, tdpe.precio*tdpe.cantidad AS 'importe por producto',
tp.fecha
FROM tb_Pedido AS tp INNER JOIN tb_Cliente AS tc
ON (tp.id_cliente=tc.id_cliente) INNER JOIN tb_Det_Pedido AS tdpe
ON (tdpe.id_pedido=tp.id_pedido) INNER JOIN tb_Dproducto AS tdpro
ON (tdpe.id_det_producto=tdpro.id_detalle_producto) INNER JOIN tb_Producto AS tpro
ON (tdpro.id_producto=tpro.id_producto)
WHERE proceso='E'
GO
