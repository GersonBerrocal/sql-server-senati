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

--Insertar tb_Distrito
INSERT INTO tb_Distrito VALUES
('DI001','Granada','PR004'),
('DI002','Cheto','PR004'),
('DI003','Asunción','PR004'),
('DI004','Comas','PR006'),
('DI005','El Agustino','PR006'),
('DI006','Independencia','PR006'),
('DI007','Carabayllo','PR006'),
('DI008','Ate','PR006'),
('DI009','Puente Piedra','PR006'),
('DI010','Cercado de Lima','PR006'),
('DI011','Huancano','PR014'),
('DI012','San Andres','PR014'),
('DI013','Quinua','PR018'),
('DI014','Pacaycasa','PR018'),
('DI015','Corrales','PR021'),
('DI016','La Cruz','PR021'),
('DI017','San Jacinto','PR021')
GO


--Seleccionar tb_Distrito
SELECT * from tb_Distrito
GO

SELECT tbd.distrito, count(*) AS 'Cantidad de Clientes' 
FROM tb_Cliente tbc INNER JOIN tb_Distrito tbd
ON (tbc.distrito = tbd.codigo_distrito)
GROUP BY tbd.distrito 
ORDER BY [Cantidad de Clientes] 
GO