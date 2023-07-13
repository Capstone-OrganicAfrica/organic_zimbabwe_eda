First create a copy of the table


CREATE TABLE "Copy_of_OGInsp2019__OGOrg_1"  AS
TABLE "Copy_of_OGInsp2019__OGOrg";
then add the column which you want to update integer => content
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN marital_status_1 TEXT;

then update the content - assign values. After "set" name of the new column. , in 'case' its name of the numerical column.


----this one works___
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET marital_status_1 = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Marital_status"
        WHEN 2 THEN 'married'
        WHEN 3 THEN 'single'
        WHEN 4 THEN 'divorced'
        WHEN 5 THEN 'widowed'
        WHEN 6 THEN 'divorced'
    END
);
-----  have a look at your work:
SELECT *
FROM "Copy_of_OGInsp2019__OGOrg_1" cooo ;
----

this is an alternative code to the one up there, to update step by step.


UPDATE "Copy_of_OGInsp2019__OGOrg_2"
SET marital_status_text = 'divorced'
WHERE "Copy_of_OGInsp2019__OGOrg_2"."Marital_status" = 3;
------- now the same spiel again and again and again
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN gender_text TEXT;
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET gender_text = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Sex"
        WHEN 1 THEN 'male'
        WHEN 2 THEN 'female'
    END
);
------
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
ADD COLUMN household_head TEXT;
UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET household_head = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Household_head"
        WHEN 1 THEN 'husband'
        WHEN 2 THEN 'wife'
        WHEN 3 THEN 'mother'
        WHEN 4 THEN 'father'
        WHEN 5 THEN 'grandmother'
        WHEN 6 THEN 'grandfather'
        WHEN 7 THEN 'nephew'
        WHEN 8 THEN 'niece'
        WHEN 9 THEN 'son in law'
        WHEN 10 THEN 'daughter in law'
        WHEN 11 THEN 'self'
        WHEN 12 THEN 'son'
        WHEN 13 THEN 'daughter'
        END
);


---

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN household_head_education_level TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET household_head_education_level = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."HH_education_level"
        WHEN 1 THEN 'Pre-school'
        WHEN 2 THEN 'Early childhood development'
        WHEN 3 THEN 'Primary school'
        WHEN 4 THEN 'Ordinary level'
        WHEN 5 THEN 'Tertiary or vocational'
        WHEN 6 THEN 'None'
        WHEN 7 THEN 'Standard 1'
        WHEN 8 THEN 'Standard 3'
        WHEN 9 THEN 'Advanced level'
        WHEN 10 THEN 'Zimbabwe Junior certificate'
        ---WHEN 11 THEN 'self'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);


---


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN reason_for_school_dropout TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET reason_for_school_dropout = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Reason_for_not_attending"
        WHEN 1 THEN 'Financial'
        WHEN 2 THEN 'Distance'
        WHEN 3 THEN 'Disability'
        WHEN 4 THEN 'under age'
        WHEN 5 THEN 'early marriage'
        WHEN 6 THEN 'None'
        WHEN 7 THEN 'no interest'
        WHEN 8 THEN 'under age'
        WHEN 9 THEN 'no children'
        WHEN 10 THEN 'Covid'
        WHEN 11 THEN 'Ill/sick'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);

SELECT * 
FROM "Copy_of_OGInsp2019__OGOrg_1" cooo ;
-----

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN main_livelihood_activity TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET main_livelihood_activity = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Main_livelihood_activity"
        WHEN 1 THEN 'Dry land farming'
        WHEN 2 THEN 'Irrigated farming'
        WHEN 3 THEN 'Gardening'
        WHEN 4 THEN 'formal employment'
        WHEN 5 THEN 'Small business'
        WHEN 6 THEN 'Organic or  Mabagrown farming'
        WHEN 7 THEN 'Livestock breeding'
        WHEN 8 THEN 'none'
        --WHEN 9 THEN 'no children'
        --WHEN 10 THEN 'Covid'
        ---WHEN 11 THEN 'Ill/sick'
       --- WHEN 12 THEN 'son'
       --- WHEN 13 THEN 'daughter'
        END
);

---

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN dry_land_income INT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET dry_land_income = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Dry_land_income"
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
ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN irrigated_income INT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET irrigated_income = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Irrigated_income"
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

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN gardening_income INT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET gardening_income = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Gardening_income"
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

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN formal_employment_income INT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET formal_employment_income = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Formal_employment_income"
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

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN small_business_income INT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET small_business_income = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Small_business_income"
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

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN insufficient_cereal_reason_1 TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET insufficient_cereal_reason_1 = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Insufficient_cereal_reason_1"
        WHEN 1 THEN 'Non affordability of fertilizer'
        WHEN 2 THEN 'Non Availability of fertilizer'
        WHEN 3 THEN 'Non Availability of Seed'
        WHEN 4 THEN 'Non Affordability of Seed'
        WHEN 5 THEN 'Poor Rainfall'
        WHEN 6 THEN 'Shortage of labour'
        WHEN 7 THEN 'Lack of Draught power'
        WHEN 8 THEN 'Not enough land'
        WHEN 9 THEN 'Natural disaster'
        WHEN 10 THEN 'n/a'
        WHEN 11 THEN 'not answered'
        WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN insufficient_cereal_reason_2 TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET insufficient_cereal_reason_2 = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Insufficient_cereal_reason_2"
        WHEN 1 THEN 'Non affordability of fertilizer'
        WHEN 2 THEN 'Non Availability of fertilizer'
        WHEN 3 THEN 'Non Availability of Seed'
        WHEN 4 THEN 'Non Affordability of Seed'
        WHEN 5 THEN 'Poor Rainfall'
        WHEN 6 THEN 'Shortage of labour'
        WHEN 7 THEN 'Lack of Draught power'
        WHEN 8 THEN 'Not enough land'
        WHEN 9 THEN 'Natural disaster'
        WHEN 10 THEN 'n/a'
        WHEN 11 THEN 'not answered'
        WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN insufficient_cereal_reason_3 TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET insufficient_cereal_reason_3 = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Insufficient_cereal_reason_3"
        WHEN 1 THEN 'Non affordability of fertilizer'
        WHEN 2 THEN 'Non Availability of fertilizer'
        WHEN 3 THEN 'Non Availability of Seed'
        WHEN 4 THEN 'Non Affordability of Seed'
        WHEN 5 THEN 'Poor Rainfall'
        WHEN 6 THEN 'Shortage of labour'
        WHEN 7 THEN 'Lack of Draught power'
        WHEN 8 THEN 'Not enough land'
        WHEN 9 THEN 'Natural disaster'
        WHEN 10 THEN 'n/a'
        WHEN 11 THEN 'not answered'
        WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN type_of_stove TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET type_of_stove = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Type_of_stove"
        WHEN 1 THEN 'Electricity'
        WHEN 2 THEN 'Gas'
        WHEN 3 THEN 'Paraffin'
        WHEN 4 THEN 'Charcoal'
        WHEN 5 THEN 'Firewood'
        WHEN 6 THEN 'Dung'
        WHEN 7 THEN 'unanswered'
        --WHEN 8 THEN 'Not enough land'
        --WHEN 9 THEN 'Natural disaster'
       -- WHEN 10 THEN 'n/a'
        --WHEN 11 THEN 'not answered'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN source_of_hh_water TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET source_of_hh_water = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Main_source_of_HH_water"
        WHEN 1 THEN 'Borehole'
        WHEN 2 THEN 'Open well'
        WHEN 3 THEN 'Dam'
        WHEN 4 THEN 'Stream or river'
        WHEN 5 THEN 'Other'
        WHEN 6 THEN 'Unanswered'
        WHEN 7 THEN 'Municipal'
        WHEN 8 THEN 'Spring'
        WHEN 9 THEN 'No irrigation'
       	WHEN 10 THEN 'Closed well'
        WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

SELECT *
FROM "Copy_of_OGInsp2019__OGOrg_1" cooo ;

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN source_of_hh_water TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET source_of_hh_water = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Main_source_of_HH_water"
        WHEN 1 THEN 'Borehole'
        WHEN 2 THEN 'Open well'
        WHEN 3 THEN 'Dam'
        WHEN 4 THEN 'Stream or river'
        WHEN 5 THEN 'Other'
        WHEN 6 THEN 'Unanswered'
        WHEN 7 THEN 'Municipal'
        WHEN 8 THEN 'Spring'
        WHEN 9 THEN 'No irrigation'
       	WHEN 10 THEN 'Closed well'
        WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN source_of_irrigation_water TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET source_of_irrigation_water = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Source_of_irrigation_water"
        WHEN 1 THEN 'Borehole'
        WHEN 2 THEN 'Open well'
        WHEN 3 THEN 'Dam'
        WHEN 4 THEN 'Stream or river'
        WHEN 5 THEN 'Other'
        WHEN 6 THEN 'Unanswered'
        WHEN 7 THEN 'Municipal'
        WHEN 8 THEN 'Spring	'
        WHEN 9 THEN 'No irrigation'
       	WHEN 10 THEN 'Closed well'
        WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN availability_latrine TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET availability_latrine = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Availabilty_of_HH_latrine"
        WHEN 1 THEN 'Yes'
        WHEN 2 THEN 'No'
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN latrine_type TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET latrine_type = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Latrine_Type"
        WHEN 1 THEN 'No'
        WHEN 2 THEN 'BVIP'
        WHEN 3 THEN 'Dam'
        WHEN 4 THEN 'Pit'
        WHEN 5 THEN 'Flush'
        WHEN 6 THEN 'Other'
        WHEN 7 THEN 'unanswered'
        --WHEN 8 THEN 'Spring	'
        --WHEN 9 THEN 'No irrigation'
       	--WHEN 10 THEN 'Closed well'
        --WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN membership_other_orgs TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET membership_other_orgs = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Membership_to_other_organisations"
        WHEN 1 THEN 'Yes'
        WHEN 2 THEN 'No'
        END
 );
 

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN other_orgs TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET other_orgs = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."organisation_1"
        WHEN 1 THEN 'CPC'
        WHEN 2 THEN 'Save the Children'
        WHEN 3 THEN 'Social Welfare'
        WHEN 4 THEN 'ZUBO'
        WHEN 5 THEN 'Kunzwana womens association'
        WHEN 6 THEN 'none'
        WHEN 7 THEN 'church'
        WHEN 8 THEN 'Basilwizi'
        WHEN 9 THEN 'School development Association'
       	WHEN 10 THEN 'Tusumbuke'
        WHEN 11 THEN 'FSNZ'
        WHEN 12 THEN 'GMB'
        WHEN 13 THEN 'Carbon Green'
        WHEN 14 THEN 'CAMFED'
        WHEN 15 THEN 'Heifer'
        WHEN 16 THEN 'Sacco'
        END
);

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN leadership_position TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET leadership_position = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Leadership_position_1"
        WHEN 1 THEN 'Secretary'
        WHEN 2 THEN 'Chairperson'
        WHEN 3 THEN 'Deputy Chairperson'
        WHEN 4 THEN 'Member'
        WHEN 5 THEN 'Treasurer'
        WHEN 6 THEN 'Committee member'
        WHEN 7 THEN 'Beneficiary'
        WHEN 8 THEN 'Pastors wife'
        WHEN 9 THEN 'Pastor'
       	WHEN 10 THEN 'not applicable'
        WHEN 11 THEN 'health worker'
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

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN input_received TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET input_received = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Training/inputs_recieved_1"
        WHEN 1 THEN 'Seed'
        WHEN 2 THEN 'Seed and fertilizers'
        WHEN 3 THEN 'Farming equipment'
        WHEN 4 THEN 'Trainig'
        WHEN 5 THEN 'not specified'
        WHEN 6 THEN 'Market'
        WHEN 7 THEN 'not applicable'
        WHEN 8 THEN 'Poultry'
        WHEN 9 THEN 'Uniforms'
        END
);


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
ADD COLUMN health_of_farmer TEXT;

UPDATE "Copy_of_OGInsp2019__OGOrg_1"
SET health_of_farmer = (
    CASE "Copy_of_OGInsp2019__OGOrg_1"."Health_of_Farmer"
        WHEN 1 THEN 'Good'
        WHEN 2 THEN 'Unwell'
        WHEN 3 THEN 'Chronically ill'
        END
);

SELECT *
FROM "Copy_of_OGInsp2019__OGOrg_1" cooo ;


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
DROP COLUMN "Marital_status", DROP COLUMN "Sex", DROP COLUMN "Household_head", DROP COLUMN "HH_education_level", DROP COLUMN "Reason_for_not_attending", 
DROP COLUMN "Main_livelihood_activity", DROP COLUMN "Dry_land_income", DROP COLUMN "Irrigated_income", DROP COLUMN "Gardening_income", 
DROP COLUMN "Formal_employment_income", DROP COLUMN "Small_business_income", DROP COLUMN "Insufficient_cereal_reason_1", DROP COLUMN "Insufficient_cereal_reason_2", 
DROP COLUMN "Insufficient_cereal_reason_3", DROP COLUMN "fuel_source", DROP COLUMN "Type_of_stove", DROP COLUMN "Main_source_of_HH_water", DROP COLUMN "Source_of_irrigation_water",
DROP COLUMN "Availabilty_of_HH_latrine", DROP COLUMN "Latrine_Type", DROP COLUMN "Membership_to_other_organisations", DROP COLUMN "organisation_1", 
DROP COLUMN "Leadership_position_1", DROP COLUMN "Training/inputs_recieved_1", DROP COLUMN "Health_of_Farmer";


ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1"
DROP COLUMN "Date_entered",
DROP COLUMN "Internal_Inspector", 
DROP COLUMN "Entered_by";

ALTER TABLE "Copy_of_OGInsp2019__OGOrg_1" 
DROP COLUMN "new_date_of_birth";


