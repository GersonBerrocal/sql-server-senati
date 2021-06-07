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


--Insertar tb_Dproducto
INSERT INTO tb_Dproducto VALUES
('D0001','P0001','32','CL003','72.6'),
('D0002','P0001','36','CL003','79'),
('D0003','P0001','36','CL005','79'),
('D0004','P0003','S','CL001','52.2'),
('D0005','P0003','S','CL006','58.2'),
('D0006','P0006','M','CL007','43.0'),
('D0007','P0006','S','CL007','40.3'),
('D0008','P0009','S','CL009','41.0'),
('D0009','P0004','L','CL009','69.4'),
('D0010','P0002','38','CL008','74.6')
GO

--Seleccionar tb_Dproducto
SELECT * FROM tb_Dproducto
GO

--seleccionar , id_producto,producto,talla,color,precio
SELECT tdp.id_producto,tp.nombre,tdp.talla,tc.color,tdp.precio
FROM tb_Dproducto AS tdp INNER JOIN tb_Producto AS tp
ON (tdp.id_producto=tp.id_producto) INNER JOIN tb_Color AS tc
ON (tdp.id_color=tc.id_color)
GO

--Seleccionar, nombre categoria, precio
SELECT nombre,talla,color,precio as 'Precio mayor' 
FROM tb_Dproducto tdp INNER JOIN tb_Producto tp
ON (tdp.id_producto=tp.id_producto) INNER JOIN tb_Color tc
ON (tdp.id_color=tc.id_color)
WHERE precio=(SELECT MAX(precio) FROM tb_Dproducto)
GO

