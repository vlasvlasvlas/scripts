INSERT INTO sdmx.[dimensions] (codelist,codelistagency,codelistversion,conceptschemeagency,conceptschemeref,conceptref,conceptversion,isfrequencydimension,texttype,maxlength,minlength) VALUES
	 ('CL_FREQ','SDMX','2.0','ESTAT','CS_NA','FREQ','1.5','true','String','1','1'),
	 ('CL_ADJUSTMENT','ESTAT','1.4','ESTAT','CS_NA','ADJUSTMENT','1.5',NULL,'String','2','1'),
	 ('CL_AREA','IMF','1.5','ESTAT','CS_NA','REF_AREA','1.5',NULL,'String','5','2'),
	 ('CL_AREA','IMF','1.5','ESTAT','CS_NA','COUNTERPART_AREA','1.5',NULL,'String','5','2'),
	 ('CL_SECTOR','ESTAT','1.3','ESTAT','CS_NA','REF_SECTOR','1.5',NULL,'String','7','2'),
	 ('CL_SECTOR','ESTAT','1.3','ESTAT','CS_NA','COUNTERPART_SECTOR','1.5',NULL,'String','7','2'),
	 ('CL_NA_CONSOLIDAT','ESTAT','1.3','ESTAT','CS_NA','CONSOLIDATION','1.5',NULL,'String','2','1'),
	 ('CL_ACCOUNT_ENTRY','IMF','1.2','ESTAT','CS_NA','ACCOUNTING_ENTRY','1.5',NULL,'String','2','1'),
	 ('CL_NA_STO','ESTAT','1.5','ESTAT','CS_NA','STO','1.5',NULL,'String','9','1'),
	 ('CL_INSTR_ASSET','ESTAT','1.5','ESTAT','CS_NA','INSTR_ASSET','1.5',NULL,'String','7','1');
	 
INSERT INTO sdmx.[dimensions] (codelist,codelistagency,codelistversion,conceptschemeagency,conceptschemeref,conceptref,conceptversion,isfrequencydimension,texttype,maxlength,minlength) VALUES
	 ('CL_MATURITY','ESTAT','1.5','ESTAT','CS_NA','MATURITY','1.5',NULL,'String','6','1'),
	 ('CL_COFOG','ESTAT','1.0','ESTAT','CS_NA','EXPENDITURE','1.5',NULL,'String','8','2'),
	 ('CL_UNIT','IMF','1.5','ESTAT','CS_NA','UNIT_MEASURE','1.5',NULL,'String','15','2'),
	 ('CL_UNIT','IMF','1.5','ESTAT','CS_NA','CURRENCY_DENOM','1.5',NULL,'String','15','2'),
	 ('CL_VALUATION','ESTAT','1.5','ESTAT','CS_NA','VALUATION','1.5',NULL,'String','2','1'),
	 ('CL_NA_PRICES','ESTAT','1.1','ESTAT','CS_NA','PRICES','1.5',NULL,'String','2','1'),
	 ('CL_TRANSFORMATION','ESTAT','1.2','ESTAT','CS_NA','TRANSFORMATION','1.5',NULL,'String','5','1'),
	 ('CL_CUST_BREAKDOWN','ESTAT','1.2','ESTAT','CS_NA','CUST_BREAKDOWN','1.5',NULL,'String','3','2');