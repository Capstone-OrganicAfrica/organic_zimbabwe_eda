
----Select to see how many values in wrong format
SELECT *
FROM "OGInsp2021__OGMB_1"
WHERE "Date_of_birth" LIKE '%/%';

SELECT  * FROM "OGInsp2021__OGMB_1"
WHERE "Date_of_birth" '31021981'AND length("Date_of_birth") = 8;
;
 
--Change the date of birth in right format
UPDATE "OGInsp2021__OGMB_1"
SET "new_date_of_birth" = make_date(RIGHT("Date_of_birth", 4)::INT, SUBSTRING("Date_of_birth" FROM 3 FOR 2)::INT, LEFT("Date_of_birth", 2)::INT)
WHERE "Date_of_birth" IS NOT NULL AND "Date_of_birth" <>'31021981' AND  "Date_of_birth" <>'31091986'
AND length("Date_of_birth") = 8;

SELECT make_date(RIGHT("Date_of_birth", 4)::INT, SUBSTRING("Date_of_birth" FROM 3 FOR 2)::INT, LEFT("Date_of_birth", 2)::INT) FROM "OGInsp2021__OGMB_1"
 
WHERE "Date_of_birth" IS NOT NULL AND "Date_of_birth" <>'31021981'
AND length("Date_of_birth") = 8;

---Replasing "/ " where needed
UPDATE "OGInsp2021__OGMB_1"
SET "Date_of_birth" = REPLACE("Date_of_birth", '/', '')
WHERE "Date_of_birth" LIKE '%/%';

SELECT * FROM "OGInsp2021__OGMB_1";

----Droping Smallholders_activities
ALTER TABLE "OGInsp2021__OGMB_1"
DROP COLUMN "Smallholder_activities";

------ Changing format and replasing USD and $

UPDATE "OGInsp2021__OGMB_1"
SET "last_quarter_food_expenditure" = REPLACE(REPLACE("last_quarter_food_expenditure", '$', ''), ' USD', '')
WHERE "last_quarter_food_expenditure" LIKE '%$% USD';

----Remove all the letters and sighns exept none values 
UPDATE "OGInsp2021__OGMB_1"
SET "last_quarter_food_expenditure" = COALESCE(
    NULLIF(REGEXP_REPLACE("last_quarter_food_expenditure", '[^0-9]', '', 'g'), ''),
    '0'
)
WHERE "last_quarter_food_expenditure" LIKE '%$%';


---replace none with 0

UPDATE "OGInsp2021__OGMB_1"
SET "last_quarter_food_expenditure" = CASE WHEN "last_quarter_food_expenditure" = 'not answered' THEN '0' ELSE "last_quarter_food_expenditure" END;


UPDATE "OGInsp2021__OGMB_1"
SET "last_quarter_food_expenditure" = REPLACE("last_quarter_food_expenditure", ' USD', '')
WHERE "last_quarter_food_expenditure" LIKE '% USD';


SELECT
    "Distance_from_nearest_clinic",
    CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END AS converted_distance
FROM
    "OGInsp2021__OGMB_1";

   
   ---- make a new column 
ALTER TABLE  "OGInsp2021__OGMB_1"
add COLUMN "nearest_clinic" float ;


----finaly update 

UPDATE "OGInsp2021__OGMB_1"
SET "nearest_clinic" = CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

---Droping column / have a new one 
   
  ALTER TABLE "OGInsp2021__OGMB_1" DROP COLUMN "nearest_school";

  
 ------- make a new column for 
 ALTER TABLE  "OGInsp2021__OGMB_1"
add COLUMN "nearest_school" float ;

 
 ----uphdate in nearest_school


UPDATE "OGInsp2021__OGMB_1"
SET "nearest_school" = CASE
        WHEN "Distance_from_nearest_School" = '' THEN 0
        WHEN "Distance_from_nearest_School" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

------- droping    Distance_from_nearest_School
   
   ALTER TABLE "OGInsp2021__OGMB_1" DROP COLUMN "Distance_from_nearest_School";
   
   
  
   ---- make a new column 
ALTER TABLE  "OGInsp2021__OGMB_1"
add COLUMN "nearest_clinic" float ;


----finaly update 

UPDATE "OGInsp2021__OGMB_1"
SET "nearest_clinic" = CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

---Droping column / have a new one 
   
  ALTER TABLE "OGInsp2021__OGMB_1" DROP COLUMN "nearest_school";

  
 ------- make a new column for Distance_from_nearest_Shops
 ALTER TABLE  "OGInsp2021__OGMB_1"
add COLUMN "nearest_shops" float ;

 
 ----uphdate in nearest_Shops


UPDATE "OGInsp2021__OGMB_1"
SET "nearest_shops" = CASE
        WHEN "Distance_from_nearest_Shops" = '' THEN 0
        WHEN "Distance_from_nearest_Shops" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

------- droping    Distance_from_nearest_School
   
   ALTER TABLE "OGInsp2021__OGMB_1" DROP COLUMN "Distance_from_nearest_Shops";
   
  -------------------------------------------------------------- 
   



