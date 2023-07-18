CREATE TABLE "OGInfo__OGMB_1"  AS
TABLE "OGInfo__OGMB";

SELECT *
FROM "OGInfo__OGMB_1" ;

SELECT DISTINCT "Ward_Nr/Name"
FROM "OGInfo__OGMB_1";

UPDATE "OGInfo__OGMB_1"
SET "Date_contracted" = REPLACE("Date_contracted", '-', '')
WHERE "Date_contracted" LIKE '%-%';

ALTER TABLE "OGInfo__OGMB_1"
ADD COLUMN "date_contracted1" date;

UPDATE "OGInfo__OGMB_1"
SET "date_contracted" = make_date(RIGHT("Date_contracted", 4)::INT, SUBSTRING("Date_contracted" FROM 3 FOR 2)::INT, LEFT("Date_contracted", 2)::INT)
WHERE "Date_contracted" IS NOT NULL AND "Date_contracted" <>'7032022' AND "Date_contracted" <>'242022' AND "Date_contracted" <> '31092020'
AND length("Date_contracted") = 8;


UPDATE organic_africa."OGInfo__OGMB_1"
SET "Date_contracted" = b."Date_contracted"
FROM organic_africa."OGInfo__OGMB" b
WHERE organic_africa."OGInfo__OGMB_1"."ID" = b."ID";



SELECT
    CASE
        WHEN "Date_contracted" ~ '^([0-9]{4}) ([1-9]) ([0-9]{1,2})$' THEN REGEXP_REPLACE("Date_contracted", '^([0-9]{4}) ([1-9]) ([0-9]{1,2})$', '\\1 0\\2 \\3')
        ELSE "Date_contracted"
    END AS modified_date
FROM "OGInfo__OGMB_1";

SELECT to_date("Date_contracted", 'dd/mm/yyyy')
FROM "OGInfo__OGMB_1" oo 
WHERE "Date_contracted" <> '15/122018';

SELECT
  "Date_contracted",
  TO_DATE(
    LPAD(SPLIT_PART("Date_contracted", '/', 1), 2, '0') || '/' ||
    LPAD(SPLIT_PART("Date_contracted", '/', 2), 2, '0') || '/' ||
    SPLIT_PART("Date_contracted", '/', 3),
    'DD/MM/YYYY'
  ) AS synced_date
FROM "OGInfo__OGMB_1"
WHERE "Date_contracted" <> '31/09/2020';

UPDATE "OGInfo__OGMB_1" 
SET "date_contracted" = (
  TO_DATE(
    LPAD(SPLIT_PART("Date_contracted", '/', 1), 2, '0') || '/' ||
    LPAD(SPLIT_PART("Date_contracted", '/', 2), 2, '0') || '/' ||
    SPLIT_PART("Date_contracted", '/', 3),
    'DD/MM/YYYY'
  ) )
WHERE "Date_contracted" <> '31/09/2020';

UPDATE "OGInfo__OGMB_1" 
SET "date_contracted" = (
  TO_DATE(
    LPAD(SPLIT_PART("Date_contracted", '/', 1), 2, '0') || '/' ||
    LPAD(SPLIT_PART("Date_contracted", '/', 2), 2, '0') || '/' ||
    LPAD(SPLIT_PART("Date_contracted", '/', 3), 4, '20'),
    'DD/MM/YYYY'
  ) )
WHERE "Date_contracted" <> '31/09/2020'; 

SELECT * FROM "OGInfo__OGMB_1";

CREATE TABLE "OG_Insp_2021__OGOrg_1"  AS
TABLE "OG_Insp_2021__OGOrg";

SELECT * FROM "OGInsp2021__OGMB_1"




main livelihood activity, 

Formal_emplyoment_income
