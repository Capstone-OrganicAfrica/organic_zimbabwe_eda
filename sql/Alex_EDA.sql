### wc_info_bayoba

CREATE TABLE "wc_info_bayoba_1"  AS
TABLE "wc_info_bayoba";

UPDATE  "wc_info_bayoba_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", 'Kondo', NULL)
WHERE "Ward_Nr/Name" = 'Kondo';

ALTER TABLE "wc_info_bayoba_1"
ADD COLUMN "ward_nr" INT;

UPDATE "wc_info_bayoba_1" 
SET "ward_nr" = SPLIT_PART("Ward_Nr/Name", ' ', 1)::INT;


### wc_info__WCOrg

CREATE TABLE "wc_info__WCOrg_1"  AS
TABLE "wc_info__WCOrg";

ALTER TABLE "wc_info__WCOrg_1"
ADD COLUMN "ward_nr" INT;

UPDATE "wc_info__WCOrg_1" 
SET "ward_nr" = SPLIT_PART("Ward_Nr/Name", ' ', 1)::INT;

### OG_Info__OGOrg

CREATE TABLE "OG_Info__OGOrg_1"  AS
TABLE "OG_Info__OGOrg";

ALTER TABLE "OG_Info__OGOrg_1"
ADD COLUMN "ward_nr" INT;

UPDATE  "OG_Info__OGOrg_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", 'Muchesu', '7 Muchesu')
WHERE "Ward_Nr/Name" = 'Muchesu';

UPDATE "OG_Info__OGOrg_1" 
SET "ward_nr" = SPLIT_PART("Ward_Nr/Name", ' ', 1)::INT;

--21.06.2023

SELECT DISTINCT("Species") FROM "wc_info_bayoba_1";

UPDATE "wc_info_bayoba_1"
SET "Species" = ( 
    CASE "Species"
        WHEN '35' THEN 'Trichillia'
        WHEN '5' THEN 'Baobab'
        WHEN '38' THEN 'KMS + Ximenia'
        WHEN '16' THEN 'Ximenia Caffra'
        WHEN '21' THEN 'Marula'
        WHEN '40' THEN 'Baobab+KMS+Ximenia'
        WHEN '24' THEN 'Kalahari melon seed'
        WHEN '8' THEN 'Baobab + ximenia'  
        WHEN '14' THEN 'Ximenia Americana'
        WHEN '20' THEN 'Marula'
    END);

--22.06.2023

CREATE TABLE "OG_Info_reserve__OGOrg_1"  AS
TABLE "OG_Info_reserve__OGOrg";

ALTER TABLE "OG_Info_reserve__OGOrg_1"
ADD COLUMN "ward_nr" INT;

SELECT DISTINCT("Ward_Nr/Name") FROM "OG_Info_reserve__OGOrg_1";

UPDATE  "OG_Info_reserve__OGOrg_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", 'lubu', '11 Lubu')
WHERE "Ward_Nr/Name" = 'lubu';

UPDATE  "OG_Info_reserve__OGOrg_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", '5 5 Sinakoma', '5 Sinakoma')
WHERE "Ward_Nr/Name" = '5 5 Sinakoma'; 

UPDATE  "OG_Info_reserve__OGOrg_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", 'Lubu', '11 Lubu')
WHERE "Ward_Nr/Name" = 'Lubu'; 

UPDATE  "OG_Info_reserve__OGOrg_1"
SET "Ward_Nr/Name" = REPLACE("Ward_Nr/Name", 'sinakoma', '5 Sinakoma')
WHERE "Ward_Nr/Name" = 'sinakoma';

UPDATE "OG_Info_reserve__OGOrg_1" 
SET "ward_nr" = SPLIT_PART("Ward_Nr/Name", ' ', 1)::INT;

SELECT * FROM "OG_Info_reserve__OGOrg_1";




