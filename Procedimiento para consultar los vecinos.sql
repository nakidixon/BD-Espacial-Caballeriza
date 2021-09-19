--Procedimiento para consultar los caballos vecinos de uno
--Recibe el id del caballo que se desea saber los vecinos
CREATE PROCEDURE ConsultarCaballosVecino

	@inIdCaballo INT,
	@outResult INT OUTPUT

AS

BEGIN
	
	--valida que el id entrante no sea nulo, y que el caballo realmente exista
	IF (((@inIdCaballo) IS NULL) OR (NOT EXISTS (SELECT id From Caballo WHERE id = @inIdCaballo)))
	BEGIN
		
		--solo si sucede error retorna el codigo de out Result
		SET @outResult = 50005;
		RETURN @outResult;
	END


	--Selecciona los nombres de los caballos vecinos del caballo ingresado
	--Se realiza una consulta a la misma tabla de caballos para validar los vecinos
	SELECT C2.nombre AS "Vecinos"
	FROM Caballo C1, Caballo C2
	WHERE C1.campoOcupado.STTouches (C2.campoOcupado) = 1  --Función de sql server, retorna uno cuando son vecinos
	AND C1.id = @inIdCaballo

END