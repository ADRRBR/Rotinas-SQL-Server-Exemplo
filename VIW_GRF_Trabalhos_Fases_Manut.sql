
/*
============================================================================================
Retorna Todos os Trabalhos Não Excluídos com suas Fases de Manutenção, Exceto os Históricos
============================================================================================
*/

IF OBJECT_ID ( 'dbo.VIW_GRF_Trabalhos_Fases_Manut') IS NOT NULL DROP VIEW dbo.VIW_GRF_Trabalhos_Fases_Manut
GO

CREATE VIEW dbo.VIW_GRF_Trabalhos_Fases_Manut

WITH ENCRYPTION
  
AS

select	     TB.pk_trabalho	                        TB_pk_trabalho	
			,TB.fk_trabalho_alt_seq	                TB_fk_trabalho_alt_seq	
			,TB.fk_trabalho_tipo	                TB_fk_trabalho_tipo	
			,TB_R_TT.nome                           TB_R_TT_tipo_trabalho
			,TB.fk_produto	                        TB_fk_produto	
			,TB_R_P.nome                            TB_R_P_produto
			,TB.fk_cliente	                        TB_fk_cliente	
			,TB_R_C.nome                            TB_R_C_cliente
			,TB.fk_representante	                TB_fk_representante	
			,TB_R_R.nome                            TB_R_R_representante
			,TB.fk_aprovacao_tipo	                TB_fk_aprovacao_tipo	
			,TB_R_AT.nome                           TB_R_AT_aprovacao_tipo
			,TB.fk_filial                           TB_fk_filial
			,TB_R_F.nome                            TB_R_F_filial
			,TB.num_pedido	                        TB_num_pedido	
			,TB.num_pedido_antigo                   TB_num_pedido_antigo	
			,TB.num_pedido_novo	                    TB_num_pedido_novo	
			,TB.lead_time_programado                TB_lead_time_programado	
			,TB.dt_inclusao    	                    TB_dt_inclusao    	
			,TB.dt_alteracao	                    TB_dt_alteracao	
			,TB.dt_exclusao	                        TB_dt_exclusao	
             ------------------------------------------------------------------------------------------
			,FM1.pk_trabalho_fase_manut1            FM1_pk_trabalho_fase_manut1	
			,FM1.fk_trabalho_fase_manut1_alt_seq	FM1_fk_trabalho_fase_manut1_alt_seq	
			,FM1.fk_trabalho                        FM1_fk_trabalho
			,FM1.fk_fase                      	    FM1_fk_fase
			,FM1_R_F.nome                           FM1_R_F_fase
			,FM1.fk_operador	                    FM1_fk_operador	
			,FM1_R_O.VCH_NOME                       FM1_R_O_operador                         
			,FM1.cores_alteradas	                FM1_cores_alteradas	
			,FM1.circ_cilindro	                    FM1_circ_cilindro	
			,FM1.observacoes	                    FM1_observacoes	
			,FM1.dt_inclusao	                    FM1_dt_inclusao	
			,FM1.dt_alteracao	                    FM1_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM2.pk_trabalho_fase_manut2	        FM2_pk_trabalho_fase_manut2	
			,FM2.fk_trabalho_fase_manut2_alt_seq	FM2_fk_trabalho_fase_manut2_alt_seq	
			,FM2.fk_trabalho	                    FM2_fk_trabalho	
			,FM2.fk_fase                      	    FM2_fk_fase	
			,FM2_R_F.nome                           FM2_R_F_fase
			,FM2.fk_operador	                    FM2_fk_operador	
			,FM2_R_O.VCH_NOME                       FM2_R_O_operador  
			,FM2.observacoes	                    FM2_observacoes	
			,FM2.dt_inclusao	                    FM2_dt_inclusao	
			,FM2.dt_alteracao	                    FM2_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM3.pk_trabalho_fase_manut3	        FM3_pk_trabalho_fase_manut3	
			,FM3.fk_trabalho_fase_manut3_alt_seq	FM3_fk_trabalho_fase_manut3_alt_seq	
			,FM3.fk_trabalho	                    FM3_fk_trabalho	
			,FM3.fk_fase	                        FM3_fk_fase	
			,FM3_R_F.nome                           FM3_R_F_fase
			,FM3.fk_operador	                    FM3_fk_operador	
			,FM3_R_O.VCH_NOME                       FM3_R_O_operador  
			,FM3.observacoes	                    FM3_observacoes	
			,FM3.dt_inclusao	                    FM3_dt_inclusao	
			,FM3.dt_alteracao	                    FM3_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM4.pk_trabalho_fase_manut4	        FM4_pk_trabalho_fase_manut4	
			,FM4.fk_trabalho_fase_manut4_alt_seq	FM4_fk_trabalho_fase_manut4_alt_seq	
			,FM4.fk_trabalho	                    FM4_fk_trabalho	
			,FM4.fk_fase	                        FM4_fk_fase	
			,FM4_R_F.nome                           FM4_R_F_fase
			,FM4.fk_operador	                    FM4_fk_operador	
			,FM4_R_O.VCH_NOME                       FM4_R_O_operador  
			,FM4.observacoes	                    FM4_observacoes	
			,FM4.dt_inclusao	                    FM4_dt_inclusao	
			,FM4.dt_alteracao	                    FM4_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM5.pk_trabalho_fase_manut5	        FM5_pk_trabalho_fase_manut5	
			,FM5.fk_trabalho_fase_manut5_alt_seq	FM5_fk_trabalho_fase_manut5_alt_seq	
			,FM5.fk_trabalho	                    FM5_fk_trabalho	
			,FM5.fk_fase	                        FM5_fk_fase	
			,FM5_R_F.nome                           FM5_R_F_fase
			,FM5.fk_operador	                    FM5_fk_operador	
			,FM5_R_O.VCH_NOME                       FM5_R_O_operador  
			,FM5.observacoes	                    FM5_observacoes	
			,FM5.dt_inclusao	                    FM5_dt_inclusao	
			,FM5.dt_alteracao	                    FM5_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM6.pk_trabalho_fase_manut6	        FM6_pk_trabalho_fase_manut6	
			,FM6.fk_trabalho_fase_manut6_alt_seq	FM6_fk_trabalho_fase_manut6_alt_seq	
			,FM6.fk_trabalho	                    FM6_fk_trabalho	
			,FM6.fk_fase	                        FM6_fk_fase	
			,FM6_R_F.nome                           FM6_R_F_fase
			,FM6.fk_operador	                    FM6_fk_operador
			,FM6_R_O.VCH_NOME                       FM6_R_O_operador  	
			,FM6.observacoes	                    FM6_observacoes	
			,FM6.dt_inclusao	                    FM6_dt_inclusao	
			,FM6.dt_alteracao	                    FM6_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM7.pk_trabalho_fase_manut7	        FM7_pk_trabalho_fase_manut7	
			,FM7.fk_trabalho_fase_manut7_alt_seq	FM7_fk_trabalho_fase_manut7_alt_seq	
			,FM7.fk_trabalho	                    FM7_fk_trabalho	
			,FM7.fk_fase	                        FM7_fk_fase	
			,FM7_R_F.nome                           FM7_R_F_fase
			,FM7.fk_operador	                    FM7_fk_operador	
			,FM7_R_O.VCH_NOME                       FM7_R_O_operador  
			,FM7.observacoes	                    FM7_observacoes	
			,FM7.dt_inclusao	                    FM7_dt_inclusao	
			,FM7.dt_alteracao	                    FM7_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM8.pk_trabalho_fase_manut8	        FM8_pk_trabalho_fase_manut8	
			,FM8.fk_trabalho_fase_manut8_alt_seq	FM8_fk_trabalho_fase_manut8_alt_seq	
			,FM8.fk_trabalho	                    FM8_fk_trabalho	
			,FM8.fk_fase	                        FM8_fk_fase	
			,FM8_R_F.nome                           FM8_R_F_fase
			,FM8.fk_operador	                    FM8_fk_operador	
			,FM8_R_O.VCH_NOME                       FM8_R_O_operador  
			,FM8.observacoes	                    FM8_observacoes	
			,FM8.dt_inclusao	                    FM8_dt_inclusao	
			,FM8.dt_alteracao	                    FM8_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM9.pk_trabalho_fase_manut9	        FM9_pk_trabalho_fase_manut9	
			,FM9.fk_trabalho_fase_manut9_alt_seq	FM9_fk_trabalho_fase_manut9_alt_seq	
			,FM9.fk_trabalho	                    FM9_fk_trabalho	
			,FM9.fk_fase	                        FM9_fk_fase	
			,FM9_R_F.nome                           FM9_R_F_fase
			,FM9.fk_operador	                    FM9_fk_operador	
			,FM9_R_O.VCH_NOME                       FM9_R_O_operador  
			,FM9.fk_avaliacao_tipo	                FM9_fk_avaliacao_tipo	
			,FM9.dt_avaliacao 	                    FM9_dt_avaliacao
			,FM9_R_AT.nome                          FM9_R_AT_avaliacao_tipo
			,FM9.dt_envio_cliente	                FM9_dt_envio_cliente	
			,FM9.dt_envio_padroes_CQ	            FM9_dt_envio_padroes_CQ	
			,FM9.observacoes	                    FM9_observacoes	
			,FM9.dt_inclusao	                    FM9_dt_inclusao	
			,FM9.dt_alteracao	                    FM9_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM10.pk_trabalho_fase_manut10       	FM10_pk_trabalho_fase_manut10	
			,FM10.fk_trabalho_fase_manut10_alt_seq	FM10_fk_trabalho_fase_manut10_alt_seq	
			,FM10.fk_trabalho	                    FM10_fk_trabalho	
			,FM10.fk_fase	                        FM10_fk_fase	
			,FM10_R_F.nome                          FM10_R_F_fase
			,FM10.fk_operador	                    FM10_fk_operador	
			,FM10_R_O.VCH_NOME                      FM10_R_O_operador  
			,FM10.total_cores 	                    FM10_total_cores	
			,FM10.observacoes	                    FM10_observacoes	
			,FM10.dt_inclusao	                    FM10_dt_inclusao	
			,FM10.dt_alteracao	                    FM10_dt_alteracao	
             ------------------------------------------------------------------------------------------	
			,FM11.pk_trabalho_fase_manut11	        FM11_pk_trabalho_fase_manut11	
			,FM11.fk_trabalho_fase_manut11_alt_seq	FM11_fk_trabalho_fase_manut11_alt_seq	
			,FM11.fk_trabalho	                    FM11_fk_trabalho	
			,FM11.fk_fase	                        FM11_fk_fase	
			,FM11_R_F.nome                          FM11_R_F_fase
			,FM11.fk_operador	                    FM11_fk_operador
			,FM11_R_O.VCH_NOME                      FM11_R_O_operador  	
			,FM11.observacoes	                    FM11_observacoes	
			,FM11.dt_inclusao	                    FM11_dt_inclusao	
			,FM11.dt_alteracao	                    FM11_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,FM12.pk_trabalho_fase_manut12	        FM12_pk_trabalho_fase_manut12	
			,FM12.fk_trabalho_fase_manut12_alt_seq	FM12_fk_trabalho_fase_manut12_alt_seq	
			,FM12.fk_trabalho	                    FM12_fk_trabalho	
			,FM12.fk_fase	                        FM12_fk_fase	
			,FM12_R_F.nome                          FM12_R_F_fase
			,FM12.fk_operador	                    FM12_fk_operador	
			,FM12_R_O.VCH_NOME                      FM12_R_O_operador  
			,FM12.fk_avaliacao_tipo	                FM12_fk_avaliacao_tipo	
			,FM12.dt_avaliacao 	                    FM12_dt_avaliacao
			,FM12_R_AT.nome                         FM12_R_AT_avaliacao_tipo
			,FM12.dt_receb_rolinho	                FM12_dt_receb_rolinho	
			,FM12.dt_envio_laminacao	            FM12_dt_envio_laminacao	
			,FM12.dt_receb_laminacao	            FM12_dt_receb_laminacao
			,FM12.dt_envio_padroes_cliente	        FM12_dt_envio_padroes_cliente
			,FM12.dt_envio_padroes_CQ	            FM12_dt_envio_padroes_CQ	
			,FM12.observacoes	                    FM12_observacoes	
			,FM12.dt_inclusao	                    FM12_dt_inclusao	
			,FM12.dt_alteracao	                    FM12_dt_alteracao	
             ------------------------------------------------------------------------------------------
			,GEN.pk_trabalho_fase_manut_gen         GEN_pk_trabalho_fase_manut_gen
			,GEN.fk_trabalho_fase_manut_gen_alt_seq GEN_fk_trabalho_fase_manut_gen_alt_seq
			,GEN.fk_trabalho                        GEN_fk_trabalho
			,GEN.fk_fase                            GEN_fk_fase
			,GEN_R_F.nome                           GEN_R_F_fase
			,GEN.fk_operador                        GEN_fk_operador
			,GEN_R_O.VCH_NOME                       GEN_R_O_operador  
			,GEN.dt_liberacao_gravacao              GEN_dt_liberacao_gravacao
			,GEN.dt_inclusao                        GEN_dt_inclusao
			,GEN.dt_alteracao                       GEN_dt_alteracao
             ------------------------------------------------------------------------------------------
			,TFSO.pk_trabalho_fase_status           TFSO_pk_trabalho_fase_status_operador
			,TFSO.fk_trabalho_fase_status_tipo      TFSO_fk_trabalho_fase_status_tipo_operador
			,TFSO.tipo_status                       TFSO_tipo_status_operador
            ,TFSO.pk_fase                           TFSO_pk_fase_operador
            ,TFSO.numero_fase                       TFSO_codigo_fase_operador
            ,TFSO.nome_fase                         TFSO_nome_fase_operador
			,TFSO.fk_operador                       TFSO_fk_operador_status
			,TFSO.nome_operador                     TFSO_nome_operador_status 
			,TFSO.observacao_status                 TFSO_observacao_status
			,TFSO.data_inclusao_status              TFSO_data_inclusao_status
		     ------------------------------------------------------------------------------------------
			,TFSA.pk_trabalho_fase_status           TFSA_pk_trabalho_fase_status_atual
			,TFSA.fk_trabalho_fase_status_tipo      TFSA_fk_trabalho_fase_status_tipo_atual
			,TFSA.tipo_status                       TFSA_tipo_status_atual
            ,TFSA.pk_fase                           TFSA_pk_fase_atual
            ,TFSA.numero_fase                       TFSA_codigo_fase_atual
            ,TFSA.nome_fase                         TFSA_nome_fase_atual
             ------------------------------------------------------------------------------------------
from         VIW_GRF_Trabalhos						TB
left join    VIW_GRF_Trabalhos_Fases_Manut1			FM1       on FM1.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut2			FM2       on FM2.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut3			FM3       on FM3.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut4			FM4       on FM4.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut5			FM5       on FM5.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut6			FM6       on FM6.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut7			FM7       on FM7.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut8			FM8       on FM8.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut9			FM9       on FM9.fk_trabalho              = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut10		FM10      on FM10.fk_trabalho             = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut11		FM11      on FM11.fk_trabalho             = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut12		FM12      on FM12.fk_trabalho             = TB.pk_trabalho
left join    VIW_GRF_Trabalhos_Fases_Manut_Generico GEN       on GEN.fk_trabalho              = TB.pk_trabalho
left join    GRF_Trabalhos_Tipos                    TB_R_TT   on TB_R_TT.pk_trabalho_tipo     = TB.fk_trabalho_tipo 
left join    GRF_Produtos                           TB_R_P    on TB_R_P.pk_produto            = TB.fk_produto 
left join    GRF_Clientes                           TB_R_C    on TB_R_C.pk_cliente            = TB.fk_cliente
left join    GRF_Representantes						TB_R_R    on TB_R_R.pk_representante      = TB.fk_representante
left join    GRF_Aprovacao_Tipos					TB_R_AT   on TB_R_AT.pk_aprovacao_tipo    = TB.fk_aprovacao_tipo 
left join    GRF_Filiais							TB_R_F    on TB_R_F.pk_filial             = TB.fk_filial
left join    GRF_Fases								FM1_R_F   on FM1_R_F.pk_fase              = FM1.fk_fase
left join    GRF_Fases								FM2_R_F   on FM2_R_F.pk_fase              = FM2.fk_fase
left join    GRF_Fases								FM3_R_F   on FM3_R_F.pk_fase              = FM3.fk_fase
left join    GRF_Fases								FM4_R_F   on FM4_R_F.pk_fase              = FM4.fk_fase
left join    GRF_Fases								FM5_R_F   on FM5_R_F.pk_fase              = FM5.fk_fase
left join    GRF_Fases								FM6_R_F   on FM6_R_F.pk_fase              = FM6.fk_fase
left join    GRF_Fases								FM7_R_F   on FM7_R_F.pk_fase              = FM7.fk_fase
left join    GRF_Fases								FM8_R_F   on FM8_R_F.pk_fase              = FM8.fk_fase
left join    GRF_Fases								FM9_R_F   on FM9_R_F.pk_fase              = FM9.fk_fase
left join    GRF_Fases								FM10_R_F  on FM10_R_F.pk_fase             = FM10.fk_fase
left join    GRF_Fases								FM11_R_F  on FM11_R_F.pk_fase             = FM11.fk_fase
left join    GRF_Fases								FM12_R_F  on FM12_R_F.pk_fase             = FM12.fk_fase
left join    GRF_Fases								GEN_R_F   on GEN_R_F.pk_fase              = GEN.fk_fase
left join    GRF_Avaliacao_Tipos					FM9_R_AT  on FM9_R_AT.pk_avaliacao_tipo   = FM9.fk_avaliacao_tipo   
left join    GRF_Avaliacao_Tipos					FM12_R_AT on FM12_R_AT.pk_avaliacao_tipo  = FM12.fk_avaliacao_tipo   
left join    APL_USUARIOS							FM1_R_O   on FM1_R_O.PK_USUARIO           = FM1.fk_operador
left join    APL_USUARIOS							FM2_R_O   on FM2_R_O.PK_USUARIO           = FM2.fk_operador
left join    APL_USUARIOS							FM3_R_O   on FM3_R_O.PK_USUARIO           = FM3.fk_operador
left join    APL_USUARIOS							FM4_R_O   on FM4_R_O.PK_USUARIO           = FM4.fk_operador
left join    APL_USUARIOS							FM5_R_O   on FM5_R_O.PK_USUARIO           = FM5.fk_operador
left join    APL_USUARIOS							FM6_R_O   on FM6_R_O.PK_USUARIO           = FM6.fk_operador
left join    APL_USUARIOS							FM7_R_O   on FM7_R_O.PK_USUARIO           = FM7.fk_operador
left join    APL_USUARIOS							FM8_R_O   on FM8_R_O.PK_USUARIO           = FM8.fk_operador
left join    APL_USUARIOS							FM9_R_O   on FM9_R_O.PK_USUARIO           = FM9.fk_operador
left join    APL_USUARIOS							FM10_R_O  on FM10_R_O.PK_USUARIO          = FM10.fk_operador
left join    APL_USUARIOS							FM11_R_O  on FM11_R_O.PK_USUARIO          = FM11.fk_operador
left join    APL_USUARIOS							FM12_R_O  on FM12_R_O.PK_USUARIO          = FM12.fk_operador
left join    APL_USUARIOS							GEN_R_O   on GEN_R_O.PK_USUARIO           = GEN.fk_operador
left join    VIW_GRF_Trabalhos_Status				TFSO      on TFSO.pk_trabalho_fase_status = dbo.FNC_GRF_Trabalho_Fase_Status_Ultimo_Operador(TB.pk_trabalho)
left join    VIW_GRF_Trabalhos_Status				TFSA      on TFSA.pk_trabalho_fase_status = dbo.FNC_GRF_Trabalho_Fase_Status_Atual(TB.pk_trabalho)



