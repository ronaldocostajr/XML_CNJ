CREATE OR REPLACE FUNCTION verifica_pai_nacional(cod integer) RETURNS varchar AS $$
declare
	codMovimento			varchar;
	codComplemento 			varchar;
	descricaoComplemento 	varchar;
	codComplementoTabelado 	varchar;

begin		
	codMovimento 			:= cast(cod as varchar);
	codComplemento 			:= '';
	descricaoComplemento 	:= '';
	codComplementoTabelado 	:= '';

	IF codMovimento = '92' THEN
	  IF codComplemento = '5041' THEN
		 codComplemento := '14';
	  END IF;
	  IF codComplemento not in ('5','14') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '5';
	  END IF;
	ELSIF codMovimento = '928' THEN
	  IF codComplemento not in ('5','14') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '5';
	  END IF;
	ELSIF codMovimento = '10966' THEN
	  IF codComplemento not in ('26','27') or coalesce(codComplemento,'') = '' THEN		
			codComplemento := '26';
	  END IF;		
	ELSIF codMovimento in ('12260','1061','1062','848') THEN
		codComplemento := '14';
	ELSIF codMovimento = '1051' THEN
	  IF codComplemento = '5045' THEN
		 codComplemento := '14';
	  END IF;
	  IF codComplemento not in ('1','14') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '1';
	  END IF;
	ELSIF codMovimento = '190' THEN
	  IF codComplemento not in ('10','14') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '10';
	  END IF;
	ELSIF codMovimento = '945' THEN
	  IF codComplemento not in ('10','14') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '10';
	  END IF;
	ELSIF codMovimento = '970' THEN
	  IF trim(codComplemento) = '5005' THEN
		codComplemento := '12';
	  END IF;
	  IF codComplemento not in ('12','15','16','21','36') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '15';
	  END IF;
	ELSIF codMovimento = '417' THEN
	  IF codComplemento not in ('12','21') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '12';
	  END IF;
	ELSIF codMovimento in ('311','313') THEN
	  IF codComplemento not in ('12','15','21') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '12';
	  END IF;
	ELSIF codMovimento in ('493','12214') THEN
		 codComplemento := '13';
	ELSIF codMovimento in ('11424','11423','12476','11425','11426') THEN
	  IF codComplemento not in ('31','32') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '31';
	  END IF;		
	ELSIF codMovimento in ('978','12622') THEN
		 codComplemento := '7';		  
	ELSIF codMovimento = '982' THEN
	  IF codComplemento not in ('7','18') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '18';
	  END IF;
	ELSIF codMovimento = '123' THEN
	  IF codComplemento not in ('7','18','19') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '18';
	  END IF;
	ELSIF codMovimento = '980' THEN
		 codComplemento := '7';
	ELSIF codMovimento = '12296' THEN
		 codComplemento := '34';
	ELSIF codMovimento = '36' THEN
	  IF codComplemento not in ('2','17') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '17';
	  END IF;
	ELSIF codMovimento = '11983' THEN
		 codComplemento := '25';
	ELSIF codMovimento = '12257' THEN
		 codComplemento := '33';
	ELSIF codMovimento in ('11796','12421') THEN
		 codComplemento := '20';
	ELSIF codMovimento in ('135','137') THEN
	  IF codComplemento not in ('8','9') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '8';
	  END IF;
	ELSIF codMovimento = '861' THEN
	  codComplemento := '9';
	ELSIF codMovimento = '265' THEN
	  IF codComplemento not in ('28','29') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '28';
	  END IF;
	ELSIF codMovimento = '11975' THEN
	  IF codComplemento not in ('22','28','30') or coalesce(codComplemento,'') = '' THEN
		 codComplemento := '22';
	  END IF;
	ELSIF codMovimento in ('106','112') THEN
	  codComplemento := '6';
	ELSIF codMovimento  = '12658' THEN
	  codComplemento := '38';
	ELSIF codMovimento = '51' THEN
	  codComplemento := '3';
	ELSIF codMovimento = '873' THEN
	  codComplemento := '23';
	ELSIF codMovimento = '26' THEN
	  codComplemento := '2';
	ELSIF codMovimento in ('60','581') THEN
		 codComplemento := '4';
	ELSIF codMovimento = '12479' THEN
	  codComplemento := '32';
	ELSIF codMovimento = '85' THEN
	  codComplemento := '19';
	ELSIF codMovimento = '12657' THEN
	  codComplemento := '37';
	ELSIF codMovimento in ('12616','12446','334','787','818','442','11415','450','451','452','453','443','444','11554','445','242','240','241','239','237','238','12441','12442','12436','12440','12438','12434','12437','12436','12435','12443','12473','1051','824','823','355','354','352','905','12444','446','447','448','449','12449','869','12028','12467','12453','12452','12451','12456','12427','12458','12475','235','804','391','393','12035','388','389','11792') THEN
		 codComplemento := '1';
	END IF;	


	IF codComplemento = '5' THEN
	  descricaoComplemento := 'ato_publicado';
	ELSIF codComplemento = '26' THEN
	  descricaoComplemento := 'classe_anterior';  		  
	ELSIF codComplemento = '27' THEN
	  descricaoComplemento := 'classe_nova'; 
	ELSIF codComplemento = '14' THEN
	  descricaoComplemento := 'data';
	ELSIF codComplemento = '12' THEN
	  descricaoComplemento := 'data_hora';
	ELSIF codComplemento = '13' THEN
	  descricaoComplemento := 'destinatario';
	ELSIF codComplemento = '31' THEN
	  descricaoComplemento := 'destinatario_de_medida_protetiva';
	ELSIF codComplemento = '7' THEN
	  descricaoComplemento := 'destino';
	ELSIF codComplemento = '36' THEN
	  descricaoComplemento := 'dirigida_por';
	ELSIF codComplemento = '21' THEN
	  descricaoComplemento := 'local';  
	ELSIF codComplemento = '34' THEN
	  descricaoComplemento := 'motivos_de_registro';
	ELSIF codComplemento = '17' THEN
	  descricaoComplemento := 'motivo_da_redistribuicao';
	ELSIF codComplemento = '18' THEN
	  descricaoComplemento := 'motivo_da_remessa';
	ELSIF codComplemento = '25' THEN
	  descricaoComplemento := 'movimento_retificado';
	ELSIF codComplemento = '1' THEN
	  descricaoComplemento := 'nome_da_parte';
	ELSIF codComplemento = '33' THEN
	  descricaoComplemento := 'nome_do_incidente_repetitivo';  
	ELSIF codComplemento = '20' THEN
	  descricaoComplemento := 'nome_do_juizo';  
	ELSIF codComplemento = '9' THEN
	  descricaoComplemento := 'numero_de_volumes_e_apensos';
	ELSIF codComplemento = '8' THEN
	  descricaoComplemento := 'numero_do_processo';
	ELSIF codComplemento = '29' THEN
	  descricaoComplemento := 'numero_tema_controversia_STF'; 
	ELSIF codComplemento = '35' THEN
	  descricaoComplemento := 'numero_tema_controversia_tribunal';
	ELSIF codComplemento = '30' THEN
	  descricaoComplemento := 'numero_tema_controversia_tribunal_superior'; 
	ELSIF codComplemento = '6' THEN
	  descricaoComplemento := 'resultado';
	ELSIF codComplemento = '11' THEN
	  descricaoComplemento := 'situacao';
	ELSIF codComplemento = '38' THEN
	  descricaoComplemento := 'Situacao_Candidato';
	ELSIF codComplemento = '15' THEN
	  descricaoComplemento := 'situacao_da_audiencia';
	ELSIF codComplemento = '10' THEN
	  descricaoComplemento := 'tipo_da_decisao_anterior';
	ELSIF codComplemento = '16' THEN
	  descricaoComplemento := 'tipo_de_audiencia';
	ELSIF codComplemento = '3' THEN
	  descricaoComplemento := 'tipo_de_conclusao';
	ELSIF codComplemento = '23' THEN
	  descricaoComplemento := 'tipo_de_deliberacao'; 
	ELSIF codComplemento = '2' THEN
	  descricaoComplemento := 'tipo_de_distribuicao_redistribuicao';
	ELSIF codComplemento = '4' THEN
	  descricaoComplemento := 'tipo_de_documento';
	ELSIF codComplemento = '32' THEN
	  descricaoComplemento := 'tipo_de_medida_protetiva';
	ELSIF codComplemento = '19' THEN
	  descricaoComplemento := 'tipo_de_peticao';  
	ELSIF codComplemento = '37' THEN
	  descricaoComplemento := 'Tipo_Movimentacao_Partido'; 
	ELSIF codComplemento = '28' THEN
	  descricaoComplemento := 'tipo_tema_controversia';
	ELSIF codComplemento = '22' THEN
	  descricaoComplemento := 'tribunal';
	END IF;

	IF codComplemento ='31' and (codComplementoTabelado not in ('126','124','125') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '126'; -- A criança ou adolescente
	ELSIF codComplemento ='36' and (codComplementoTabelado not in ('188','185','186','187') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '185'; -- JUIZ(A)
	ELSIF codComplemento ='34' and (codComplementoTabelado not in ('166','167','168','169') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '169'; -- RETIFICADA A AUTUAÇÃO
	ELSIF codComplemento ='17' and (codComplementoTabelado not in ('84','35','28','29','89','30','83','87','88','86','34','31') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '83'; -- INCOMPETÊNCIA
	ELSIF codComplemento ='18' and (codComplementoTabelado not in ('108','110','37','38','190','109','40','39') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '38'; -- EM GRAU DE RECURSO
	ELSIF codComplemento ='6' and (codComplementoTabelado not in ('7','8') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '7'; -- ENTREGUE AO DESTINATARIO
	ELSIF codComplemento ='15' and (codComplementoTabelado not in ('12','11','15','9','14','13','10') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '9'; -- DESIGNADA
	ELSIF codComplemento ='16' and (codComplementoTabelado not in ('16','17','184','18','19','91','20','21','22','23','24','92','25') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '21'; -- INICIAL
	ELSIF codComplemento ='3' and (codComplementoTabelado not in ('189','6','5','36') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '36'; -- PARA JULGAMENTO
	ELSIF codComplemento ='23' and (codComplementoTabelado not in ('97','98','103','99','102','104','100','101') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '98'; -- CONVERTIDO EM DILIGENCIA
	ELSIF codComplemento ='2' and (codComplementoTabelado not in ('1','4','3','85') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '2'; -- SORTEIO
	ELSIF codComplemento ='4' and (codComplementoTabelado not in ('117','176','76','182','183','74','170','75','76','77','107','181','175','173','174','172','171','116','78','79','163','80','81','118','178','82','177') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '74'; -- AVISO DE RECEBIMENTO (AR)
	ELSIF codComplemento ='32' and (codComplementoTabelado not in ('146','147','160','128','136','137','139','138','149','148','135','161','158'',159','145','144','151','150','140','134','129','132','130','131','157','143','152','153','154','155','156','141','142','133','127') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '160'; -- ACOLHIMENTO INSTITUCIONAL
	ELSIF codComplemento ='19' and (codComplementoTabelado not in ('41','165','164','42','43','44','45','46','47','48','180','49','114','50','51','52','53','54','115','55','56','121','122','123','120','119','179','57','58','112','113','59','60','61','62','63','64','65','66','67','68','69','111','70','71','72') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '45'; -- CONTESTAÇÃO
	ELSIF codComplemento ='28' and (codComplementoTabelado not in ('105','106') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '105'; --CONTROVERSIA
	ELSIF codComplemento ='22' and (codComplementoTabelado not in ('94','95','93') or codComplementoTabelado is null) THEN
	  codComplementoTabelado := '93'; -- TST
	ELSIF codComplemento in ('5','26','27','14','12','13','7','21','25','1','33','20','9','8','29','35','30','11','38','10','37') THEN
	  codComplementoTabelado := ''; -- DEVE SER NULO
	END IF;

	IF codComplementoTabelado <> '' THEN
	  codMovimento := concat('<complementoNacional codComplemento="',codComplemento,'"',' descricaoComplemento="',descricaoComplemento,'"',' codComplementoTabelado="',codComplementoTabelado,'" />');
	  RETURN codMovimento;			
	ELSE
		RETURN '';
	END IF;
	
END;
$$ language plpgsql;