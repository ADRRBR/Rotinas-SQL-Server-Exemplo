
/*
====================================================================================================
Retorna a Chave Primária do Último Status Modificado por um Operador, Para a Fase Atual do Trabalho  
====================================================================================================
*/

IF OBJECT_ID ( 'dbo.FNC_GRF_Trabalho_Fase_Status_Ultimo_Operador') IS NOT NULL DROP FUNCTION dbo.FNC_GRF_Trabalho_Fase_Status_Ultimo_Operador
GO  

CREATE FUNCTION dbo.FNC_GRF_Trabalho_Fase_Status_Ultimo_Operador (
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
	and          fk_operador is not null
		   
    RETURN(isnull(@pk_trabalho_fase_status_atual,0))
END
