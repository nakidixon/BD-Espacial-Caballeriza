USE [Caballeriza]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSlotVacio]    Script Date: 9/23/2021 8:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ConsultarSlotVacio]

	@inIdParteCaballeriza INT,
	@outResult INT OUTPUT

AS

BEGIN
	
	IF (((@inIdParteCaballeriza) IS NULL) OR (NOT EXISTS (SELECT id From PartesCaballeriza WHERE id = @inIdParteCaballeriza)))
	BEGIN
		
		SET @outResult = 50005;
		RETURN @outResult;
	END

	DECLARE @C geometry;
	DECLARE @PC geometry;
	DECLARE @CO geometry;
	DECLARE @X geometry;
	--Saca todos los caballos ya inserados en la caballeriza
	SELECT @CO = campoOcupado FROM Caballo 
	SELECT @C = mapa FROM Caballeriza 
	SELECT @PC = campoEnCaballeriza FROM PartesCaballeriza WHERE id= 3 --@inIdParteCaballeriza
	SELECT @X = @CO.STSymDifference(@C)	--Saca la zona solicitada de la caballeriza
	
	--Imprimel el  
	SELECT @X 
	UNION ALL
	SELECT @PC

END

DECLARE @a INT;
EXEC ConsultarSlotVacio 3, @a OUTPUT
SELECT @a

