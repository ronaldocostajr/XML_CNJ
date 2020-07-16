CREATE OR REPLACE FUNCTION verifica_orgao_julgador_redistribuicao_G1(id_processo integer, dt_processo timestamp) RETURNS varchar AS $$
declare 
-- '236641';
	org_ds_sigla varchar;
	org_ds_orgao_julgador varchar;
	org_id_municipio_ibge_atual varchar;
		
	dt_evento timestamp;
	id_processo_redistribuido integer;
    tag_xml varchar;
begin
	id_processo_redistribuido 	:= id_processo;
	dt_evento 					:= dt_processo;

	Select 		serv_oj.cod_serventia, serv_oj.nom_org_julg, ib.id_municipio_ibge
	into 		org_ds_sigla, org_ds_orgao_julgador,org_id_municipio_ibge_atual
	from 		tb_proc_trf_redistribuicao redi
	LEFT JOIN 	tb_orgao_julgador oj ON 1=1
		and oj.id_orgao_julgador = redi.id_orgao_julgador_anterior
		and oj.in_posto_avancado = 'N'
		and oj.in_cejusc = 'N'
		and oj.ds_orgao_julgador not ilike '%plantonista%'
	INNER JOIN 	tb_jurisdicao_municipio jm ON 1=1 and jm.id_jurisdicao = oj.id_jurisdicao AND jm.in_sede = 'S'
	INNER JOIN 	tb_municipio_ibge ib ON 1=1 and ib.id_municipio = jm.id_municipio
	INNER JOIN 
		(
		select 19539 cod_serventia, 37 num_org_julg, '1ª Vara do Trabalho de Santa Rita' 		nom_org_julg union
		select 19523 cod_serventia, 46 num_org_julg, 'Vara do Trabalho de Catolé do Rocha' 		nom_org_julg union
		select 19540 cod_serventia, 38 num_org_julg, '2ª Vara do Trabalho de Santa Rita' 		nom_org_julg union
		select 19531 cod_serventia, 63 num_org_julg, '6ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19537 cod_serventia, 47 num_org_julg, 'Vara do Trabalho de Patos' 				nom_org_julg union
		select 19536 cod_serventia, 50 num_org_julg, '6ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19516 cod_serventia, 42 num_org_julg, 'Vara do Trabalho de Areia' 				nom_org_julg union
		select 19525 cod_serventia, 44 num_org_julg, 'Vara do Trabalho de Itabaiana' 			nom_org_julg union
		select 19526 cod_serventia, 43 num_org_julg, 'Vara do Trabalho de Itaporanga' 			nom_org_julg union
		select 19524 cod_serventia, 45 num_org_julg, 'Vara do Trabalho de Guarabira' 			nom_org_julg union
		select 19538 cod_serventia, 51 num_org_julg, 'Vara do Trabalho de Picuí' 				nom_org_julg union
		select 19541 cod_serventia, 48 num_org_julg, 'Vara do Trabalho de Sousa' 				nom_org_julg union
		select 19517 cod_serventia, 49 num_org_julg, 'Vara do Trabalho de Cajazeiras' 			nom_org_julg union
		select 19519 cod_serventia, 53 num_org_julg, '2ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19520 cod_serventia, 54 num_org_julg, '3ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19522 cod_serventia, 56 num_org_julg, '5ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19518 cod_serventia, 52 num_org_julg, '1ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19535 cod_serventia, 39 num_org_julg, 'Vara do Trabalho de Mamanguape' 			nom_org_julg union
		select 19521 cod_serventia, 55 num_org_julg, '4ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 19530 cod_serventia, 62 num_org_julg, '5ª Vara do Trabalho de João Pessoa' 		nom_org_julg union 
		select 19492 cod_serventia, 58 num_org_julg, '1ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19528 cod_serventia, 60 num_org_julg, '3ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19527 cod_serventia, 59 num_org_julg, '2ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19529 cod_serventia, 61 num_org_julg, '4ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19533 cod_serventia, 65 num_org_julg, '8ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 19534 cod_serventia, 66 num_org_julg, '9ª Vara do Trabalho de João Pessoa' 		nom_org_julg union
		select 74451 cod_serventia, 69 num_org_julg, '10ª Vara do Trabalho de João Pessoa' 		nom_org_julg union  
		select 77181 cod_serventia, 71 num_org_julg, '11ª Vara do Trabalho de João Pessoa' 		nom_org_julg union  
		select 80255 cod_serventia, 73 num_org_julg, '12ª Vara do Trabalho de João Pessoa' 		nom_org_julg union  
		select 80256 cod_serventia, 74 num_org_julg, '13ª Vara do Trabalho de João Pessoa' 		nom_org_julg union  
		select 80257 cod_serventia, 75 num_org_julg, '7ª Vara do Trabalho de Campina Grande' 	nom_org_julg union
		select 80258 cod_serventia, 72 num_org_julg, '2ª Vara do Trabalho de Santa Rita' 		nom_org_julg union
		select 19532 cod_serventia, 64 num_org_julg, '7ª Vara do Trabalho de João Pessoa' 		nom_org_julg
		) serv_oj on 1=1 and serv_oj.num_org_julg = redi.id_orgao_julgador_anterior
	where redi.id_processo_trf = id_processo_redistribuido
	and   date_trunc('minute',redi.dt_redistribuicao) >= date_trunc('minute',dt_evento)
	order by redi.dt_redistribuicao asc
	limit 1;
	
	IF org_ds_sigla is not null THEN
		tag_xml := concat('<orgaoJulgador codigoOrgao="',org_ds_sigla,'" nomeOrgao="',org_ds_orgao_julgador,'" instancia="ORIG" codigoMunicipioIBGE="',org_id_municipio_ibge_atual,'"/>' );
	ELSE
		tag_xml := '';
	END IF;  

	RETURN tag_xml;

end
$$ language plpgsql;