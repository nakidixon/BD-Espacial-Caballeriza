--Datos de prueba 

INSERT INTO dbo.Persona([nombre], [apellido], [cedula], [fechaNacimiento])
VALUES ('Juan', 'Salazar', '2-2222-2222', '1970-11-21')

INSERT INTO dbo.Cliente(id)
VALUES(1)

--Nuestro mapa de caballeriza	
INSERT INTO Caballeriza ([nombre], [mapa])
VALUES ('Caballos San Martin', geometry::STGeomFromText('POLYGON((0 0, 0 6, 5 6, 5 0, 0 0))', 0))


--las partes de la caballeriza
INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('VIP', 1, 6, geometry::STGeomFromText('POLYGON((0 0, 0 6, 1 6, 1 0, 0 0))', 0))

INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('Mediana', 1, 10, geometry::STGeomFromText('POLYGON((1 0, 1 6, 2 6, 2 0, 1 0),(2 0, 2 4, 3 4, 3 0, 2 0))', 0))

INSERT INTO PartesCaballeriza([nombre], [idCaballeriza], [cantidadCampos], [campoEnCaballeriza])
VALUES ('Regular',1, 14, geometry::STGeomFromText('POLYGON((2 4, 2 6, 3 6, 3 4, 2 4),(3 0, 3 6, 5 6, 5 0, 3 0))', 0))

--caballos

INSERT INTO Raza([nombre])
VALUES('?rabe')

INSERT INTO Caballo([idCliente], [idRaza], [idParteCaballeriza], [nombre], [edad], [campoOcupado])
VALUES(1,1,2,'Komanche',8,geometry::STGeomFromText('POLYGON((1 3, 1 4, 2 4, 2 3, 1 3))', 0))

INSERT INTO Caballo([idCliente], [idRaza], [idParteCaballeriza], [nombre], [edad], [campoOcupado])
VALUES(1,1,3,'Tiro al blanco',10,geometry::STGeomFromText('POLYGON((2 3, 2 4, 3 4, 3 3, 2 3))', 0))

INSERT INTO Caballo([idCliente], [idRaza],  [idParteCaballeriza],[nombre], [edad], [campoOcupado])
VALUES(1,1,1,'Chispa',11,geometry::STGeomFromText('POLYGON((0 2, 0 3, 1 3, 1 2, 0 2))', 0))


INSERT INTO Caballo([idCliente], [idRaza],  [idParteCaballeriza],[nombre], [edad], [campoOcupado])
VALUES(1,1,1,'Chocolate',12,geometry::STGeomFromText('POLYGON((0 1, 0 2, 1 2, 1 1, 0 1))', 0))

INSERT INTO Caballo([idCliente], [idRaza],  [idParteCaballeriza],[nombre], [edad], [campoOcupado])
VALUES(1,1,1,'Paloma',20,geometry::STGeomFromText('POLYGON((0 4, 0 5, 1 5, 1 4, 0 4))', 0))



--Servicios de prueba para el procedimiento de listar servicios de ba?o
INSERT INTO Servicio(idCaballeriza, nombre, precio)
VALUES (1,'Caballeriza',12)

INSERT INTO Servicio(idCaballeriza, nombre, precio)
VALUES (1,'Alimentacion',12)

INSERT INTO Servicio(idCaballeriza, nombre, precio)
VALUES (1,'Cuidado Medico',12)

INSERT INTO Servicio( idCaballeriza, nombre, precio)
VALUES (1,'Aseo',12)

INSERT INTO Servicio(idCaballeriza, nombre, precio)
VALUES (1,'Suplementos Vitaminicos',12)

Insert into ServicioxCaballo(idServicio, idCaballo, realizado)
VALUES(4,1,0)

Insert into ServicioxCaballo(idServicio, idCaballo, realizado)
VALUES(4,2,0)

Insert into ServicioxCaballo(idServicio, idCaballo, realizado)
VALUES(4,3,0)

Insert into ServicioxCaballo(idServicio, idCaballo, realizado)
VALUES(3,1,0)



--Consulta del mapa con las partes divididas y los caballos
SELECT mapa FROM Caballeriza C
UNION all
SELECT campoEnCaballeriza FROM PartesCaballeriza 
UNION all
SELECT campoOcupado FROM Caballo

--Pruba procedimiento para consultar caballos vecinos
DECLARE @a INT;
EXEC ConsultarCaballosVecino 1,@a OUTPUT
SELECT @a


--Prueba del procedimiento ConsultarSlotVacio
DECLARE @a INT;
EXEC ConsultarSlotVacio 1, 1, @a OUTPUT
SELECT @a