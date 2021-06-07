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

--Insertar tb_Producto_Proveedor
INSERT INTO tb_Producto_Proveedor VALUES
('PV001','P0003'),
('PV001','P0005'),
('PV001','P0006'),
('PV006','P0009'),
('PV002','P0002'),
('PV002','P0001'),
('PV004','P0007'),
('PV003','P0008'),
('PV005','P0008')
GO

INSERT tb_Producto_Proveedor VALUES
('PV004','P0010')
GO

--Seleccionar tb_Producto_Proveedor
SELECT * FROM tb_Producto_Proveedor
GO


--Seleccionar tb_Producto_Proveedor
-- nombre del proveedor, producto del proveedor, pais, marca
SELECT nombre_proveedor,pais,nombre,tm.marca
FROM
tb_Producto_Proveedor tpp INNER JOIN tb_Proveedor tp
ON (tpp.id_proveedor=tp.id_proveedor) INNER JOIN tb_Pais tpa
ON (tp.id_pais=tpa.id_pais) INNER JOIN tb_Producto tpro
ON (tpp.id_producto=tpro.id_producto) INNER JOIN tb_Marca tm
ON (tpro.marca=tm.id_marca)
-- WHERE tm.marca LIKE '%va%' 
ORDER BY pais,nombre_proveedor,marca
GO


--Seleccionar
--Seleccionar proveedor, y marcas del proveedor
-- SELECT nombre_proveedor, tm.marca
-- FROM 
-- tb_Producto_Proveedor tpp INNER JOIN tb_Proveedor tp
-- ON (tpp.id_proveedor=tp.id_proveedor) INNER JOIN tb_Producto tpro
-- ON (tpp.id_producto=tpro.id_producto) INNER JOIN tb_Marca tm
-- ON (tpro.marca=tm.id_marca)
-- GROUP BY nombre_proveedor,tm.marca
-- ORDER BY nombre_proveedor
-- GO