
--Crear tabla tb_Categoria
CREATE TABLE tb_Categoria(
	id_categoria CHAR(5) NOT NULL,
	categoria CHAR(20) NOT NULL,
	CONSTRAINT tb_Categoria_id_categoria_pk PRIMARY KEY (id_categoria)
)
GO

--Seleccionar tb_Categoria
SELECT * FROM tb_Categoria
GO

--Insertar tb_Categoria
INSERT INTO tb_Categoria VALUES
('CA001','Jean'),
('CA002','Pantalon'),
('CA003','Casaca'),
('CA004','Ropa de gala'),
('CA005','Blusa'),
('CA006','Cardigan'),
('CA007','Chompa'),
('CA008','Vestido'),
('CA009','Camisa'),
('CA010','Buzo')
('CA011','Polo')
GO
