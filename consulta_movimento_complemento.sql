      SELECT 
        pe.id_processo_evento, 
        to_char(pe.dt_atualizacao, 'yyyymmddhh24miss') AS dta_ocorrencia,
        --case when pe.in_visibilidade_externa = true then 0 else 5 end AS in_visibilidade_externa,
        --pe.id_processo_evento cd_identificador,
        pe.id_evento AS cd_movimento,
        --evp.id_evento id_evento_superior,
        regexp_replace(ev.ds_evento, '[\r\n]', '') AS ds_evento,
        --pe.id_processo_documento, 
        uso.ds_login, uso.id_usuario, tc.cd_tipo_complemento, cs.ds_texto
      FROM tb_processo_evento pe 
	  INNER JOIN tb_usuario_login uso ON 1=1
	    AND uso.id_usuario = pe.id_usuario
      INNER JOIN tb_complemento_segmentado cs ON cs.id_movimento_processo = pe.id_processo_evento
      INNER JOIN tb_tipo_complemento tc ON tc.id_tipo_complemento = cs.id_tipo_complemento
      INNER JOIN tb_evento ev ON 1=1
        AND ev.id_evento = pe.id_evento and pe.id_evento not in ('239','246','238','1059','265','432','373','242','230','236','237','240','429','431')
        AND ev.in_ativo  = 'S' 
      LEFT JOIN tb_evento evp ON 1=1
        and ev.id_evento >= 50000
        and evp.ds_evento ~ '(Magistrado)|(Recebimento.*)'
        and regexp_replace(evp.ds_caminho_completo, '^(Serventuário\|)?([^\|]+).*$', '\1\2') = regexp_replace(ev.ds_caminho_completo, '^(Serventuário\|)?([^\|]+).*$', '\1\2')
      WHERE 1=1
        AND pe.id_processo_evento_excludente IS NULL
        AND pe.dt_atualizacao >=  to_date('01-05-2020', 'dd-mm-yyyy')
        AND pe.dt_atualizacao <=  to_date('02-05-2020', 'dd-mm-yyyy')
        and pe.id_evento = 123
      ORDER BY pe.dt_atualizacao ASC