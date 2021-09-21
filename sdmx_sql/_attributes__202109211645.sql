INSERT INTO sdmx.[attributes] (assignmentstatus,attachmentlevel,codelist,codelistagency,codelistversion,conceptschemeagency,conceptschemeref,conceptref,conceptversion,texttype,maxlength,minlength,istimeformat) VALUES
	 ('Mandatory','Observation','CL_OBS_STATUS','SDMX','2.0','ESTAT','CS_NA','OBS_STATUS','1.5','String','1','1',NULL),
	 ('Mandatory','Observation','CL_CONF_STATUS','SDMX','1.0','ESTAT','CS_NA','CONF_STATUS','1.5','String','1','1',NULL),
	 ('Conditional','Observation',NULL,NULL,NULL,'ESTAT','CS_NA','COMMENT_OBS','1.5','String','4000',NULL,NULL),
	 ('Conditional','Observation',NULL,NULL,NULL,'ESTAT','CS_NA','EMBARGO_DATE','1.5','DateTime','25',NULL,NULL),
	 ('Conditional','Series','CL_REF_PERIOD_DTL','ESTAT','1.0','ESTAT','CS_NA','REF_PERIOD_DETAIL','1.5','String','3','1',NULL),
	 ('Mandatory','Series','CL_TIME_FORMAT','SDMX','1.0','ESTAT','CS_NA','TIME_FORMAT','1.5','String','4','3','true'),
	 ('Conditional','Series','CL_TIME_COLLECT','IMF','1.0','ESTAT','CS_NA','TIME_PER_COLLECT','1.5','String','1','1',NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','CUST_BREAKDOWN_LB','1.5','String','1050',NULL,NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','REF_YEAR_PRICE','1.5',NULL,'4','4',NULL),
	 ('Mandatory','Series','CL_DECIMALS','SDMX','1.0','ESTAT','CS_NA','DECIMALS','1.5','String','2','1',NULL);
	 
INSERT INTO sdmx.[attributes]  (assignmentstatus,attachmentlevel,codelist,codelistagency,codelistversion,conceptschemeagency,conceptschemeref,conceptref,conceptversion,texttype,maxlength,minlength,istimeformat) VALUES
	 ('Conditional','Series','CL_NA_TABLEID','ESTAT','1.5','ESTAT','CS_NA','TABLE_IDENTIFIER','1.5','String','12','3',NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','TITLE','1.5','String','200',NULL,NULL),
	 ('Mandatory','Series','CL_UNIT_MULT','SDMX','1.0','ESTAT','CS_NA','UNIT_MULT','1.5','String','2','1',NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','LAST_UPDATE','1.5','DateTime','25',NULL,NULL),
	 ('Conditional','Series','CL_ORGANISATION','IMF','1.5','ESTAT','CS_NA','COMPILING_ORG','1.5','String','4','3',NULL),
	 ('Conditional','DataSet',NULL,NULL,NULL,'ESTAT','CS_NA','COMMENT_DSET','1.5','String','1050',NULL,NULL),
	 ('Conditional','Observation','CL_EDP_WBB','ESTAT','1.0','ESTAT','CS_NA','OBS_EDP_WBB','1.5','String','2','1',NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','COLL_PERIOD','1.5','ObservationalTimePeriod','35',NULL,NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','COMMENT_TS','1.5','String','1050',NULL,NULL),
	 ('Conditional','Series','CL_GFS_ECOFUNC','ESTAT','1.0','ESTAT','CS_NA','GFS_ECOFUNC','1.5','String','6','1',NULL);
	 
INSERT INTO sdmx.[attributes]  (assignmentstatus,attachmentlevel,codelist,codelistagency,codelistversion,conceptschemeagency,conceptschemeref,conceptref,conceptversion,texttype,maxlength,minlength,istimeformat) VALUES
	 ('Conditional','Series','CL_GFS_TAXCAT','ESTAT','1.2','ESTAT','CS_NA','GFS_TAXCAT','1.5','String','2','1',NULL),
	 ('Conditional','Observation',NULL,NULL,NULL,'ESTAT','CS_NA','PRE_BREAK_VALUE','1.5','Double','15',NULL,NULL),
	 ('Conditional','Series',NULL,NULL,NULL,'ESTAT','CS_NA','DATA_COMP','1.5','String','4000',NULL,NULL),
	 ('Conditional','Series','CL_UNIT','IMF','1.5','ESTAT','CS_NA','CURRENCY','1.5','String','15','2',NULL),
	 ('Conditional','Series','CL_ORGANISATION','IMF','1.5','ESTAT','CS_NA','DISS_ORG','1.5','String','4','3',NULL);
	 