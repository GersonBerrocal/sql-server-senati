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

--Seleccionar tb_Producto
SELECT * FROM tb_Proveedor
GO

--Insertar tb_Producto
INSERT INTO tb_Proveedor VALUES
('PV001','Unicenter','gestion_unicenter@unicenter.com',null,'PA001'),
('PV002','PinkModa','pinkModa@pinkmoda.com',null,'PA002'),
('PV003','Likid','calidad_lk@likid.com',null,'PA002'),
('PV004','Blushop','sergio_le@blushop.com',null,'PA005'),
('PV005','Nanos','sgcalidad_na@nanos.com',null,'PA004'),
('PV006','Jeat','jeat_bn@hotmail.com',null,'PA001')
GO


--Actualizar tb_Producto
--Añadir telefono
UPDATE tb_Proveedor
SET telefono='978168472'
WHERE id_proveedor='PV001'
GO