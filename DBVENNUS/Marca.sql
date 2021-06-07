--Crear tb_Marca
CREATE TABLE tb_Marca(
    id_marca CHAR(5) NOT NULL,
    marca CHAR(25) NOT NULL,
    CONSTRAINT tb_Marca_id_marca_pk PRIMARY KEY (id_marca)
)
GO

--Insertar tb_Marca
INSERT INTO tb_Marca VALUES
('MA001','LEVI'),
('MA002','KANSAS'),
('MA003','Zehn'),
('MA004','NC'),
('MA005','Hipe'),
('MA006','Mikell'),
('MA007','Next'),
('MA008','Elva')
GO

INSERT INTO tb_Marca VALUES
('MA009','PERKS')
GO

--Seleccionar tb_Marca
SELECT * FROM tb_Marca
GO