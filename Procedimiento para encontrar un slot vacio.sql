USE [Caballeriza]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSlotVacio]    Script Date: 9/23/2021 10:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE ALTER PROCEDURE ConsultarSlotVacio

	@inIdCaballeriza INT,
	@inIdParteCaballeriza INT,
	@outResult INT OUTPUT

AS

BEGIN
	
	--valida que el id de la caballeriza o la zona de la caballeriza no sea nula y que existan en la base de datos asociado al id dado
	IF (((@inIdParteCaballeriza) IS NULL) OR ((@inIdCaballeriza) IS NULL) OR (NOT EXISTS (SELECT id From PartesCaballeriza WHERE id = @inIdParteCaballeriza)) OR (NOT EXISTS (SELECT id From Caballeriza WHERE id = @inIdCaballeriza)))
	BEGIN
		
		SET @outResult = 50005;
		RETURN @outResult;
	END

	--Declaracion de variables geometricas
	DECLARE @vCampoOcupado geometry;
	DECLARE @vParteCaballeriza geometry;
	DECLARE @vCaballeriza geometry;
	DECLARE @vInterseccion geometry;

	
	SELECT  * FROM PartesCaballeriza P, Caballo C
	WHERE P.campoEnCaballeriza.STContains( C.campoOcupado)=1
	
	/*
	SELECT @vCampoOcupado = MULTIPOLYGON (campoOcupado) FROM Caballo --Saca todos los caballos ya inserados en la caballeriza
	SELECT @vCaballeriza = mapa FROM Caballeriza where id= @inIdCaballeriza--Saca todos l
	SELECT @vParteCaballeriza = campoEnCaballeriza FROM PartesCaballeriza WHERE id= @inIdParteCaballeriza --Destaca la zona seleccionada por el usuario
	SELECT @vInterseccion = @vCampoOcupado.STSymDifference(@vCaballeriza)	--Saca la zona solicitada de la caballeriza
	*/
	--Despliega el mapa completo senalando los slots vacios por ubicacion
	--SELECT @vInterseccion
	--UNION ALL
	--SELECT @vParteCaballeriza

END


