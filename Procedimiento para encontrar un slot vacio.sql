USE [Caballeriza]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSlotVacio]    Script Date: 9/23/2021 10:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento que consulta los slots vacios
CREATE PROCEDURE ConsultarSlotVacio

	--parametros de entrada
	@inIdCaballeriza INT,
	@inIdParteCaballeriza INT,
	@outResult INT OUTPUT

AS

BEGIN
	
	--valida que el id de la caballeriza o la zona de la caballeriza no sea nula y que existan en la base de datos asociado al id dado
	IF (((@inIdParteCaballeriza) IS NULL) OR ((@inIdCaballeriza) IS NULL) OR (NOT EXISTS (SELECT id From PartesCaballeriza WHERE id = @inIdParteCaballeriza))
			OR (NOT EXISTS (SELECT id From Caballeriza WHERE id = @inIdCaballeriza)))
	BEGIN
		
		SET @outResult = 50005;
		RETURN @outResult;
	END

	--Declaracion de variables geometricas
	DECLARE @camposVacios geometry;
	DECLARE @ocupado geometry;
	
	
	--Captura el mapa de la parte de la caballeriza entrante
	SELECT @camposVacios = P.campoEnCaballeriza
	FROM PartesCaballeriza P
	WHERE Id = @inIdParteCaballeriza
	

	--Declaramos variables tabla para ir descartando los campos ocupados
	DECLARE @tabla TABLE (id INT IDENTITY(1,1), forma GEOMETRY)

	--Seteamos todos los resultados de caballos hospedados en esta parte de la caballeriza
	INSERT INTO @tabla(forma)
	SELECT C.campoOcupado
	FROM Caballo C
	WHERE idParteCaballeriza =  @inIdParteCaballeriza

	--Declaramos variables a usar para el ciclo
	DECLARE @lo INT = 1, @hi INT;
	
	--capturamos el maximo id de la tabla
	SELECT @hi = MAX(id) FROM @tabla;

	--convertimos el geometry de la parte de caballeriza a valido
	SET @camposVacios = @camposVacios.MakeValid()


	--Iniciamos el ciclo while, para ir descartando los campos ocupados
	WHILE (@lo<=@hi)
	BEGIN
		
		--capturamos el campo de un caballo ocupado de la variable tabla
		SELECT @ocupado = forma
		FROM @tabla
		WHERE id= @lo;

		--obtenemos la diferencia entre la parte de la caballeriza con la parte ocupada por el caballo
		SET @camposVacios = @camposVacios.STSymDifference(@ocupado);

		--incrementamos el contador
		SET @lo = @lo + 1;

	END

	--Consulta los campos que quedan vacíos
	SELECT @camposVacios;

END

/*
--como ejecutar el query
DECLARE @a INT
EXEC ConsultarSlotVacio 1, 1, @a OUTPUT
SELECT @a*/


