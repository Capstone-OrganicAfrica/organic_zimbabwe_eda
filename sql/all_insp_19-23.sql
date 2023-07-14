CREATE TABLE "OGInsp2016__OGMB_1"  AS
TABLE "OGInsp2016__OGMB";

CREATE TABLE "OGInsp2015__OGMB_1"  AS
TABLE "OGInsp2015__OGMB";

CREATE TABLE "OGInsp2014__OGMB_1"  AS
TABLE "OGInsp2014__OGMB";

CREATE TABLE "OGInsp2013__OGMB_1"  AS
TABLE "OGInsp2013__OGMB";

CREATE TABLE "OGInp__OGMB_1"  AS
TABLE "OGInp__OGMB";

SELECT * FROM "OGInp__OGMB_1";

---- delivery date needs to be changed to just have the year 
UPDATE "OGInp__OGMB_1" 
SET "Date_of_delivery" = (
  TO_DATE(
    LPAD(SPLIT_PART("Date_of_delivery", '/', 2)

  ) )
WHERE "Date_of_delivery" <> '05/20/2020';


SELECT LPAD(SUBSTR(("Date_of_delivery", 'MM/DD/YYYY'), 7, 4), 4, '0') AS formatted_year
FROM "OGInp__OGMB_1";

------- 
CREATE TABLE "wc_insp_2016_bayoba_1"  AS
TABLE "wc_insp_2016_bayoba";

CREATE TABLE "wc_insp_2016__WCOrg_1"  AS
TABLE "wc_insp_2016__WCOrg";

CREATE TABLE "wc_insp_2015__WCOrg_1"  AS
TABLE "wc_insp_2015__WCOrg";

CREATE TABLE "wc_insp_2014__WCOrg_1"  AS
TABLE "wc_insp_2014__WCOrg";

CREATE TABLE "wc_insp_2013__WCOrg_1"  AS
TABLE "wc_insp_2013__WCOrg";

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO tomislavilic;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO khatanzayaschmidt;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO alexandrapersina;


CREATE TABLE "OG_Insp_2018__OGOrg_1"  AS
TABLE "OG_Insp_2018__OGOrg";

SELECT * FROM "OG_Insp_2018__OGOrg_1" oio ;

SELECT DISTINCT  "Area" FROM "OG_Insp_2018__OGOrg_1" oio ;



UPDATE "OG_Insp_2018__OGOrg_1"
SET "Area" = (
    CASE "OG_Insp_2018__OGOrg_1"."Area"
        WHEN '3.0' THEN 'Binga'
        WHEN '25.0' THEN 'Makoni'
    END
);




UPDATE "OG_Insp_2018__OGOrg_1"
   SET "Area" =(SELECT area FROM all_farmers WHERE "OG_Insp_2018__OGOrg_1"."OG_Nr" = "all_farmers"."og_nr");

---- code von Copy_of_OGInsp_OGOrg_1 - finalisation


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN "nearest_school" float;
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET "nearest_school" = CASE
        WHEN "Distance_from_nearest_School" = '' THEN 0
        WHEN "Distance_from_nearest_School" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
DROP COLUMN "Distance_from_nearest_School";
-----------------------
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN "nearest_clinic" float;
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET "nearest_clinic" = CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
DROP COLUMN "Distance_from_nearest_clinic";
-----------
-----sql
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN "nearest_shops" float;
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET "nearest_shops" = CASE
        WHEN "Distance_from_nearest_Shops" = '' THEN 0
        WHEN "Distance_from_nearest_Shops" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
DROP COLUMN "Distance_from_nearest_Shops";



----- continue with the 2018 group tables 

SELECT * FROM "OGInsp2018__OGMB_1" oo ;

ALTER TABLE organic_africa."OGInsp2018__OGMB_1" ALTER COLUMN "Area" TYPE text USING "Area"::text;


UPDATE "OGInsp2018__OGMB_1"
   SET "Area" =(SELECT area FROM all_farmers WHERE "OGInsp2018__OGMB_1"."OG_Nr" = "all_farmers"."og_nr");

  
---- 2017  
  
CREATE TABLE "OG_Insp_2017__OGOrg_1"  AS
TABLE "OG_Insp_2017__OGOrg";


alter default privileges in schema organic_africa grant all on tables to tomislavilic;
alter default privileges in schema organic_africa grant all on sequences to tomislavilic;
alter default privileges in schema organic_africa grant all on tables to alexandrapersina;
alter default privileges in schema organic_africa grant all on sequences to alexandrapersina;
alter default privileges in schema organic_africa grant all on tables to khatanzayaschmidt;
alter default privileges in schema organic_africa grant all on sequences to khatanzayaschmidt;
alter default privileges in schema organic_africa grant all on tables to jelenaheyland;
alter default privileges in schema organic_africa grant all on sequences to jelenaheyland;




CREATE TABLE "OG_Insp_2016__OGOrg_1"  AS
TABLE "OG_Insp_2016__OGOrg";

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
RENAME COLUMN "availability_latrine" TO "Availabilty_of_HH_latrine";
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
RENAME COLUMN "fuel_source_1" TO "fuel_source";
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
RENAME COLUMN "reason_for_school_dropout" TO "Reason_for_not_attending";
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
RENAME COLUMN "household_head_education_level" TO "HH_education_level";
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
RENAME COLUMN "source_of_hh_water" TO "Main_source_of_HH_water";


SELECT * FROM "Copy_of_OGInsp2019__OGOrg_1";

DROP TABLE "OG_2018_insp";

UPDATE TABLE  og_insp_2023__ogorg_1 RENAME TABLE og_insp_2023__ogorg_1 TO all_insp_2023;

CREATE TABLE "OG_Insp_2015__OGOrg_1"  AS
TABLE "OG_Insp_2015__OGOrg";

CREATE TABLE "OG_Insp_2014__OGOrg_1"  AS
TABLE "OG_Insp_2014__OGOrg";

CREATE TABLE "OG_Insp_2013__OGOrg_1"  AS
TABLE "OG_Insp_2013__OGOrg";

-------- update 2021 

UPDATE "OG_Insp_2021__OGOrg_1"
SET "Cereal_harvest_last" = 
  CASE
    WHEN "Cereal_harvest_last" = 'none' THEN '0'
    WHEN "Cereal_harvest_last" = 'month' THEN '1'
    WHEN "Cereal_harvest_last" LIKE '% month%' THEN ---IF there ARE 'months' or typos, adjust this code TO this word
      CAST(REGEXP_REPLACE("Cereal_harvest_last", '[^0-9]', '', 'g') AS TEXT)
    ELSE "Cereal_harvest_last"
  END;
UPDATE "OG_Insp_2021__OGOrg_1"
SET "Cereal_harvest_last" =
  CASE
    WHEN "Cereal_harvest_last" = '0,5' THEN '0.5' ---IF there IS something completely differenct
    ELSE "Cereal_harvest_last"
  END
WHERE "cereal_harvest_last" IN ('0,5');
   
SELECT "Cereal_harvest_last" FROM "OG_Insp_2021__OGOrg_1" ---CHECK what you did AND IF there IS still anything odd. 


ALTER TABLE  "OG_Insp_2021__OGOrg_1"
alter COLUMN "Cereal_harvest_last" type float USING "Cereal_harvest_last"::FLOAT; ---THEN CHANGE TO float 


-------- update 2021_2 

UPDATE "OG_Insp_2021_2__OGOrg_2"
SET "Cereal_harvest_last" = 
  CASE
    WHEN "Cereal_harvest_last" = 'none' THEN '0'
    WHEN "Cereal_harvest_last" = '1 year' THEN '12 months'
    WHEN "Cereal_harvest_last" LIKE '%month%' THEN ---IF there ARE 'months' or typos, adjust this code TO this word
      CAST(REGEXP_REPLACE("Cereal_harvest_last", '[^0-9]', '', 'g') AS TEXT)
    ELSE "Cereal_harvest_last"
  END;
UPDATE "OG_Insp_2021_2__OGOrg_2"
SET "Cereal_harvest_last" =
  CASE
    WHEN "Cereal_harvest_last" = '0,5' THEN '0.5' ---IF there IS something completely differenct
    ELSE "Cereal_harvest_last"
  END
WHERE "cereal_harvest_last" IN ('0,5');
   
SELECT "Cereal_harvest_last" FROM "OG_Insp_2021_2__OGOrg_2" ---CHECK what you did AND IF there IS still anything odd. 


ALTER TABLE  "OG_Insp_2021__OGOrg_1"
alter COLUMN "Cereal_harvest_last" type float USING "Cereal_harvest_last"::FLOAT; ---THEN CHANGE TO float 



-------- update 2021_OGMB

UPDATE "OGInsp2021__OGMB_1"
SET "Cereal_harvest_last" = 
  CASE
    WHEN "Cereal_harvest_last" = 'none' THEN '0'
    WHEN "Cereal_harvest_last" = 'I year' THEN '12'
    WHEN "Cereal_harvest_last" LIKE '% monh%' THEN ---IF there ARE 'months' or typos, adjust this code TO this word
      CAST(REGEXP_REPLACE("Cereal_harvest_last", '[^0-9]', '', 'g') AS TEXT)
    ELSE "Cereal_harvest_last"
  END;
UPDATE "OGInsp2021__OGMB_1"
SET "Cereal_harvest_last" =
  CASE
    WHEN "Cereal_harvest_last" = '0,5' THEN '0.5' ---IF there IS something completely differenct
    ELSE "Cereal_harvest_last"
  END
WHERE "cereal_harvest_last" IN ('0,5');
   
SELECT "OG_Nr", "Cereal_harvest_last" FROM "OGInsp2021__OGMB_1"; ---CHECK what you did AND IF there IS still anything odd. 
SELECT "OG_Nr", "Cereal_harvest_last" FROM "OGInsp2021__OGMB";

ALTER TABLE  "OGInsp2021__OGMB_1"
alter COLUMN "Cereal_harvest_last" type float USING "Cereal_harvest_last"::FLOAT; ---THEN CHANGE TO float 


SELECT * FROM "OGInsp2021__OGMB_1";

-----

SELECT count(*) from all_farmers;
SELECT DISTINCT "Area_(acre)" from "OG_Field_History__OGOrg"  oio ;

SELECT * FROM all_farmers af 
WHERE "og_nr" = 13172;


SELECT * FROM "OG_Info__OGOrg" oiro   
WHERE "OG_Nr" = 2841;


SELECT * FROM "OG_Info_reserve__OGOrg"  oiro   
WHERE "OG_Nr" = 13172;

SELECT count(*) FROM all_farmers af 
WHERE date_contracted  = '2018-08-19';

SELECT count(*) FROM "OG_Info_reserve__OGOrg_1"
WHERE "Date_contracted"   = '2018-08-19';

SELECT count(*) FROM "OG_Info__OGOrg_1" oio 
WHERE "Date_contracted"   = '2018-08-19';

SELECT count(*) FROM "OGInfo__OGMB_1" oo 
WHERE "date_contracted"   = '2018-08-19';

SELECT DISTINCT "OG_Nr" FROM "OGFH_OGMB" oo ;
SELECT * FROM "OGFH_OGMB" oo 
WHERE "OG_Nr" = 13172;

SELECT * FROM "OG_Field_History__OGOrg"  oo 
WHERE "OG_Nr" = 13172;

SELECT * FROM all_insp_2019 ai ;

ALTER TABLE all_insp_2019 
Alter COLUMN mentally_challenged_<_5_male type float USING mentally_challenged_<_5_male::float;

mentally_challenged_<_5_male
mentally_challenged_5-17_female
mentally_challenged_5-17_male
mentally_challenged_17-59_female
mentally_challenged_17-59_male
mentally_challenged_60+_female
mentally_challenged_60+_male
agric_activities_<_5_female
agric_activities_<_5_male

SELECT * FROM "OG_Insp_2021__OGOrg_1" oio 
WHERE "OG_Nr" = 2771  ;

SELECT * FROM "OG_Insp_2021_2__OGOrg_2" oio 
WHERE "OG_Nr" = 2771  ;

SELECT * FROM "all_insp_19-23" ai 
WHERE cereal_harvest_last  IS NULL;

SELECT * FROM "OGInsp20191__OGMB" WHERE "OG_Nr" = 14562;

SELECT * FROM all_farmers af ;


UPDATE "all_insp_19-23" 
SET "date_of_birth" =(
	SELECT date_of_birth 
	FROM "all_farmers" 
	WHERE "all_insp_19-23"."og_nr" = "all_farmers"."og_nr")
WHERE date_of_birth IS NULL;

UPDATE all_farmers ---didnt work 
SET date_of_birth  = (
	SELECT date_of_birth 
	FROM "all_insp_19-23"  
	WHERE "all_farmers"."og_nr" = "all_insp_19-23"."og_nr" LIMIT 1 )
WHERE date_of_birth IS NULL;

SELECT count(*) FROM "all_insp_19-23" ai WHERE date_of_birth IS NULL;

SELECT count(*) FROM "all_farmers" ai WHERE date_of_birth IS NULL ;

UPDATE "all_insp_19-23"
SET "date_of_birth" =(
	SELECT date_of_birth 
	FROM "OGInfo__OGMB_1"  
	WHERE "all_insp_19-23"."og_nr" = "OGInfo__OGMB_1"."OG_Nr");

UPDATE "all_insp_19-23" 
SET "last_quarter_food_expenditure" = 
  CASE
    WHEN last_quarter_food_expenditure = 'none' THEN '0'
    WHEN last_quarter_food_expenditure LIKE '%$%' THEN REPLACE(REPLACE(last_quarter_food_expenditure, '$', ''), ' USD', '')
	ELSE last_quarter_food_expenditure
  END;
   
UPDATE "all_insp_19-23" 
SET "school_fees_expenditure" = 
  CASE
    WHEN school_fees_expenditure = 'none' THEN '0'
    WHEN school_fees_expenditure LIKE '%$%' THEN REPLACE(REPLACE(school_fees_expenditure, '$', ''), ' USD', '')
	ELSE school_fees_expenditure
  END;

 
 
UPDATE "all_insp_19-23_household" 
SET "last_quarter_food_expenditure" = 
  CASE
    WHEN last_quarter_food_expenditure = 'none' THEN '0'
    WHEN last_quarter_food_expenditure LIKE '%$%' THEN REPLACE(REPLACE(last_quarter_food_expenditure, '$', ''), ' USD', '')
	ELSE last_quarter_food_expenditure
  END;
   
UPDATE "all_insp_19-23_household" 
SET "school_fees_expenditure" = 
  CASE
    WHEN school_fees_expenditure = 'none' THEN '0'
    WHEN school_fees_expenditure LIKE '%$%' THEN REPLACE(REPLACE(school_fees_expenditure, '$', ''), ' USD', '')
	ELSE school_fees_expenditure
  END;
  
 
 SELECT * FROM "OGInsp2019__OGMB_1" oimo ----incomes NOT updated
 WHERE "OG_Nr" = 14237;

UPDATE "OGInsp2019__OGMB_1"
SET "Dry_land_income" = (
    CASE "OGInsp2019__OGMB_1"."Dry_land_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);


---

UPDATE "OGInsp2019__OGMB_1"
SET "Irrigated_income" = (
    CASE "OGInsp2019__OGMB_1"."Irrigated_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);



UPDATE "OGInsp2019__OGMB_1"
SET"Gardening_income" = (
    CASE "OGInsp2019__OGMB_1"."Gardening_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);



UPDATE "OGInsp2019__OGMB_1"
SET "Formal_employment_income" = (
    CASE "OGInsp2019__OGMB_1"."Formal_employment_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);

 
 ----



UPDATE "all_insp_19-23" 
SET "dry_land_income" = (
    CASE "all_insp_19-23"."dry_land_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        ELSE "formal_employment_income"
        END
);


---

UPDATE "all_insp_19-23" 
SET "irrigated_income" = (
    CASE "all_insp_19-23"."irrigated_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        ELSE "formal_employment_income"
        END
);



UPDATE "all_insp_19-23" 
SET"gardening_income" = (
    CASE "all_insp_19-23"."gardening_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        ELSE "formal_employment_income"
        END
);


UPDATE "all_insp_19-23" 
SET"small_business_income" = (
    CASE "all_insp_19-23"."small_business_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        ELSE "small_business_income"
        END
);



UPDATE "all_insp_19-23" 
SET "formal_employment_income" = (
    CASE "all_insp_19-23"."formal_employment_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        ELSE "formal_employment_income"
        END
);

SELECT * FROM "all_insp_19-23";

SELECT count(*) FROM "all_insp_2023";






UPDATE "all_insp_2019"
SET "how_many_not_attending" = (
    CASE 
        WHEN "how_many_not_attending" = 'none' THEN '0'
        ELSE "how_many_not_attending"
    END
);

UPDATE "all_insp_19-23"
SET "how_many_not_attending" = (
    CASE 
        WHEN "how_many_not_attending" = 'none' THEN '0'
        ELSE "how_many_not_attending"
    END
);



UPDATE "all_insp_2019" 
SET "dry_land_income" = (
    CASE "all_insp_2019"."dry_land_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);


---

UPDATE "all_insp_2019" 
SET "irrigated_income" = (
    CASE "all_insp_2019"."irrigated_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);



UPDATE "all_insp_2019" 
SET"gardening_income" = (
    CASE "all_insp_2019"."gardening_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);



UPDATE "all_insp_2019" 
SET "formal_employment_income" = (
    CASE "all_insp_2019"."formal_employment_income"
        WHEN 1 THEN 25
        WHEN 2 THEN 50
        WHEN 3 THEN 75
        WHEN 4 THEN 100
        WHEN 5 THEN 150
        WHEN 6 THEN 200
        WHEN 7 THEN 300
        WHEN 8 THEN 400
        WHEN 9 THEN 500
        WHEN 10 THEN 600
        WHEN 11 THEN 700
        WHEN 12 THEN 800
        WHEN 13 THEN 1000
        WHEN 14 THEN 0
        END
);

 
  SELECT * FROM "Copy_of_OGInsp2019__OGOrg_1" oimo ----incomes NOT updated
 WHERE "OG_Nr" = 2882;
 
UPDATE "all_insp_19-23" 
SET "cereal_harvest_last" = (
    CASE "all_insp_19-23"."cereal_harvest_last"
    	WHEN 'not answered' THEN NULL 
    	ELSE "cereal_harvest_last"
    	END );
    	
 UPDATE "all_insp_19-23"
SET "how_many_not_attending" = (
    CASE 
        WHEN "how_many_not_attending" = 'none' THEN '0'
        ELSE "how_many_not_attending"
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET "pupils_in_pre_school_female" = (
    CASE 
        WHEN "pupils_in_pre_school_female" = 'o' THEN '0.0'
        ELSE "pupils_in_pre_school_female"
    END
);

pupils_in_pre_school_female
pupils_in_ecd_male
pupils_in_ecd_female
pupils_in_primary_sch_male
pupils_in_primary__sch_female
pupils_in_sec_sch_male
pupils_in_sec_sch_female
pupils_in_tertiary_male
pupils_in_tertiary_female


SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET "pupils_in_ecd_male" = (
    CASE 
        WHEN "pupils_in_ecd_male" = 'o' THEN 0
        ELSE "pupils_in_ecd_male"
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET "how_many_not_attending" = (
    CASE 
        WHEN "how_many_not_attending" = 'o' THEN 0
        ELSE "how_many_not_attending"
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_ecd_female = (
    CASE 
        WHEN pupils_in_ecd_female = 'o' THEN '0.0'
        ELSE pupils_in_ecd_female
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_primary_sch_male = (
    CASE 
        WHEN pupils_in_primary_sch_male = 'o' THEN '0.0'
        ELSE pupils_in_primary_sch_male
    END
);

 UPDATE "all_insp_19-23"
SET pupils_in_primary__sch_female = (
    CASE 
        WHEN pupils_in_primary__sch_female = 'o' THEN '0.0'
        ELSE pupils_in_primary__sch_female
    END
);


SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_sec_sch_female = (
    CASE 
        WHEN pupils_in_sec_sch_female = 'o' THEN '0'
        ELSE pupils_in_sec_sch_female
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_sec_sch_male = (
    CASE 
        WHEN pupils_in_sec_sch_male = 'o' THEN '0.0'
        ELSE pupils_in_sec_sch_male
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_tertiary_male = (
    CASE 
        WHEN pupils_in_tertiary_male = 'o' THEN '0.0'
        ELSE pupils_in_tertiary_male
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_in_tertiary_female = (
    CASE 
        WHEN pupils_in_tertiary_female = 'o' THEN '0.0'
        ELSE pupils_in_tertiary_female
    END
);

SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET pupils_pre_school_male = (
    CASE 
        WHEN pupils_pre_school_male = 'o' THEN '0.0'
        ELSE pupils_pre_school_male
    END
);


SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET assets = (
    CASE 
        WHEN assets = 'o' THEN '0.0'
        ELSE assets
    END
);


SELECT * FROM "all_insp_19-23" ai ;

 UPDATE "all_insp_19-23"
SET cattle = (
    CASE 
        WHEN cattle = 'o' THEN '0.0'
        ELSE cattle
    END
);


 UPDATE "all_insp_19-23"
SET television = (
    CASE 
        WHEN television = 'o' THEN '0.0'
        ELSE television
    END
);

SELECT assets  FROM "all_insp_19-23" ai 
ORDER BY assets  DESC ;

SELECT DISTINCT assets FROM "all_insp_19-23" ai ;

SELECT DISTINCT area FROM all_insp_15_18 ai ;

UPDATE all_insp_15_18 
SET date_entered =(
	CASE 
        WHEN date_entered is NULL THEN '2015-10-27'
        ELSE date_entered
    END
);

SELECT * FROM all_insp_15_18 ai WHERE og_nr IS NULL AND wc_nr IS null;

UPDATE all_insp_15_18 
SET date_inspected  =(
	CASE 
        WHEN date_inspected  is NULL THEN date_entered
        ELSE date_inspected
    END
);


UPDATE all_insp_15_18 AS a
SET date_of_birth = (
    CASE
        WHEN a.date_of_birth IS NULL THEN f.date_of_birth
        ELSE a.date_of_birth
    END
)
FROM all_farmers AS f
WHERE a.og_nr = f.og_nr;


UPDATE all_insp_15_18 AS a
SET date_of_birth = (
    CASE
        WHEN a.date_of_birth IS NULL THEN f.date_of_birth
        ELSE a.date_of_birth
    END
)
FROM "all_insp_19-23" AS f
WHERE a.og_nr = f.og_nr;

SELECT count(*) FROM all_insp_15_18 ai WHERE hh_under_5_years_male  IS NULL AND "hh_18-59_years_female" IS null;

SELECT date_inspected, date_entered  FROM "all_insp_15_18" ai  WHERE date_entered  IS null ;

SELECT * FROM all_insp_15_23 ai ;

SELECT hm_under_5_years_female , wc_nr, og_nr  FROM all_insp_15_23 ai ORDER BY hm_under_5_years_female DESC;

UPDATE all_insp_15_23 
SET hm_under_5_years_female = ( 
	CASE 
		WHEN hm_under_5_years_female = '362' THEN NULL 
		ELSE hm_under_5_years_female 
	END);
	
SELECT "hm_5-17_years_female"  , wc_nr, og_nr  FROM all_insp_15_23 ai ORDER BY "hm_5-17_years_female"  DESC;

SELECT * FROM all_purchase ap WHERE total_payment_usd < 1 ORDER BY total_payment_usd asc;

SELECT DISTINCT household_head FROM all_insp_15_23 ai ;

UPDATE all_insp_15_23 
SET household_head = lower(household_head );


UPDATE all_insp_15_23 
SET household_head  = ( 
	CASE 
		WHEN household_head = 'husbad' THEN 'husband' 
		WHEN household_head = 'seif' THEN 'self'
		ELSE household_head  
	END);
	
SELECT count(og_nr) FROM "all_insp_19-23" ai ;

SELECT count(og_nr) FROM "all_insp_15_23" ai ;

SELECT count(wc_nr) FROM all_insp_15_23 ai ;

SELECT DISTINCT "bank/mobile_account"  FROM all_insp_15_23 ai ;


UPDATE all_insp_15_23 
SET "bank/mobile_account" = CASE
                           	WHEN "bank/mobile_account" = '1.0' THEN 'yes'
                              WHEN "bank/mobile_account" = '2.0' THEN 'no'
                              ELSE "bank/mobile_account"
                            END;
                           
UPDATE all_insp_15_23 
SET "bank/mobile_account" = CASE
                           	WHEN "bank/mobile_account" = '1' THEN 'yes'
                              WHEN "bank/mobile_account" = '2' THEN 'no'
                              ELSE "bank/mobile_account"
                            END; 
                                                     
UPDATE all_insp_15_23 
SET "bank/mobile_account" = CASE
                           	WHEN "bank/mobile_account" = 'Ecocash' THEN 'yes'                          
                            ELSE "bank/mobile_account"
                            END;                            

                           
UPDATE all_insp_15_23 
SET "bank/mobile_account" = CASE
                           	WHEN "bank/mobile_account" = 'Bank' THEN 'yes'  
                           	WHEN "bank/mobile_account" = 'none' THEN 'no' 
                           	WHEN "bank/mobile_account" = 'ye' THEN 'yes' 
                           	WHEN "bank/mobile_account" = 'No' THEN 'no' 
                            ELSE "bank/mobile_account"
                            END;                            
UPDATE all_insp_15_23 
CREATE COLUMN 


SELECT "Date_contracted"  FROM "OG_Info_reserve__OGOrg_1" oiro WHERE "OG_Nr" = 	
union
SELECT date_contracted FROM all_farmers af  WHERE "og_nr" = 19486 ::text;

SELECT * FROM all_insp_15_23 ai WHERE "og_nr" = 2771.0;

UPDATE all_insp_15_23 
SET "date_inspected" =( CASE
                           	WHEN "date_entered" = NULL THEN "date_inspected" 
                           	ELSE "date_entered" 
                           	END); 
                           	
UPDATE "OG_Info__OGOrg_1"  
SET "Date_contracted" =( CASE
                           	WHEN "Date_contracted" = '31/08/18' THEN '31/08/2018' 
                           	WHEN "Date_contracted" = '30/08/18' THEN '30/08/2018' 
                           	WHEN "Date_contracted" = '24/02/23' THEN '24/02/2023'
                           	WHEN "Date_contracted" = '19/08/218' THEN '19/08/2018' 
                           	WHEN "Date_contracted" = '18/07/17' THEN '18/07/2017'
                           	WHEN "Date_contracted" = '24/2/2023' THEN '24/02/2023'
                           	WHEN "Date_contracted" = '09/01/73' THEN '31/08/2018'
                           	WHEN "Date_contracted" = '01/0/2022' THEN '01/08/2022'
                           	ELSE "Date_contracted" 
                           	END);   
                           
 SELECT  DISTINCT "Date_contracted" FROM "OG_Info__OGOrg_1" ;  
 
SELECT * FROM "OG_Info__OGOrg_1" WHERE "OG_Nr" = '20110';
SELECT * FROM "OG_Info__OGOrg" WHERE "OG_Nr" = '20110';

ALTER TABLE "OG_Info__OGOrg_1" 
ALTER COLUMN "Date_contracted" TYPE DATE;

-- Step 1: Add a new temporary column of type DATE
ALTER TABLE "OG_Info__OGOrg_1" 
ADD COLUMN temp_date_column DATE;

-- Step 2: Update the temporary column with converted values
UPDATE "OG_Info__OGOrg_1" 
SET temp_date_column = TO_DATE("Date_contracted", 'dd mm yyyy');

SELECT "Date_contracted" FROM "OG_Info__OGOrg_1" oio ;

-- Step 3: Drop the original column
ALTER TABLE "OG_Info__OGOrg_1" 
DROP COLUMN "Date_contracted";

-- Step 4: Rename the temporary column to the original column name
ALTER TABLE "OG_Info__OGOrg_1" 
RENAME COLUMN temp_date_column TO "Date_contracted";

SELECT * FROM "OG_Info__OGOrg_1" oio 
WHERE "Date_contracted" > "Date_dropped_out";

SELECT DISTINCT "Date_dropped_out" FROM "OG_Info__OGOrg_1" oio ;

UPDATE "OG_Info__OGOrg_1"  
SET "Date_dropped_out" =( CASE
                           	WHEN "Date_dropped_out" = '24/9/2018' THEN '24/09/2018' 
                           	WHEN "Date_dropped_out" = '9/1/2018' THEN '09/01/2018' 
                           	WHEN "Date_dropped_out" = '25/9/2018' THEN '25/09/2018'
                           	WHEN "Date_dropped_out" = '15/1/2018' THEN '15/01/2018' 
                           	WHEN "Date_dropped_out" = '1/1/2020' THEN '01/01/2020'
                           	WHEN "Date_dropped_out" = '1/11/2017' THEN '01/11/2017'
                           	WHEN "Date_dropped_out" = '9/1/2019' THEN '09/01/2019'
                           	WHEN "Date_dropped_out" = '4/12/2017' THEN '04/12/2017'
                           	WHEN "Date_dropped_out" = '2/10/2018' THEN '02/10/2018'
                           	WHEN "Date_dropped_out" = '22/6/2020' THEN '22/06/2020'
                           	WHEN "Date_dropped_out" = '7/11/2017' THEN '07/11/2017'
                           	WHEN "Date_dropped_out" = '14/12/20' THEN '14/12/2020'
                           	ELSE "Date_dropped_out" 
                           	END);
                           	
-- Step 1: Add a new temporary column of type DATE
ALTER TABLE "OG_Info__OGOrg_1" 
ADD COLUMN temp_date_column DATE;

-- Step 2: Update the temporary column with converted values
UPDATE "OG_Info__OGOrg_1" 
SET temp_date_column = TO_DATE("Date_dropped_out", 'dd mm yyyy');

SELECT "Date_dropped_out", temp_date_column FROM "OG_Info__OGOrg_1" oio ;

-- Step 3: Drop the original column
ALTER TABLE "OG_Info__OGOrg_1" 
DROP COLUMN "Date_dropped_out";

-- Step 4: Rename the temporary column to the original column name
ALTER TABLE "OG_Info__OGOrg_1" 
RENAME COLUMN temp_date_column TO "Date_dropped_out";          

SELECT "Date_dropped_out" FROM "OG_Info__OGOrg_1" oio ;

SELECT "Date_dropped_out", date_contracted, "OG_Nr"  FROM "OGInfo__OGMB_1" oo WHERE "Date_dropped_out" < "date_contracted"; 


SELECT * FROM all_purchase ap WHERE amount_in_kg IS NULL ;

ALTER TABLE all_purchase 
ADD COLUMN price_per_kg_usd float ;

SELECT household_members, og_nr FROM all_insp_dup_15_23 aid ;

SELECT count(og_nr) FROM all_insp_2023;


---------
SELECT  DISTINCT product, count( product) FROM all_purchase ap GROUP BY product  ;

UPDATE all_purchase   
SET "price_per_kg_usd" = CASE
                            WHEN "product" = 'Rosella (subdariffa) petals (org)' THEN 1.1 
                            WHEN "product" = 'Mongongo seed (org)' THEN 1.25 
                            WHEN "product" = 'Baobab leaves (org)' THEN 1.5 
                            WHEN "product" = 'Rosella petals (con)' THEN 0.35 
                            WHEN "product" = 'Marula Kennels' THEN 2 
                            WHEN "product" = 'Devil’s Claw root (org)' THEN 2.2 
                            WHEN "product" = 'Gotu kola leaves (con)' THEN 2.5 
                            WHEN "product" = 'Gotu kola leaves (org)' THEN 7.51 
                            WHEN "product" = 'Baobab fruit whole (org)' THEN 0.09 
                            WHEN "product" = 'Devil’s Claw root (con)' THEN 2.2 
                            WHEN "product" = 'Marula oil (org)' THEN 0
                            WHEN "product" = 'Rosella (subdariffa) seed (org)' THEN 0.4 
                            WHEN "product" = 'Devil’s Claw plant part (con)' THEN 2.2 
                            WHEN "product" = 'Devil’s Claw seed (org)' THEN 2.2
                            WHEN "product" = 'Resurection Bush' THEN 0.8
                            WHEN "product" = 'Baobab pulp and seed (org)' THEN 0.2 
                            WHEN "product" = 'Kalahari melon seed (org)' THEN 1.25 
                            WHEN "product" = 'Trichillia emetica' THEN 0
                            WHEN "product" = 'Ximenia Americana seed (org)' THEN 1.25
                            WHEN "product" = 'Ximenia Caffra Seed (org)' THEN 1.25  
                            WHEN "product" = 'Paprika fruit whole (org)' THEN 2.7
                            WHEN "product" = 'Baobab whole fruit (con)' THEN 0.09  
                            WHEN "product" = 'Safflower petals (org)' THEN 14  
                            WHEN "product" = 'Strophanthus (kombe) seed (con)' THEN 10 
                            WHEN "product" = 'Strophanthus (kombe) seed (org)' THEN 10 
                            WHEN "product" = 'Strophanthus (gratus) seed (org)' THEN 10
                            WHEN "product" = 'Devil’s Claw plant part (org)' THEN 2.2
                            WHEN "product" = 'Marula seed (org)' THEN 2.5
                            WHEN "product" = 'Bird''s Eye Chilli fruit whole (org)' THEN 3.5
                            ---ELSE 'price_per_kg_usd'
                       END;
                      
                      
SELECT * FROM all_purchase;

ALTER TABLE all_purchase 
ADD COLUMN calculated_price_paid float ;

UPDATE all_purchase 
SET calculated_price_paid = amount_in_kg * price_per_kg_usd;

SELECT DISTINCT product FROM all_purchase WHERE calculated_price_paid IS NULL;

SELECT  DISTINCT product, count( product) 
FROM all_purchase ap 
WHERE calculated_price_paid IS null
GROUP BY product ;

SELECT * FROM all_purchase WHERE product = 'Marula seed (org)';


SELECT * FROM all_purchase WHERE product = 'Baobab fruit whole (org)';

SELECT * FROM all_insp_dup_15_23 aid ;


SELECT *
FROM all_farmers
WHERE og_nr = wc_nr;

SELECT *
FROM all_purchase ap 
WHERE product IS NULL ;

SELECT "date_inspected_x", "date_inspected_y" FROM baseline2018_and_insp bai  ;

SELECT avg('healthcare_expenditure') FROM baseline2018_and_insp bai ;

SELECT DISTINCT main_livelihood_activity, count(main_livelihood_activity ) FROM all_insp_15_23 ai GROUP BY main_livelihood_activity ;

SELECT * FROM baseline2018_and_insp bai ;

SELECT * FROM all_insp_15_18 ai ;

SELECT DISTINCT months_food_lasts  FROM all_insp_15_18 ai ;

SELECT wc_nr_y , wc_nr_x FROM baseline2018_and_insp bai ;

SELECT "bank/mobile_account" FROM baseline2018_and_insp bai ;

SELECT count (DISTINCT wc_nr) 
FROM  all_insp_15_23 ai 
WHERE "date_inspected" >= '2015-01-01' AND "date_inspected" <= '2015-12-31' ;

SELECT * FROM all_insp_15_23 ai  ;


 7440.0,
 22556.0,
 44995.0,
 10429.0,
 10618.0,
 10590.0,
 10611.0,
 10655.0,
 48404.0,

SELECT * FROM "wc_info__WCOrg" oio  WHERE "WC_Nr"  = 7440;

SELECT DISTINCT area FROM all_farmers af ;

SELECT * FROM all_farmers WHERE area = 'Chipinge';
