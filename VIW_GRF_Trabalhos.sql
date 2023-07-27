
/*
===============================================================
Retorna Todos os Trabalhos Não Excluídos, Exceto os Históricos
=============================================================== 
*/

IF OBJECT_ID ( 'dbo.VIW_GRF_Trabalhos') IS NOT NULL DROP VIEW dbo.VIW_GRF_Trabalhos
GO

CREATE VIEW dbo.VIW_GRF_Trabalhos

WITH ENCRYPTION
  
AS

select TB.*
from   GRF_Trabalhos TB 
where  TB.fk_trabalho_alt_seq is null
and    TB.dt_exclusao         is null

