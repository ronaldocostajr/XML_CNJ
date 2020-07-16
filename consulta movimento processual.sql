SELECT 
--	pe.id_processo_evento, 
--	to_char(pe.dt_atualizacao, 'yyyymmddhh24miss') AS dta_ocorrencia,
	pe.dt_atualizacao,
	pe.id_evento AS Movimento,
--	evp.id_evento id_evento_superior,
	regexp_replace(ev.ds_evento, '[\r\n]', ' ') AS descricaoMovimento,
	tc.cd_tipo_complemento as codComplemento, 
	tc.ds_nome as descricaoComplemento,
	nullif(trim(cs.ds_texto), '') AS codComplementoTabelado,
	regexp_replace(cs.ds_valor_complemento, '[\r\n]', ' ') AS nm_complemento
--	pe.id_processo_documento, uso.ds_login, uso.id_usuario
FROM tb_processo_evento pe 
INNER JOIN tb_usuario_login uso ON 1=1 AND uso.id_usuario = pe.id_usuario
INNER JOIN tb_evento ev ON 1=1 AND ev.id_evento = pe.id_evento AND pe.id_evento not in ('48','193','230','236','237','238','239','240','242','246','265','373','378','429','431','432','1013','1059','2019','2029','2086','2704','11010') AND ev.in_ativo  = 'S' 
LEFT JOIN tb_evento evp ON 1=1 
	and ev.id_evento >= 50000
	and ev.id_evento not in (50052, 50005)
	and evp.id_evento in (1, 977, 979, 981, 132, 115)
	and evp.ds_evento ~ '(Magistrado)|(Recebimento.*)'
	and regexp_replace(evp.ds_caminho_completo, '^(Serventuário\|)?([^\|]+).*$', '\1\2') = regexp_replace(ev.ds_caminho_completo, '^(Serventuário\|)?([^\|]+).*$', '\1\2')
RIGHT JOIN tb_complemento_segmentado cs ON cs.id_movimento_processo = pe.id_processo
RIGHT JOIN tb_tipo_complemento tc ON tc.id_tipo_complemento = cs.id_tipo_complemento
WHERE 1=1
AND pe.id_processo_evento_excludente IS NULL
--AND pe.id_processo = 51542
and pe.id_evento = 123
and pe.dt_atualizacao >= to_date('01072020','ddmmyyyy')
ORDER BY regexp_replace(cs.ds_valor_complemento, '[\r\n]', ' ') ASC

 
	  
	  
26
36
51
60
85
92
106
123
132
196
198
200
219
220
221
235
245
269
272
275
276
334
339
371
374
377
459
460
461
463
466
472
804
848
871
893
898
940
941
944
945
970
985
1051
1061
10966
11012
11013
11014
11022
11024
11382
11384
11385
12037
12040
50023
50024
50033
50038
50042
50044
50047
50048
50049
50050
50054
50060
50070
50071
50073
50080
50084
50085
50086
50087
50088
50103
50118
50124
50127
50128
50135
50136
