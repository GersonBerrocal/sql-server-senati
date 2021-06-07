--Crear tabla tb_Departamento
CREATE TABLE tb_Departamento(
	codigo_departamento CHAR(5) NOT NULL,
	departamento VARCHAR(50) NOT NULL,
	CONSTRAINT tb_Departamento_codigo_departamento_pk PRIMARY KEY(codigo_departamento),
	CONSTRAINT tb_Departamento_departamento_uk UNIQUE(departamento)
)
GO

--Insertar tb_Departamento
INSERT INTO tb_Departamento VALUES
('D0001','Amazonas'),
('D0002','Áncash'),
('D0003','Apurímac'),
('D0004','Arequipa'),
('D0005','Ayacucho'),
('D0006','Cajamarca'),
('D0007','Cusco'),
('D0008','Huancavelica'),
('D0009','Huánuco'),
('D0010','Ica'),
('D0011','Junín'),
('D0012','La Libertad'),
('D0013','Lambayeque'),
('D0014','Lima'),
('D0015','Loreto'),
('D0016','Madre de Dios'),
('D0017','Moquegua'),
('D0018','Pasco'),
('D0019','Piura'),
('D0020','Puno'),
('D0021','San Martín'),
('D0022','Tacna'),
('D0023','Tumbes'),
('D0024','Ucayali')
GO

--Seleccionar tb_Departamento
SELECT * FROM tb_Departamento
GO

--Eliminar tb_Departamento
--Eliminar todos sus registros
TRUNCATE TABLE tb_Departamento
GO