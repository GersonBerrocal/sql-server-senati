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

INSERT INTO tb_Provincia VALUES
('PR001','Bongará','D0001'),
('PR002','Ucutamba','D0001'),
('PR003','Luya','D0001'),
('PR004','Chachapoyas','D0001'),
('PR005','Barranca','D0014'),
('PR006','Lima','D0014'),
('PR007','Canta','D0014'),
('PR008','Cañete','D0014'),
('PR009','Cañete','D0004'),
('PR010','La Unión','D0004'),
('PR011','Camaná','D0004'),
('PR012','Caraveñí','D0004'),
('PR013','Ica','D0010'),
('PR014','Pisco','D0010'),
('PR015','Chincha','D0010'),
('PR016','Nazca','D0010'),
('PR017','Cangallo','D0005'),
('PR018','Huamanga','D0005'),
('PR019','La Mar','D0005'),
('PR020','Sucre','D0005'),
('PR021','Tumbes','D0023'),
('PR022','Zarumilla','D0023')
GO

