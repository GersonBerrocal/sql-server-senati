
--Crear tabla tb_Cliente 
create table tb_Cliente(
	id_cliente CHAR(5) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(20) NOT NULL,
	celular VARCHAR(13),
	correo VARCHAR(50),
	distrito CHAR(5) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	CONSTRAINT tb_Cliente_id_cliente_pk PRIMARY KEY (id_cliente),
	CONSTRAINT tb_Cliente_correo_uk UNIQUE (correo),
	CONSTRAINT tb_Cliente_distrito_fk FOREIGN KEY (distrito)
		REFERENCES tb_Distrito(codigo_distrito)
)
GO

--!tb_Cliente
--Modificando la columan correo a NOT NULL
--Eliminar el Constraint
ALTER TABLE tb_Cliente DROP CONSTRAINT tb_Cliente_correo_uk
GO
--Modificar la columna
ALTER TABLE tb_Cliente ALTER COLUMN correo VARCHAR(50) NOT NULL
GO
--Agregar de nuevo el Constraint
ALTER TABLE tb_Cliente ADD CONSTRAINT tb_Cliente_correo_uk UNIQUE (correo)
GO


--Insertar tb_Cliente
INSERT INTO tb_Cliente VALUES
('C0001','Joseph','Fuentes Velasquez',null,'Joseph@hotmail.com','DI004','Mz-H1lt25 Av.Sirenas'),
('C0002','Gerson','Berrocal Najarro',null,'Gerson@hotmail.com','DI006','Mz-H1lt2 Asoc.portales'),
('C0003','Samira','Herrera Arango',null,'samaH@gmail.com','DI004','Mz. B Lt.36 Maria Elena'),
('C0004','Hugo','Quispe Navarro',null,'hugop@hotmail.com','DI004','Mz. B Lt.36 Maria Elena'),
('C0005','Antonio','Martinez Lopez','981248773','antonio_martinez@gmail.com','DI005',null),
('C0006','Isabel','Moreno Perez',null,'isabelta@gmail.com','DI011','Av, Los jardines 523'),
('C0007','Lucia','Alfaro Lozano','914536791','luci_c@hotmail.com','DI009','Mz. A 265 San Ignacio'),
('C0008','Juan Antonio','Ortega Cano','999145789','juan_antonioOrt@hotmail.com','DI017',null),
('C0009','Rocio','Alarcon Silva','976345812','ROal@hotmail.com','DI004','Mz. H 16 Simon Bolivar'),
('C0010','Esteban Manuel','Collado Ramirez',null,'EstColl@gmail.com','DI008',null),
('C0011','Adrian','Nuñez Alvarado',null,'adri_nu@gmail.com','DI004','Mz. B Lt.36 Maria Elena')
GO


--Selccionar tb_Cliente
SELECT * FROM tb_Cliente
GO

--seleccionar : id, nombre+apellido, distrito del cliente
SELECT tc.id_cliente,tc.nombre+' '+tc.apellidos,td.distrito
FROM tb_Cliente AS tc INNER JOIN tb_Distrito AS td
ON (tc.distrito=td.codigo_distrito)
GO

--seleccionar : id cliente, nombre , provincia
SELECT id_cliente, nombre, provincia
FROM tb_Cliente AS tc INNER JOIN tb_Distrito AS td
ON (tc.distrito=td.codigo_distrito)  INNER JOIN tb_Provincia AS tp
ON (td.distrito_codigo_provincia=tp.codigo_provincia)
GO

-- --seleccionar solo los clientes que tengan gmail
SELECT * 
FROM tb_Cliente
WHERE correo LIKE '%hotmail.com'
GO

-- Seleccionar : 
--id_cliente,nombre,distrito,provincia,deapartamento
SELECT id_cliente,nombre,td.distrito,tp.provincia,tdp.departamento
FROM tb_Cliente tc INNER JOIN tb_Distrito td
ON (tc.distrito=td.codigo_distrito) INNER JOIN tb_Provincia tp
ON (td.distrito_codigo_provincia=tp.codigo_provincia) INNER JOIN tb_Departamento tdp
ON (tp.provincia_codigo_dpto=tdp.codigo_departamento)
ORDER BY td.distrito,tdp.departamento
GO

--?Probando like % _ []
--Seleccionar
--id del cliente, nombre+apellido,genero
--donde su id este entre 10 y 100
SELECT * 
FROM tb_Cliente
WHERE id_cliente  LIKE  '___1_'
OR id_cliente LIKE '___20'
GO
