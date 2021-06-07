--Crear tabla tb_Color
CREATE TABLE tb_Color(
	id_color CHAR(5) NOT NULL,
	color VARCHAR(15) NOT NULL,
	CONSTRAINT tb_Color_id_color_pk PRIMARY KEY (id_color)
)
GO

--Seleccionar tb_Color
SELECT * FROM tb_Color
GO

--Insertar tb_Color
INSERT INTO tb_Color VALUES
('CL001','rojo'),
('CL002','lila'),
('CL003','azul'),
('CL004','naranja'),
('CL005','rosa'),
('CL006','gris'),
('CL007','magenta'),
('CL008','beige'),
('CL009','negro')
GO

--Seleccionar
--Que productos hay en un tipo de color
--color, nombre producto, talla
SELECT color,nombre,talla,categoria
FROM 
tb_Dproducto tdp INNER JOIN tb_Color tc
ON(tdp.id_color=tc.id_color) INNER JOIN tb_Producto tp
ON(tdp.id_producto=tp.id_producto) INNER JOIN tb_Categoria tca
ON(tp.producto_id_categoria=tca.id_categoria)
WHERE categoria!='Jean' and categoria !='Polo'
ORDER BY color
GO
