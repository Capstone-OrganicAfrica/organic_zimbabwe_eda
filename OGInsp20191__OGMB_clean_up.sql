CREATE TABLE "OGInsp20191__OGMB_1"  AS
TABLE "OGInsp20191__OGMB";


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO tomislavilic;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO jelenaheyland;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO tomislavilic;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO khatanzayaschmidt;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA organic_africa TO alexandrapersina;

 GRANT UPDATE, SELECT, TRUNCATE, REFERENCES, DELETE, TRIGGER, INSERT ON TABLE organic_africa."OGInfo__OGMB_1" TO alexandrapersina, khatanzayaschmidt, tomislavilic;



----this one works___ 

UPDATE "OGInsp20191__OGMB_1"
SET "Marital_status" = (
    CASE "OGInsp20191__OGMB_1"."Marital_status"
        WHEN '2' THEN 'married'
        WHEN '3' THEN 'single'
        WHEN '4' THEN 'divorced'
        WHEN '5' THEN 'widowed'
        WHEN '6' THEN 'divorced'
    END
);



SELECT * 
FROM "OGInsp20191__OGMB_1" cooo ;
-------



UPDATE "OGInsp20191__OGMB_1"
SET "Sex" = (
    CASE "OGInsp20191__OGMB_1"."Sex"
        WHEN '1' THEN 'male'
        WHEN '2' THEN 'female'
    END
);
------ 



UPDATE "OGInsp20191__OGMB_1"
SET "Household_head" = (
    CASE "OGInsp20191__OGMB_1"."Household_head"
        WHEN '1' THEN 'husband'
        WHEN '2' THEN 'wife'
        WHEN '3' THEN 'mother'
        WHEN '4' THEN 'father'
        WHEN '5' THEN 'grandmother'
        WHEN '6' THEN 'grandfather'
        WHEN '7' THEN 'nephew'
        WHEN '8' THEN 'niece'
        WHEN '9' THEN 'son in law'
        WHEN '10' THEN 'daughter in law'
        WHEN '11' THEN 'self'
        WHEN '12' THEN 'son'
        WHEN '13' THEN 'daughter'
        END
);


---



UPDATE "OGInsp20191__OGMB_1"
SET "HH_education_level" = (
    CASE "OGInsp20191__OGMB_1"."HH_education_level"
        WHEN '1' THEN 'Pre-school'
        WHEN '2' THEN 'Early childhood development'
        WHEN '3' THEN 'Primary school'
        WHEN '4' THEN 'Ordinary level'
        WHEN '5' THEN 'Tertiary or vocational'
        WHEN '6' THEN 'None'
        WHEN '7' THEN 'Standard 1'
        WHEN '8' THEN 'Standard 3'
        WHEN '9' THEN 'Advanced level'
        WHEN '10' THEN 'Zimbabwe Junior certificate'
        ---WHEN 11 THEN 'self'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);


---


UPDATE "OGInsp20191__OGMB_1"
SET "Reason_for_not_attending" = (
    CASE "OGInsp20191__OGMB_1"."Reason_for_not_attending"
        WHEN '1' THEN 'Financial'
        WHEN '2' THEN 'Distance'
        WHEN '3' THEN 'Disability'
        WHEN '4' THEN 'under age'
        WHEN '5' THEN 'early marriage'
        WHEN '6' THEN 'None'
        WHEN '7' THEN 'no interest'
        WHEN '8' THEN 'under age'
        WHEN '9' THEN 'no children'
        WHEN '10' THEN 'Covid'
        WHEN '11' THEN 'Ill/sick'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);

SELECT * 
FROM "OGInsp20191__OGMB_1" cooo ;
-----



UPDATE "OGInsp20191__OGMB_1"
SET "Main_livelihood_activity" = (
    CASE "OGInsp20191__OGMB_1"."Main_livelihood_activity"
        WHEN '1' THEN 'Dry land farming'
        WHEN '2' THEN 'Irrigated farming'
        WHEN '3' THEN 'Gardening'
        WHEN '4' THEN 'formal employment'
        WHEN '5' THEN 'Small business'
        WHEN '6' THEN 'Organic or  Mabagrown farming'
        WHEN '7' THEN 'Livestock breeding'
        WHEN '8' THEN 'none'
        --WHEN 9 THEN 'no children'
        --WHEN 10 THEN 'Covid'
        ---WHEN 11 THEN 'Ill/sick'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);

---



UPDATE "OGInsp20191__OGMB_1"
SET "Dry_land_income" = (
    CASE "OGInsp20191__OGMB_1"."Dry_land_income"
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

UPDATE "OGInsp20191__OGMB_1"
SET "Irrigated_income" = (
    CASE "OGInsp20191__OGMB_1"."Irrigated_income"
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



UPDATE "OGInsp20191__OGMB_1"
SET"Gardening_income" = (
    CASE "OGInsp20191__OGMB_1"."Gardening_income"
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



UPDATE "OGInsp20191__OGMB_1"
SET "Formal_employment_income" = (
    CASE "OGInsp20191__OGMB_1"."Formal_employment_income"
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



UPDATE "OGInsp20191__OGMB_1"
SET "Small_business_income" = (
    CASE "OGInsp20191__OGMB_1"."Small_business_income"
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

--


UPDATE "OGInsp20191__OGMB_1"
SET "Insufficient_cereal_reason_1" = (
    CASE "OGInsp20191__OGMB_1"."Insufficient_cereal_reason_1"
        WHEN '1' THEN 'Non affordability of fertilizer'
        WHEN '2' THEN 'Non Availability of fertilizer'
        WHEN '3' THEN 'Non Availability of Seed'
        WHEN '4' THEN 'Non Affordability of Seed'
        WHEN '5' THEN 'Poor Rainfall'
        WHEN '6' THEN 'Shortage of labour'
        WHEN '7' THEN 'Lack of Draught power'
        WHEN '8' THEN 'Not enough land'
        WHEN '9' THEN 'Natural disaster'
        WHEN '10' THEN 'n/a'
        WHEN '11' THEN 'not answered'
        WHEN '12' THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);



UPDATE "OGInsp20191__OGMB_1"
SET "Insufficient_cereal_reason_2" = (
    CASE "OGInsp20191__OGMB_1"."Insufficient_cereal_reason_2"
        WHEN '1' THEN 'Non affordability of fertilizer'
        WHEN '2' THEN 'Non Availability of fertilizer'
        WHEN '3' THEN 'Non Availability of Seed'
        WHEN '4' THEN 'Non Affordability of Seed'
        WHEN '5' THEN 'Poor Rainfall'
        WHEN '6' THEN 'Shortage of labour'
        WHEN '7' THEN 'Lack of Draught power'
        WHEN '8' THEN 'Not enough land'
        WHEN '9' THEN 'Natural disaster'
        WHEN '10' THEN 'n/a'
        WHEN '11' THEN 'not answered'
        WHEN '12' THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

ALTER TABLE "OGInsp20191__OGMB_1" 
ADD COLUMN insufficient_cereal_reason_3 TEXT;

UPDATE "OGInsp20191__OGMB_1"
SET "Insufficient_cereal_reason_3" = (
    CASE "OGInsp20191__OGMB_1"."Insufficient_cereal_reason_3"
        WHEN '1' THEN 'Non affordability of fertilizer'
        WHEN '2' THEN 'Non Availability of fertilizer'
        WHEN '3' THEN 'Non Availability of Seed'
        WHEN '4' THEN 'Non Affordability of Seed'
        WHEN '5' THEN 'Poor Rainfall'
        WHEN '6' THEN 'Shortage of labour'
        WHEN '7' THEN 'Lack of Draught power'
        WHEN '8' THEN 'Not enough land'
        WHEN '9' THEN 'Natural disaster'
        WHEN '10' THEN 'n/a'
        WHEN '11' THEN 'not answered'
        WHEN '12' THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);
ALTER TABLE "OGInsp20191__OGMB_1"
ALTER COLUMN "Type_of_stove" TYPE TEXT;

UPDATE "OGInsp20191__OGMB_1"
SET "Type_of_stove" = (
    CASE "OGInsp20191__OGMB_1"."Type_of_stove"
        WHEN '1' THEN 'Electricity'
        WHEN '2' THEN 'Gas'
        WHEN '3' THEN 'Paraffin'
        WHEN '4' THEN 'Charcoal'
        WHEN '5' THEN 'Firewood'
        WHEN '6' THEN 'Dung'
        WHEN '7' THEN 'unanswered'
        --WHEN 8 THEN 'Not enough land'
        --WHEN 9 THEN 'Natural disaster'
       -- WHEN 10 THEN 'n/a'
        --WHEN 11 THEN 'not answered'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);




UPDATE "OGInsp20191__OGMB_1"
SET "Main_source_of_HH_water" = (
    CASE "OGInsp20191__OGMB_1"."Main_source_of_HH_water"
        WHEN '1' THEN 'Borehole'
        WHEN '2' THEN 'Open well'
        WHEN '3' THEN 'Dam'
        WHEN '4' THEN 'Stream or river'
        WHEN '5' THEN 'Other'
        WHEN '6' THEN 'Unanswered'
        WHEN '7' THEN 'Municipal'
        WHEN '8' THEN 'Spring'
        WHEN '9' THEN 'No irrigation'
       	WHEN '10' THEN 'Closed well'
        WHEN '11' THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Source_of_irrigation_water" = (
    CASE "OGInsp20191__OGMB_1"."Source_of_irrigation_water"
        WHEN '1' THEN 'Borehole'
        WHEN '2' THEN 'Open well'
        WHEN '3' THEN 'Dam'
        WHEN '4' THEN 'Stream or river'
        WHEN '5' THEN 'Other'
        WHEN '6' THEN 'Unanswered'
        WHEN '7' THEN 'Municipal'
        WHEN '8' THEN 'Spring'
        WHEN '9' THEN 'No irrigation'
       	WHEN '10' THEN 'Closed well'
        WHEN '11' THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

SELECT *
FROM "OGInsp20191__OGMB_1" cooo ;

ALTER TABLE "OGInsp20191__OGMB_1" 
drop COLUMN source_of_irrigation_water;


-- Alter the column data type to text
ALTER TABLE "OGInsp20191__OGMB_1"
ALTER COLUMN "Electricity" TYPE text;

-- Update the values
UPDATE "OGInsp20191__OGMB_1"
SET "Electricity" = CASE
                           	WHEN "Electricity" = '1' THEN 'yes'
                              WHEN "Electricity" = '0' THEN 'no'
                              ELSE "Electricity"
                            END;

UPDATE "OGInsp20191__OGMB_1"
SET "Availabilty_of_HH_latrine" = (
    CASE "OGInsp20191__OGMB_1"."Availabilty_of_HH_latrine"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Enough_cereal_2018" = (
    CASE "OGInsp20191__OGMB_1"."Enough_cereal_2018"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Enough_cereal_2017" = (
    CASE "OGInsp20191__OGMB_1"."Enough_cereal_2017"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Enough_cereal_2016" = (
    CASE "OGInsp20191__OGMB_1"."Enough_cereal_2016"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Enough_cereal_2015" = (
    CASE "OGInsp20191__OGMB_1"."Enough_cereal_2015"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Latrine_Type" = (
    CASE "OGInsp20191__OGMB_1"."Latrine_Type"
        WHEN '1' THEN 'No'
        WHEN '2' THEN 'BVIP'
        WHEN '3' THEN 'Dam'
        WHEN '4' THEN 'Pit'
        WHEN '5' THEN 'Flush'
        WHEN '6' THEN 'Other'
        WHEN '7' THEN 'unanswered'
        --WHEN 8 THEN 'Spring	'
        --WHEN 9 THEN 'No irrigation'
       	--WHEN 10 THEN 'Closed well'
        --WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Membership_to_other_organisations" = (
    CASE "OGInsp20191__OGMB_1"."Membership_to_other_organisations"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END
 );
 


UPDATE "OGInsp20191__OGMB_1"
SET "organisation_1" = (
    CASE "OGInsp20191__OGMB_1"."organisation_1"
        WHEN '1' THEN 'CPC'
        WHEN '2' THEN 'Save the Children'
        WHEN '3' THEN 'Social Welfare'
        WHEN '4' THEN 'ZUBO'
        WHEN '5' THEN 'Kunzwana womens association'
        WHEN '6' THEN 'none'
        WHEN '7' THEN 'church'
        WHEN '8' THEN 'Basilwizi'
        WHEN '9' THEN 'School development Association'
       	WHEN '10' THEN 'Tusumbuke'
        WHEN '11' THEN 'FSNZ'
        WHEN '12' THEN 'GMB'
        WHEN '13' THEN 'Carbon Green'
        WHEN '14' THEN 'CAMFED'
        WHEN '15' THEN 'Heifer'
        WHEN '16' THEN 'Sacco'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Organisation_2" = (
    CASE "OGInsp20191__OGMB_1"."Organisation_2"
        WHEN '1' THEN 'CPC'
        WHEN '2' THEN 'Save the Children'
        WHEN '3' THEN 'Social Welfare'
        WHEN '4' THEN 'ZUBO'
        WHEN '5' THEN 'Kunzwana womens association'
        WHEN '6' THEN 'none'
        WHEN '7' THEN 'church'
        WHEN '8' THEN 'Basilwizi'
        WHEN '9' THEN 'School development Association'
       	WHEN '10' THEN 'Tusumbuke'
        WHEN '11' THEN 'FSNZ'
        WHEN '12' THEN 'GMB'
        WHEN '13' THEN 'Carbon Green'
        WHEN '14' THEN 'CAMFED'
        WHEN '15' THEN 'Heifer'
        WHEN '16' THEN 'Sacco'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Organisation_3" = (
    CASE "OGInsp20191__OGMB_1"."Organisation_3"
        WHEN '1' THEN 'CPC'
        WHEN '2' THEN 'Save the Children'
        WHEN '3' THEN 'Social Welfare'
        WHEN '4' THEN 'ZUBO'
        WHEN '5' THEN 'Kunzwana womens association'
        WHEN '6' THEN 'none'
        WHEN '7' THEN 'church'
        WHEN '8' THEN 'Basilwizi'
        WHEN '9' THEN 'School development Association'
       	WHEN '10' THEN 'Tusumbuke'
        WHEN '11' THEN 'FSNZ'
        WHEN '12' THEN 'GMB'
        WHEN '13' THEN 'Carbon Green'
        WHEN '14' THEN 'CAMFED'
        WHEN '15' THEN 'Heifer'
        WHEN '16' THEN 'Sacco'
        END
);

ALTER TABLE "OGInsp20191__OGMB_1" 
ALTER COLUMN "Training/inputs_recieved_3" type TEXT;

SELECT * FROM "OGInsp20191__OGMB_1";


UPDATE "OGInsp20191__OGMB_1"
SET "Position_1" = (
    CASE "OGInsp20191__OGMB_1"."Position_1"
        WHEN '1' THEN 'Secretary'
        WHEN '2' THEN 'Chairperson'
        WHEN '3' THEN 'Deputy Chairperson'
        WHEN '4' THEN 'Member'
        WHEN '5' THEN 'Treasurer'
        WHEN '6' THEN 'Committee member'
        WHEN '7' THEN 'Beneficiary'
        WHEN '8' THEN 'Pastors wife'
        WHEN '9' THEN 'Pastor'
       	WHEN '10' THEN 'not applicable'
        WHEN '11' THEN 'health worker'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "position_2" = (
    CASE "OGInsp20191__OGMB_1"."position_2"
        WHEN '1' THEN 'Secretary'
        WHEN '2' THEN 'Chairperson'
        WHEN '3' THEN 'Deputy Chairperson'
        WHEN '4' THEN 'Member'
        WHEN '5' THEN 'Treasurer'
        WHEN '6' THEN 'Committee member'
        WHEN '7' THEN 'Beneficiary'
        WHEN '8' THEN 'Pastors wife'
        WHEN '9' THEN 'Pastor'
       	WHEN '10' THEN 'not applicable'
        WHEN '11' THEN 'health worker'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "position_3" = (
    CASE "OGInsp20191__OGMB_1"."position_3"
        WHEN '1' THEN 'Secretary'
        WHEN '2' THEN 'Chairperson'
        WHEN '3' THEN 'Deputy Chairperson'
        WHEN '4' THEN 'Member'
        WHEN '5' THEN 'Treasurer'
        WHEN '6' THEN 'Committee member'
        WHEN '7' THEN 'Beneficiary'
        WHEN '8' THEN 'Pastors wife'
        WHEN '9' THEN 'Pastor'
       	WHEN '10' THEN 'not applicable'
        WHEN '11' THEN 'health worker'
        END
);


1	secretary
2	Chairperson
3	Deputy Chairperson
4	Member
5	Treasure
6	Committee member
7	Beneficiary
8	Pastors wife
9	Pastor
10	not applicable
11	Health Worker

SELECT * FROM  "OGInsp20191__OGMB_1" ;

UPDATE "OGInsp20191__OGMB_1"
SET "Training/inputs_recieved_1" = (
    CASE "OGInsp20191__OGMB_1"."Training/inputs_recieved_1"
        WHEN '1' THEN 'Seed'
        WHEN '2' THEN 'Seed and fertilizers'
        WHEN '3' THEN 'Farming equipment'
        WHEN '4' THEN 'Trainig'
        WHEN '5' THEN 'not specified'
        WHEN '6' THEN 'Market'
        WHEN '7' THEN 'not applicable'
        WHEN '8' THEN 'Poultry'
        WHEN '9' THEN 'Uniforms'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Training/inputs_recieved_2" = (
    CASE "OGInsp20191__OGMB_1"."Training/inputs_recieved_2"
        WHEN '1' THEN 'Seed'
        WHEN '2' THEN 'Seed and fertilizers'
        WHEN '3' THEN 'Farming equipment'
        WHEN '4' THEN 'Trainig'
        WHEN '5' THEN 'not specified'
        WHEN '6' THEN 'Market'
        WHEN '7' THEN 'not applicable'
        WHEN '8' THEN 'Poultry'
        WHEN '9' THEN 'Uniforms'
        END
);




UPDATE "OGInsp20191__OGMB_1"
SET "Training/inputs_recieved_3" = (
    CASE "OGInsp20191__OGMB_1"."Training/inputs_recieved_3"
        WHEN '1' THEN 'Seed'
        WHEN '2' THEN 'Seed and fertilizers'
        WHEN '3' THEN 'Farming equipment'
        WHEN '4' THEN 'Trainig'
        WHEN '5' THEN 'not specified'
        WHEN '6' THEN 'Market'
        WHEN '7' THEN 'not applicable'
        WHEN '8' THEN 'Poultry'
        WHEN '9' THEN 'Uniforms'
        END
);

----IF EXISTS:

ALTER TABLE "OGInsp20191__OGMB_1" 
alter COLUMN "Health_of_Farmer" type TEXT;

UPDATE "OGInsp20191__OGMB_1"
SET "Health_of_Farmer" = (
    CASE "OGInsp20191__OGMB_1"."Health_of_Farmer"
        WHEN '1' THEN 'Good'
        WHEN '2' THEN 'Unwell'
        WHEN '3' THEN 'Chronically ill'
        END
);

SELECT *
FROM "OGInsp20191__OGMB_1" cooo ;

------- make a new column for Distance_from_nearest_Shops
 ALTER TABLE  "OGInsp20191__OGMB_1"
add COLUMN "nearest_shops" float ;

 
 ----uphdate in nearest_Shops


UPDATE "OGInsp20191__OGMB_1"
SET "nearest_shops" = CASE
        WHEN "Distance_from_nearest_Shops" = '' THEN 0
        WHEN "Distance_from_nearest_Shops" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

SELECT "nearest_shops", "Distance_from_nearest_Shops" FROM "OGInsp20191__OGMB_1" oio ;


------- make a new column for Distance_from_nearest_Shops
 ALTER TABLE  "OGInsp20191__OGMB_1"
add COLUMN "nearest_clinic" float ;

 
 ----uphdate in nearest_Shops


UPDATE "OGInsp20191__OGMB_1"
SET "nearest_clinic" = CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;   

------- make a new column for Distance_from_nearest_School
 ALTER TABLE  "OGInsp20191__OGMB_1"
add COLUMN "nearest_school" float ;

 
 ----uphdate in nearest_School


UPDATE "OGInsp20191__OGMB_1"
SET "nearest_school" = CASE
        WHEN "Distance_from_nearest_School" = '' THEN 0
        WHEN "Distance_from_nearest_School" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_School") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_School", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;   

   
 Risks_ 
 
 Risk key_: 1 low
2 Medium
3 High


Risk_of_contamination_from_Malaria_control
Risk_of_contaminated_water
Risk_from_motorways,_wastewaters
Risk_from_non_organic_activities
Risk_from_non_organic_fields
   
ALTER TABLE "OGInsp20191__OGMB_1" 
alter COLUMN "Risk_from_non_organic_fields" type TEXT;

UPDATE "OGInsp20191__OGMB_1"
SET "Risk_from_non_organic_fields" = (
    CASE "OGInsp20191__OGMB_1"."Risk_from_non_organic_fields"
        WHEN '1' THEN 'Low'
        WHEN '2' THEN 'Medium'
        WHEN '3' THEN 'High'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Risk_from_non_organic_activities" = (
    CASE "OGInsp20191__OGMB_1"."Risk_from_non_organic_activities"
        WHEN '1' THEN 'Low'
        WHEN '2' THEN 'Medium'
        WHEN '3' THEN 'High'
        END
);

UPDATE "OGInsp20191__OGMB_1"
SET "Risk_from_motorways,_wastewaters" = (
    CASE "OGInsp20191__OGMB_1"."Risk_from_motorways,_wastewaters"
        WHEN '1' THEN 'Low'
        WHEN '2' THEN 'Medium'
        WHEN '3' THEN 'High'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Risk_of_contaminated_water" = (
    CASE "OGInsp20191__OGMB_1"."Risk_of_contaminated_water"
        WHEN '1' THEN 'Low'
        WHEN '2' THEN 'Medium'
        WHEN '3' THEN 'High'
        END
);


UPDATE "OGInsp20191__OGMB_1"
SET "Risk_of_contamination_from_malaria_control" = (
    CASE "OGInsp20191__OGMB_1"."Risk_of_contamination_from_malaria_control"
        WHEN '1' THEN 'Low'
        WHEN '2' THEN 'Medium'
        WHEN '3' THEN 'High'
        END
);

SELECT * FROM "OGInsp20191__OGMB_1" oo ;

--- convert cereal harvest last to months and no words
ALTER TABLE  "OGInsp20191__OGMB_1"
add COLUMN "cereal_harvest_last" text ;

--- run this several times

   
-----------REst OF this code NOT needed -----------------

Health__care_expenditure
School_(fees)_expenditure
last_quarter_food_expenditure 

 

1 usd IS 13 rtgs.

ALTER TABLE "OGInsp20191__OGMB_1"
ADD COLUMN "health_care_expenditure" TEXT;

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "health_care_expenditure" type float USING "health_care_expenditure"::float;

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "health_care_expenditure" type text;


UPDATE "OGInsp20191__OGMB_1"
SET "health_care_expenditure" =
  CASE
    WHEN "Health__care_expenditure" = 'none' THEN '0'
    WHEN "Health__care_expenditure" LIKE '%$%' THEN REPLACE(REPLACE("Health__care_expenditure", '$', ''), ' USD', '')
    ---WHEN "Health__care_expenditure" LIKE '%$%RTGS%' THEN REPLACE(REPLACE("Health__care_expenditure", '$', ''), ' RTGS', '') / 13
    ELSE "Health__care_expenditure"
  END;
   

 SELECT "Health__care_expenditure", "health_care_expenditure" FROM "OGInsp20191__OGMB_1"; 
 SELECT * FROM "OGInsp20191__OGMB_1"; 
 
UPDATE "OGInsp20191__OGMB_1"
SET "health_care_expenditure" = REPLACE("health_care_expenditure", 'USD', '')
WHERE "Health__care_expenditure" LIKE '%USD%';
 
UPDATE "OGInsp20191__OGMB_1"
SET "health_care_expenditure" = (FLOOR(REGEXP_REPLACE("health_care_expenditure", '[^0-9]', '', 'g')::FLOAT / 13))::TEXT
WHERE "health_care_expenditure" LIKE '%zwl%'; ---- RTGS rate IN 2019 was 13 RTGS : 1 USd. CHANGE %rtgs% here TO whichever other random word IS there. 
 
 
-------- Same with "School_(fees)_expenditure"

ALTER TABLE "OGInsp20191__OGMB_1"
ADD COLUMN "school_fees_expenditure" TEXT; --AT first

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "school_fees_expenditure" type float USING "health_care_expenditure"::float; ---AT the end

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "school_fees_expenditure" type text; ---IN CASE you need TO switch back...



UPDATE "OGInsp20191__OGMB_1"
SET "school_fees_expenditure" =
  CASE
    WHEN "School_(fees)_expenditure" = 'none' THEN '0'
    WHEN "School_(fees)_expenditure" = 'Beam' THEN '0'
    WHEN "School_(fees)_expenditure" = '$9 USD + Beam' THEN '9'
    WHEN "School_(fees)_expenditure" LIKE '%$%' THEN REPLACE(REPLACE("School_(fees)_expenditure", '$', ''), ' USD', '')
    ---WHEN "Health__care_expenditure" LIKE '%$%RTGS%' THEN REPLACE(REPLACE("Health__care_expenditure", '$', ''), ' RTGS', '') / 13
    ELSE "School_(fees)_expenditure"
  END;
   

UPDATE "OGInsp2021__OGMB_1" ----IF this does NOT WORK, try the one underneath
SET "school_fees_expenditure" = REPLACE(REPLACE("school_fees_expenditure", '$', ''), ' USD', '')
WHERE "School_(fees)_expenditure" LIKE '%$% USD';

 SELECT "School_(fees)_expenditure", "school_fees_expenditure" FROM "OGInsp20191__OGMB_1";  ----CONTROL check
 SELECT * FROM "OGInsp20191__OGMB_1"; 
 
UPDATE "OGInsp20191__OGMB_1"
SET "school_fees_expenditure" = REPLACE("school_fees_expenditure", 'Beam', '0')
WHERE "School_(fees)_expenditure" LIKE '%Beam%';


UPDATE "OGInsp20191__OGMB_1"
SET "school_fees_expenditure" = REPLACE("school_fees_expenditure", 'USD', '')
WHERE "School_(fees)_expenditure" LIKE '%USD';
 
UPDATE "OGInsp20191__OGMB_1"
SET "school_fees_expenditure" = (FLOOR(REGEXP_REPLACE("school_fees_expenditure", '[^0-9]', '', 'g')::FLOAT / 13))::TEXT -----adapt exchange rate here AT the 13. 
WHERE "School_(fees)_expenditure" LIKE '%RTGS%'; ---- RTGS rate IN 2019 was 13 RTGS : 1 USd. 
 
UPDATE "OGInsp20191__OGMB_1"
SET "school_fees_expenditure" = (FLOOR(REGEXP_REPLACE("school_fees_expenditure", '[^0-9]', '', 'g')::FLOAT / 13))::TEXT -----adapt exchange rate here AT the 13. 
WHERE "School_(fees)_expenditure" LIKE '%bond%'; ---- Bond = rtgs rate IN 2019 was 13 RTGS : 1 USd.  

---- same with "last_quarter_food_expenditure"


ALTER TABLE "OGInsp20191__OGMB_1" 
ADD COLUMN "last_quarter_food_expenditure_1" text

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "last_quarter_food_expenditure_1" type float USING "last_quarter_food_expenditure_1"::float;

ALTER TABLE "OGInsp20191__OGMB_1"
Alter COLUMN "last_quarter_food_expenditure_1" type text;


UPDATE "OGInsp2021__OGMB_1" ---might NOT WORK because OF TYPES, THEN try NEXT one
SET "last_quarter_food_expenditure_1" = REPLACE(REPLACE("last_quarter_food_expenditure_1", '$', ''), ' USD', '')
WHERE "last_quarter_food_expenditure" LIKE '%$% USD';

UPDATE "OGInsp20191__OGMB_1"
SET "last_quarter_food_expenditure_1" =
  CASE
    WHEN "last_quarter_food_expenditure" = 'NONE' THEN '0'
    WHEN "last_quarter_food_expenditure" = 'none' THEN '0'
    WHEN "last_quarter_food_expenditure" = 'barter trade' THEN '0'
    WHEN "last_quarter_food_expenditure" = 'Barter trade' THEN '0'
    WHEN "last_quarter_food_expenditure" LIKE '%$%' THEN REPLACE(REPLACE("last_quarter_food_expenditure", '$', ''), ' USD', '')
    WHEN "last_quarter_food_expenditure" LIKE '%RTGS%' THEN (FLOOR(REGEXP_REPLACE("last_quarter_food_expenditure_1", '[^0-9]', '', 'g')::FLOAT / 13))::TEXT
    ELSE "last_quarter_food_expenditure"
  END;
   

 SELECT "last_quarter_food_expenditure", "last_quarter_food_expenditure_1" FROM "OGInsp20191__OGMB_1"; 
 SELECT * FROM "OGInsp20191__OGMB_1"; 
 
UPDATE "OGInsp20191__OGMB_1"
SET "last_quarter_food_expenditure_1" = REPLACE("last_quarter_food_expenditure_1", 'usd', '') ---replacing the USD thats LEFT OVER FOR SOME reason. 
WHERE "last_quarter_food_expenditure" LIKE '%usd%';
 
UPDATE "OGInsp20191__OGMB_1"
SET "last_quarter_food_expenditure_1" = (FLOOR(REGEXP_REPLACE("last_quarter_food_expenditure_1", '[^0-9]', '', 'g')::FLOAT / 13))::TEXT
WHERE "last_quarter_food_expenditure" LIKE '%RTGS%'; ---- RTGS rate IN 2019 was 13 RTGS : 1 USd. 
 
SELECT * FROM "OGInsp20191__OGMB_1";

UPDATE "OGInsp20191__OGMB_1"
SET "Household_head" = b."Household_head"
FROM organic_africa."OGInsp20191__OGMB" b
WHERE organic_africa."OGInsp20191__OGMB_1"."ID" = b."ID";




