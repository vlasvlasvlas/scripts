-- sdmx."attributes" definition

-- Drop table

-- DROP TABLE sdmx."attributes";

CREATE TABLE sdmx."attributes" (
	assignmentstatus varchar(999)  NULL,
	attachmentlevel varchar(999)  NULL,
	codelist varchar(999)  NULL,
	codelistagency varchar(999)  NULL,
	codelistversion varchar(999)  NULL,
	conceptschemeagency varchar(999)  NULL,
	conceptschemeref varchar(999)  NULL,
	conceptref varchar(999)  NULL,
	conceptversion varchar(999)  NULL,
	texttype varchar(999)  NULL,
	maxlength varchar(999)  NULL,
	minlength varchar(999)  NULL,
	istimeformat varchar(999)  NULL
);


-- sdmx.cl_account_entry definition

-- Drop table

-- DROP TABLE sdmx.cl_account_entry;

CREATE TABLE sdmx.cl_account_entry (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_account_entry ON sdmx.cl_account_entry (code);


-- sdmx.cl_activity definition

-- Drop table

-- DROP TABLE sdmx.cl_activity;

CREATE TABLE sdmx.cl_activity (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_activity ON sdmx.cl_activity (code);


-- sdmx.cl_adjustment definition

-- Drop table

-- DROP TABLE sdmx.cl_adjustment;

CREATE TABLE sdmx.cl_adjustment (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_adjustment ON sdmx.cl_adjustment (code);


-- sdmx.cl_area definition

-- Drop table

-- DROP TABLE sdmx.cl_area;

CREATE TABLE sdmx.cl_area (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_area ON sdmx.cl_area (code);


-- sdmx.cl_cofog definition

-- Drop table

-- DROP TABLE sdmx.cl_cofog;

CREATE TABLE sdmx.cl_cofog (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_cofog ON sdmx.cl_cofog (code);


-- sdmx.cl_conf_status definition

-- Drop table

-- DROP TABLE sdmx.cl_conf_status;

CREATE TABLE sdmx.cl_conf_status (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_conf_status ON sdmx.cl_conf_status (code);


-- sdmx.cl_cust_breakdown definition

-- Drop table

-- DROP TABLE sdmx.cl_cust_breakdown;

CREATE TABLE sdmx.cl_cust_breakdown (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_cust_breakdown ON sdmx.cl_cust_breakdown (code);


-- sdmx.cl_decimals definition

-- Drop table

-- DROP TABLE sdmx.cl_decimals;

CREATE TABLE sdmx.cl_decimals (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_decimals ON sdmx.cl_decimals (code);


-- sdmx.cl_edp_wbb definition

-- Drop table

-- DROP TABLE sdmx.cl_edp_wbb;

CREATE TABLE sdmx.cl_edp_wbb (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_edp_wbb ON sdmx.cl_edp_wbb (code);


-- sdmx.cl_freq definition

-- Drop table

-- DROP TABLE sdmx.cl_freq;

CREATE TABLE sdmx.cl_freq (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_freq ON sdmx.cl_freq (code);


-- sdmx.cl_gfs_ecofunc definition

-- Drop table

-- DROP TABLE sdmx.cl_gfs_ecofunc;

CREATE TABLE sdmx.cl_gfs_ecofunc (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_gfs_ecofunc ON sdmx.cl_gfs_ecofunc (code);


-- sdmx.cl_gfs_taxcat definition

-- Drop table

-- DROP TABLE sdmx.cl_gfs_taxcat;

CREATE TABLE sdmx.cl_gfs_taxcat (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_gfs_taxcat ON sdmx.cl_gfs_taxcat (code);


-- sdmx.cl_instr_asset definition

-- Drop table

-- DROP TABLE sdmx.cl_instr_asset;

CREATE TABLE sdmx.cl_instr_asset (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_instr_asset ON sdmx.cl_instr_asset (code);


-- sdmx.cl_maturity definition

-- Drop table

-- DROP TABLE sdmx.cl_maturity;

CREATE TABLE sdmx.cl_maturity (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_maturity ON sdmx.cl_maturity (code);


-- sdmx.cl_na_consolidat definition

-- Drop table

-- DROP TABLE sdmx.cl_na_consolidat;

CREATE TABLE sdmx.cl_na_consolidat (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_na_consolidat ON sdmx.cl_na_consolidat (code);


-- sdmx.cl_na_prices definition

-- Drop table

-- DROP TABLE sdmx.cl_na_prices;

CREATE TABLE sdmx.cl_na_prices (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_na_prices ON sdmx.cl_na_prices (code);


-- sdmx.cl_na_sto definition

-- Drop table

-- DROP TABLE sdmx.cl_na_sto;

CREATE TABLE sdmx.cl_na_sto (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_na_sto ON sdmx.cl_na_sto (code);


-- sdmx.cl_na_tableid definition

-- Drop table

-- DROP TABLE sdmx.cl_na_tableid;

CREATE TABLE sdmx.cl_na_tableid (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_na_tableid ON sdmx.cl_na_tableid (code);


-- sdmx.cl_obs_status definition

-- Drop table

-- DROP TABLE sdmx.cl_obs_status;

CREATE TABLE sdmx.cl_obs_status (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_obs_status ON sdmx.cl_obs_status (code);


-- sdmx.cl_organisation definition

-- Drop table

-- DROP TABLE sdmx.cl_organisation;

CREATE TABLE sdmx.cl_organisation (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_organisation ON sdmx.cl_organisation (code);


-- sdmx.cl_pens_fundtype definition

-- Drop table

-- DROP TABLE sdmx.cl_pens_fundtype;

CREATE TABLE sdmx.cl_pens_fundtype (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_pens_fundtype ON sdmx.cl_pens_fundtype (code);


-- sdmx.cl_product definition

-- Drop table

-- DROP TABLE sdmx.cl_product;

CREATE TABLE sdmx.cl_product (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_product ON sdmx.cl_product (code);


-- sdmx.cl_ref_period_dtl definition

-- Drop table

-- DROP TABLE sdmx.cl_ref_period_dtl;

CREATE TABLE sdmx.cl_ref_period_dtl (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_ref_period_dtl ON sdmx.cl_ref_period_dtl (code);


-- sdmx.cl_sector definition

-- Drop table

-- DROP TABLE sdmx.cl_sector;

CREATE TABLE sdmx.cl_sector (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_sector ON sdmx.cl_sector (code);


-- sdmx.cl_time_collect definition

-- Drop table

-- DROP TABLE sdmx.cl_time_collect;

CREATE TABLE sdmx.cl_time_collect (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_time_collect ON sdmx.cl_time_collect (code);


-- sdmx.cl_time_format definition

-- Drop table

-- DROP TABLE sdmx.cl_time_format;

CREATE TABLE sdmx.cl_time_format (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_time_format ON sdmx.cl_time_format (code);


-- sdmx.cl_transformation definition

-- Drop table

-- DROP TABLE sdmx.cl_transformation;

CREATE TABLE sdmx.cl_transformation (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_transformation ON sdmx.cl_transformation (code);


-- sdmx.cl_unit definition

-- Drop table

-- DROP TABLE sdmx.cl_unit;

CREATE TABLE sdmx.cl_unit (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_unit ON sdmx.cl_unit (code);


-- sdmx.cl_unit_mult definition

-- Drop table

-- DROP TABLE sdmx.cl_unit_mult;

CREATE TABLE sdmx.cl_unit_mult (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_unit_mult ON sdmx.cl_unit_mult (code);


-- sdmx.cl_valuation definition

-- Drop table

-- DROP TABLE sdmx.cl_valuation;

CREATE TABLE sdmx.cl_valuation (
	urn varchar(999)  NULL,
	lang varchar(999)  NULL,
	description varchar(999)  NULL,
	code varchar(999)  NULL
);
CREATE UNIQUE INDEX ind_cl_valuation ON sdmx.cl_valuation (code);


-- sdmx.codelists definition

-- Drop table

-- DROP TABLE sdmx.codelists;

CREATE TABLE sdmx.codelists (
	agencyid varchar(999)  NULL,
	id varchar(999)  NULL,
	urn varchar(999)  NULL,
	"version" varchar(999)  NULL,
	isexternalreference varchar(999)  NULL,
	isfinal varchar(999)  NULL,
	lang varchar(999)  NULL,
	"name" varchar(999)  NULL
);


-- sdmx.concepts definition

-- Drop table

-- DROP TABLE sdmx.concepts;

CREATE TABLE sdmx.concepts (
	id varchar(999)  NULL,
	urn varchar(999)  NULL,
	corerepresentation varchar(999)  NULL,
	corerepresentationagency varchar(999)  NULL,
	lang varchar(999)  NULL,
	"name" varchar(999)  NULL
);


-- sdmx.dimensions definition

-- Drop table

-- DROP TABLE sdmx.dimensions;

CREATE TABLE sdmx.dimensions (
	codelist varchar(999)  NULL,
	codelistagency varchar(999)  NULL,
	codelistversion varchar(999)  NULL,
	conceptschemeagency varchar(999)  NULL,
	conceptschemeref varchar(999)  NULL,
	conceptref varchar(999)  NULL,
	conceptversion varchar(999)  NULL,
	isfrequencydimension varchar(999)  NULL,
	texttype varchar(999)  NULL,
	maxlength varchar(999)  NULL,
	minlength varchar(999)  NULL
);


-- sdmx.f_observations_h definition




-- sdmx.keyfamilies definition

-- Drop table

-- DROP TABLE sdmx.keyfamilies;

CREATE TABLE sdmx.keyfamilies (
	agencyid varchar(999)  NULL,
	id varchar(999)  NULL,
	urn varchar(999)  NULL,
	"version" varchar(999)  NULL,
	isexternalreference varchar(999)  NULL,
	isfinal varchar(999)  NULL,
	"name" varchar(999)  NULL
);


-- sdmx.primarymeasure definition

-- Drop table

-- DROP TABLE sdmx.primarymeasure;

CREATE TABLE sdmx.primarymeasure (
	conceptschemeagency varchar(999)  NULL,
	conceptschemeref varchar(999)  NULL,
	conceptref varchar(999)  NULL,
	conceptversion varchar(999)  NULL,
	texttype varchar(999)  NULL,
	maxlength varchar(999)  NULL
);


-- sdmx.timedimension definition

-- Drop table

-- DROP TABLE sdmx.timedimension;

CREATE TABLE sdmx.timedimension (
	conceptschemeagency varchar(999)  NULL,
	conceptschemeref varchar(999)  NULL,
	conceptref varchar(999)  NULL,
	conceptversion varchar(999)  NULL,
	texttype varchar(999)  NULL
);

