CREATE OR REPLACE FUNCTION verifica_orgao_julgador_redistribuicao_G2(id_processo integer, dt_processo timestamp, tp_inst varchar) RETURNS varchar AS $$
declare 
-- '54991';
	org_ds_sigla varchar;
	org_ds_orgao_julgador varchar;
	org_ds_orgao_julgador_colegiado varchar;	
	org_id_municipio_ibge_atual varchar;
		
	dt_evento timestamp;
	id_processo_redistribuido integer;
    tag_xml varchar;

begin
	id_processo_redistribuido 	:= id_processo;
	dt_evento 					:= dt_processo;
	tag_xml 					:= '';
	org_id_municipio_ibge_atual := '2507507';
 

	Select serv_oj.cod_serventia, serv_oj.nom_org_julg, ib.id_municipio_ibge
	into org_ds_sigla, org_ds_orgao_julgador,org_id_municipio_ibge_atual
		from tb_proc_trf_redistribuicao redi
		LEFT JOIN tb_orgao_julgador oj ON 1=1
			and oj.id_orgao_julgador = redi.id_orgao_julgador_anterior
			and oj.in_posto_avancado = 'N'
			and oj.in_cejusc = 'N'
			and oj.ds_orgao_julgador not ilike '%plantonista%'
			INNER JOIN tb_jurisdicao_municipio jm ON 1=1 and jm.id_jurisdicao = oj.id_jurisdicao AND jm.in_sede = 'S'
			INNER JOIN tb_municipio_ibge ib ON 1=1 and ib.id_municipio = jm.id_municipio
		INNER JOIN 
			(
			select 70700 cod_serventia, 45 num_org_julg, 'Gabinete do Desembargador Thiago de Oliveira Andrade' 			nom_org_julg union
			select 70705 cod_serventia, 59 num_org_julg, 'Gabinete do Desembargador Leonardo José Videres Trajano' 			nom_org_julg union
			select 70701 cod_serventia, 55 num_org_julg, 'Gabinete do Desembargador Paulo Maia Filho' 						nom_org_julg union
			select 71253 cod_serventia, 51 num_org_julg, 'Gabinete da Desembargadora Ana Maria Ferreira Madruga' 			nom_org_julg union
			select 70698 cod_serventia, 56 num_org_julg, 'Gabinete do Desembargador Carlos Coelho de Miranda Freire' 		nom_org_julg union
			select 70703 cod_serventia, 50 num_org_julg, 'Gabinete do Desembargador Eduardo Sérgio de Almeida' 				nom_org_julg union
			select 70699 cod_serventia, 49 num_org_julg, 'Gabinete do Desembargador Edvaldo de Andrade' 					nom_org_julg union
			select 70697 cod_serventia, 52 num_org_julg, 'Gabinete do Desembargador Francisco de Assis Carvalho e Silva' 	nom_org_julg union
			select 70702 cod_serventia, 54 num_org_julg, 'Gabinete do Desembargador Ubiratan Moreira Delgado' 				nom_org_julg union
			select 77697 cod_serventia, 57 num_org_julg, 'Gabinete da Presidência' 											nom_org_julg union
			select 77698 cod_serventia, 58 num_org_julg, 'Gabinete da Vice-Presidência' 									nom_org_julg union
			select 70704 cod_serventia, 53 num_org_julg, 'Gabinete do Desembargador Wolney de Macedo Cordeiro' 				nom_org_julg
			) serv_oj on 1=1 and serv_oj.num_org_julg = redi.id_orgao_julgador_anterior
		where redi.id_processo_trf = id_processo_redistribuido
		and   date_trunc('minute',redi.dt_redistribuicao) >= date_trunc('minute',dt_evento)
		order by redi.dt_redistribuicao asc
		limit 1;

		IF org_ds_sigla is not null THEN
			tag_xml := concat('<orgaoJulgador codigoOrgao="',org_ds_sigla,'" nomeOrgao="',org_ds_orgao_julgador,'" instancia="',tp_inst,'" codigoMunicipioIBGE="',org_id_municipio_ibge_atual,'"/>' );
		ELSE
			tag_xml := '';
		END IF;  

	RETURN tag_xml;

END
$$ language plpgsql;