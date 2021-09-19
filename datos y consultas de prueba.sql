--Datos de prueba 
/*
INSERT INTO dbo.Persona([nombre], [apellido], [cedula], [fechaNacimiento])
VALUES ('Juan', 'Salazar', '2-2222-2222', '1970-11-21')

INSERT INTO dbo.Cliente(id)
VALUES(1)

--Nuestro mapa de caballeriza
INSERT INTO Caballeriza ([nombre], [mapa])
VALUES ('Caballos San Martin', geometry::STGeomFromText('POLYGON((0 0, 0 6, 5 6, 5 0, 0 0))', 0))


INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('VIP', 3, 6, geometry::STGeomFromText('POLYGON((0 0, 0 6, 1 6, 1 0, 0 0))', 0))

INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('Mediana', 3, 10, geometry::STGeomFromText('POLYGON((1 0, 1 6, 2 6, 2 0, 1 0),(2 0, 2 4, 3 4, 3 0, 2 0))', 0))


INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('Regular', 3, 14, geometry::STGeomFromText('POLYGON((2 4, 2 6, 3 6, 3 4, 2 4),(3 0, 3 6, 5 6, 5 0, 3 0))', 0))


INSERT INTO Raza([nombre])
VALUES('Árabe')

INSERT INTO Caballo([idCliente], [idRaza], [nombre], [edad], [campoOcupado])
VALUES(1,1,'Komanche',10,geometry::STGeomFromText('POLYGON((1 3, 1 4, 2 4, 2 3, 1 3))', 0))

INSERT INTO Caballo([idCliente], [idRaza], [nombre], [edad], [campoOcupado])
VALUES(1,1,'Tiro al blanco',10,geometry::STGeomFromText('POLYGON((2 3, 2 4, 3 4, 3 3, 2 3))', 0))

INSERT INTO Caballo([idCliente], [idRaza], [nombre], [edad], [campoOcupado])
VALUES(1,1,'Chispa',10,geometry::STGeomFromText('POLYGON((0 2, 0 3, 1 3, 1 2, 0 2))', 0))
*/




--consultas de prueba
/*
SELECT mapa FROM Caballeriza C WHERE Id=3
UNION all
SELECT campoEnCaballeriza FROM PartesCaballeriza 
UNION all
SELECT campoOcupado FROM Caballo


DECLARE @a INT;
EXEC ConsultarCaballosVecino 1,@a OUTPUT
SELECT @a
*/