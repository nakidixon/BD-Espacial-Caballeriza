
--Procedimiento que lista los servicios de baño por hacer, en orden de importancia de Parte caballeriza
CREATE PROCEDURE EmpleadoBano
	
	--Parámetros de entrada
    @outResult INT OUTPUT

AS
BEGIN

	--Consulta ell nombre del caballo, su edad y en que parte de la caballeriza se encuentra
    SELECT C.nombre AS 'Caballo', C.edad, P.nombre AS 'Parte Caballeriza'
	FROM servicioxCaballo SxC 
	INNER JOIN Caballo C ON C.id = SxC.idCaballo
	INNER JOIN PartesCaballeriza P ON P.id = C.idParteCaballeriza
	WHERE SxC.realizado = 0 AND SxC.idservicio = 4
    ORDER BY P.id	--los ordena por importancia de parte de caballeriza

	SET @outResult = 0;

END

/*Como llamarlo
declare @a int
EXEC EmpleadoBano @a OUTPUT
SELECT @a as error
*/