

----- make a column gender_text and swich a values 

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN gender_text TEXT;

UPDATE "OGInsp2019__OGMB_1"
SET gender_text = (
    CASE "OGInsp2019__OGMB_1"."Sex"
        WHEN 1 THEN 'male'
        WHEN 2 THEN 'female'
    END
);


ALTER TABLE  "OGInsp2019__OGMB_1"
DROP COLUMN "Sex";



---------Hausholds head 

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN "household_head" TEXT;



UPDATE "OGInsp2019__OGMB_1"
SET "household_head" = (
    CASE "OGInsp2019__OGMB_1"."Household_head"
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

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Household_head";



------- marital status 

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN "marital_status" TEXT;

 UPDATE "OGInsp2019__OGMB_1"
 SET "marital_status" = (
    CASE "OGInsp2019__OGMB_1"."Marital_status"
        WHEN 2 THEN 'married'
        WHEN 3 THEN 'single'
        WHEN 4 THEN 'divorced'
        WHEN 5 THEN 'widowed'
        WHEN 6 THEN 'divorced'
    END
);

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Marital_status";



-------------- remove $ and usd
UPDATE "OGInsp2019__OGMB_1"
SET "Health__care_expenditure" = REPLACE("Health__care_expenditure", '$', '')
WHERE "Health__care_expenditure" LIKE '%$%';


UPDATE "OGInsp2019__OGMB_1"
SET "Health__care_expenditure" = REPLACE("Health__care_expenditure", ',', '')
WHERE "Health__care_expenditure" = '1,500';

-------------- remove $ and usd

UPDATE "OGInsp2019__OGMB_1"
SET "School_(fees)_expenditure" = REPLACE("School_(fees)_expenditure", '$', '')
WHERE "School_(fees)_expenditure" LIKE '%$%';



------------remove $ and usd

UPDATE "OGInsp2019__OGMB_1"
SET "last_quarter_food_expenditure" = REPLACE("last_quarter_food_expenditure", '$', '')
WHERE "last_quarter_food_expenditure" LIKE '%$%';


----------------- replacinng km and calculating km from Metars 

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN "nearest_clinic" float;


UPDATE "OGInsp2019__OGMB_1"
SET "nearest_clinic" = CASE
        WHEN "Distance_from_nearest_clinic" = '' THEN 0
        WHEN "Distance_from_nearest_clinic" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_clinic") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_clinic", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Distance_from_nearest_clinic";


------------replacinng km and calculating km from Metars 

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN "nearest_school" float;

UPDATE "OGInsp2019__OGMB_1"
SET "nearest_school" = CASE
        WHEN "Distance_from_nearest_Shops" = '' THEN 0
        WHEN "Distance_from_nearest_Shops" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Distance_from_nearest_Shops";


--------------------

ALTER TABLE "OGInsp2019__OGMB_1"
ADD COLUMN "nearest_shops" float;

UPDATE "OGInsp2019__OGMB_1"
SET "nearest_shops" = CASE
        WHEN "Distance_from_nearest_Shops" = '' THEN 0
        WHEN "Distance_from_nearest_Shops" = 'none' THEN 0
        WHEN POSITION('km' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('klm' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC)
        WHEN POSITION('m' IN "Distance_from_nearest_Shops") > 0 THEN CAST(REGEXP_REPLACE("Distance_from_nearest_Shops", '[^0-9.]', '', 'g') AS NUMERIC) / 1000
        ELSE 0
    END;

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Distance_from_nearest_Shops";



--------- change none in 0 on how many attending column 

UPDATE "OGInsp2019__OGMB_1"
SET "How_many_not_attending" = 
CASE 
    WHEN "How_many_not_attending" = 'none' THEN 0
END;

UPDATE organic_africa."OGInsp2019__OGMB_1"
SET "How_many_not_attending" = b."How_many_not_attending"
FROM organic_africa."OGInsp2019__OGMB" b
WHERE organic_africa."OGInsp2019__OGMB_1"."ID" = b."ID";

UPDATE "OGInsp2019__OGMB_1"
SET "How_many_not_attending" = 0
WHERE "How_many_not_attending" = 'none';


-------------Water pipes changing into clean number 


UPDATE "OGInsp2019__OGMB_1"
SET "Water_pipes" = 100
WHERE "Water_pipes" = '100metres';

-----------------------"Electricity"

ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Electricity" TYPE text;


UPDATE "OGInsp2021__OGMB_1"
SET "Electricity" = CASE
                              --WHEN "Enough_cereal_2018" = '1' THEN 'yes'
                              WHEN "Electricity" = '1' THEN 'yes'
                              WHEN "Electricity" = '2' THEN 'yes'

                              ELSE "Electricity"
                            END;

-----------------Enough_cereal_2015,2016,2017

ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Enough_cereal_2015" TYPE text;


                           
                           
                           
UPDATE "OGInsp2019__OGMB_1"
SET "Enough_cereal_2018" = CASE
                              WHEN "Enough_cereal_2018" = '1' THEN 'yes'
                              WHEN "Enough_cereal_2018" = '2' THEN 'no'
                              ELSE "Enough_cereal_2018" END;
      

-------------------water pump 
                             
ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Water_pump_type" TYPE text;
                         
UPDATE "OGInsp2019__OGMB_1"
SET "Water_pump_type" = CASE
                              WHEN "Water_pump" = '1' THEN 'Electrical'
                              WHEN "Water_pump" = '2' THEN 'Hand pump'
                              WHEN "Water_pump" = '3' THEN 'Treddle'
                              WHEN "Water_pump" = '4' THEN 'petrol/diesel'
                              WHEN "Water_pump" = '5' THEN 'Solar'
                              WHEN "Water_pump" = '6' THEN 'none'
                              WHEN "Water_pump" = '7' THEN 'Unasweredr'
                              ELSE "Water_pump"
                              END;
UPDATE organic_africa."OGInsp2019__OGMB_1"
SET "Water_pump" = b."Water_pump"
FROM organic_africa."OGInsp2019__OGMB" b
WHERE organic_africa."OGInsp2019__OGMB_1"."ID" = b."ID";
------------------Availabilty_of_HH_latrine
                             
ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Availabilty_of_HH_latrine" TYPE text;
                                  
                           
                           
                           
                           
UPDATE "OGInsp2019__OGMB_1"
SET "Availabilty_of_HH_latrine" = (
    CASE "OGInsp2019__OGMB_1"."Availabilty_of_HH_latrine"
        WHEN '1' THEN 'Yes'
        WHEN '2' THEN 'No'
        END);
                                     
                             
 ----------------------  Latrine_Type                          
  

UPDATE "OGInsp2019__OGMB_1"
SET "Latrine_Type" = (
    CASE "OGInsp2019__OGMB_1"."Latrine_Type"
        WHEN '1' THEN 'No'
        WHEN '2' THEN 'BVIP'
        --WHEN '3' THEN 'Dam'
        WHEN '3' THEN 'Pit'
        WHEN '4' THEN 'Flush'
        WHEN '5' THEN 'Other'
        WHEN '6' THEN 'unanswered'
        --WHEN 8 THEN 'Spring '
        --WHEN 9 THEN 'No irrigation'
        --WHEN 10 THEN 'Closed well'
        --WHEN 11 THEN 'irrigated water ways'
       -- WHEN 12 THEN 'wild animal damages'
        --WHEN 13 THEN 1000
        --WHEN 14 THEN 0
        END
);


--------------------Main_livelihood_activity


ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Main_livelihood_activity" TYPE text;
                                  
      

       UPDATE "OGInsp2019__OGMB_1"
SET "Main_livelihood_activity" = (
    CASE "OGInsp2019__OGMB_1"."Main_livelihood_activity"
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




--------------------Main_source_of_HH_water

ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Main_source_of_HH_water" TYPE text;
    

UPDATE "OGInsp2019__OGMB_1"
SET "Main_source_of_HH_water" = (
    CASE "OGInsp2019__OGMB_1"."Main_source_of_HH_water"
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


        -------------------HH_education_level
        
ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "HH_education_level" TYPE text;
    



UPDATE "OGInsp2019__OGMB_1"
SET "HH_education_level" = (
    CASE "OGInsp2019__OGMB_1"."HH_education_level"
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





--------------------Reason_for_not_attending


ALTER TABLE "OGInsp2019__OGMB_1"
ALTER COLUMN "Reason_for_not_attending" TYPE text;
    



UPDATE "OGInsp2019__OGMB_1"
SET "Reason_for_not_attending" = (
    CASE "OGInsp2019__OGMB_1"."Reason_for_not_attending"
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


------------------Insufficient_cereal_reason_2,1,3

UPDATE "OGInsp2019__OGMB_1"
SET "Insufficient_cereal_reason_2" = (
    CASE "OGInsp2019__OGMB_1"."Insufficient_cereal_reason_2"
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

                                 END;
UPDATE organic_africa."OGInsp2019__OGMB_1"
SET "Insufficient_cereal_reason_2" = b."Insufficient_cereal_reason_2"
FROM organic_africa."OGInsp2019__OGMB" b
WHERE organic_africa."OGInsp2019__OGMB_1"."ID" = b."ID";

-------------------Source_of_irrigation_water


UPDATE "OGInsp2019__OGMB_1"
SET "Source_of_irrigation_water" = (
    CASE "OGInsp2019__OGMB_1"."Source_of_irrigation_water"
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

---------------------droping 







ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Corrective_action_implemented";


ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Items_not_checked";

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Alternative_Cereal_3";

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Alternative_Cereal_2";

ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Additional_sanctions_ICS";


ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Additional_sanctions_ICS";


ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Overall_comment";


ALTER TABLE "OGInsp2019__OGMB_1"
DROP COLUMN "Entered_by";



---------------------

UPDATE "OGInsp2019__OGMB_1"
SET "Type_of_stove" = (
    CASE "OGInsp2019__OGMB_1"."Type_of_stove"
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



-------------------


UPDATE "OGInsp2019__OGMB_1"
SET "Health_of_Farmer" = CASE
                              --WHEN "Enough_cereal_2018" = '1' THEN 'yes'
                              WHEN "Health_of_Farmer" = '1' THEN 'Good'
                              WHEN "Health_of_Farmer" = '2' THEN 'Unwell'
                              WHEN "Health_of_Farmer" = '3' THEN 'Unwell'
                              ELSE "Health_of_Farmer"
                            END;
                           
                           
   ----------change a date 
                           
                           
UPDATE "OGInsp2019__OGMB_1"
SET "Date_inspected" = '2019-08-06'
WHERE "Date_inspected" = '1977-06-11';


