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

--!Añadiendo PK a tb_Detalle_Pedido
--Agregando PK a dos columnas
ALTER TABLE tb_Det_Pedido
ADD CONSTRAINT tb_Det_Pedido_id_pedido_id_det_producto_pk PRIMARY KEY (id_pedido, id_det_producto)
GO

--Insertar tb_Det_Pedido
INSERT INTO tb_Det_Pedido VALUES
('P0001','D0001','3','72.6'),
('P0001','D0004','1','52.2'),
('P0001','D0007','1','40.3'),
('P0002','D0001','1','72.6'),
('P0002','D0007','1','40.3'),
('P0003','D0004','2','52.2'),
('P0003','D0010','1','74.6'),
('P0004','D0008','1','41.0'),
('P0005','D0009','1','69.4'),
('P0006','D0004','1','52.2'),
('P0006','D0002','1','79.0')
GO

--Seleccionar tb_Det_Pedido
SELECT * FROM tb_Det_Pedido
GO




