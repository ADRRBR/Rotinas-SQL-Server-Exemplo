
/*
==========================================================================================
Retorna a Chave Primária do Status em que se Encontra Atualmente a Fase Atual do Trabalho  
==========================================================================================
*/

IF OBJECT_ID ( 'dbo.FNC_GRF_Trabalho_Fase_Status_Atual') IS NOT NULL DROP FUNCTION dbo.FNC_GRF_Trabalho_Fase_Status_Atual
GO  

CREATE FUNCTION dbo.FNC_GRF_Trabalho_Fase_Status_Atual (
                                                        @pk_trabalho INT
                                                       )  
RETURNS INT

WITH ENCRYPTION
  
AS

BEGIN
	declare @pk_trabalho_fase_status_atual int

	select       @pk_trabalho_fase_status_atual = max(pk_trabalho_fase_status)
	from         VIW_GRF_Trabalhos_Status
	where        pk_trabalho = @pk_trabalho
		   
    RETURN(isnull(@pk_trabalho_fase_status_atual,0))
END
