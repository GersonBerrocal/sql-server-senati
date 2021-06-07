--Crear tb_Pais 
CREATE TABLE tb_Pais(
	id_pais CHAR(5) NOT NULL,
	pais VARCHAR(30) NOT NULL,
	CONSTRAINT tb_Pais_id_pais_pk PRIMARY KEY (id_pais)
)
GO

--Seleccionar tb_Pais
SELECT * FROM tb_Pais
GO

--Insertar tb_Pais
INSERT INTO tb_Pais VALUES
('PA001','Perú'),
('PA002','Estados Unidos'),
('PA003','China'),
('PA004','Colombia'),
('PA005','Mexico'),
('PA006','Italia')
GO