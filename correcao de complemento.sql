		IF mov.cd_movimento = '92' THEN
		  IF codComplemento not in ('5','14') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '5';
		  END IF;
		ELSIF mov.cd_movimento = '928' THEN
		  IF codComplemento not in ('5','14') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '5';
		  END IF;
		ELSIF mov.cd_movimento = '10966' THEN
		  IF codComplemento not in ('26','27') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '27';
		  END IF;
		ELSIF mov.cd_movimento in ('12260','1061','1062','848') THEN
			codComplemento := '14';
		ELSIF mov.cd_movimento = '1051' THEN
		  IF codComplemento not in ('1','14') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '1';
		  END IF;
		ELSIF mov.cd_movimento = '190' THEN
		  IF codComplemento not in ('10','14') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '10';
		  END IF;
		ELSIF mov.cd_movimento = '945' THEN
		  IF codComplemento not in ('10','14') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '10';
		  END IF;
		ELSIF mov.cd_movimento = '970' THEN
		  IF codComplemento not in ('12','15','16','21','36') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '15';
		  END IF;
		ELSIF mov.cd_movimento = '417' THEN
		  IF codComplemento not in ('12','21') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '12';
		  END IF;
		ELSIF mov.cd_movimento in ('311','313') THEN
		  IF codComplemento not in ('12','15','21') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '12';
		  END IF;
		ELSIF mov.cd_movimento in ('493','12214') THEN
		     codComplemento := '13';
		ELSIF mov.cd_movimento in ('11424','11423','12476','11425','11426') THEN
		  IF codComplemento not in ('31','32') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '31';
		  END IF;		
		ELSIF mov.cd_movimento in ('978','12622') THEN
		     codComplemento := '7';		  
		ELSIF mov.cd_movimento = '982' THEN
		  IF codComplemento not in ('7','18') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '18';
		  END IF;
		ELSIF mov.cd_movimento = '123' THEN
		  IF codComplemento not in ('7','18','19') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '18';
		  END IF;
		ELSIF mov.cd_movimento = '980' THEN
		     codComplemento := '7';
		ELSIF mov.cd_movimento = '12296' THEN
		     codComplemento := '34';
		ELSIF mov.cd_movimento = '36' THEN
		  IF codComplemento not in ('2','17') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '2';
		  END IF;
		ELSIF mov.cd_movimento = '11983' THEN
		     codComplemento := '25';
		ELSIF mov.cd_movimento = '12257' THEN
		     codComplemento := '33';
		ELSIF mov.cd_movimento in ('11796','12421') THEN
		     codComplemento := '20';
		ELSIF mov.cd_movimento in ('135','137') THEN
		  IF codComplemento not in ('8','9') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '8';
		  END IF;
		ELSIF mov.cd_movimento = '861' THEN
		  codComplemento := '9';
		ELSIF mov.cd_movimento = '265' THEN
		  IF codComplemento not in ('28','29') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '28';
		  END IF;
		ELSIF mov.cd_movimento = '11975' THEN
		  IF codComplemento not in ('22','28','30') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '22';
		  END IF;
		ELSIF mov.cd_movimento in ('106','112') THEN
		  codComplemento := '6';
		ELSIF mov.cd_movimento  = '12658' THEN
		  codComplemento := '38';
		ELSIF mov.cd_movimento = '51' THEN
		  codComplemento := '3';
		ELSIF mov.cd_movimento = '873' THEN
		  codComplemento := '23';
		ELSIF mov.cd_movimento = '26' THEN
		  codComplemento := '2';
		ELSIF mov.cd_movimento = '36' THEN
		  IF codComplemento not in ('2','17') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '2';
		  END IF;
		ELSIF mov.cd_movimento in ('60','581') THEN
		  IF codComplemento not in ('183','74','170','75','76','77','107','181','175','173','174','172','171','116','78','79','163','80','81','118','178','82','177') or coalesce(codComplemento,'') = '' THEN
		     codComplemento := '116';
		  END IF;
		ELSIF mov.cd_movimento = '12479' THEN
		  codComplemento := '32';
		ELSIF mov.cd_movimento = '85' THEN
		  codComplemento := '19';
		ELSIF mov.cd_movimento = '12657' THEN
		  codComplemento := '37';
		ELSIF mov.cd_movimento in ('12616','12446','334','787','818','442','11415','450','451','452','453','443','444','11554','445','242','240','241','239','237','238','12441','12442','12436','12440','12438','12434','12437','12436','12435','12443','12473','1051','824','823','355','354','352','905','12444','446','447','448','449','12449','869','12028','12467','12453','12452','12451','12456','12427','12458','12475','235','804','391','393','12035','388','389','11792') THEN
		     codComplemento := '1';
		END IF;	
