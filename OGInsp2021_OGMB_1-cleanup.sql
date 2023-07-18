UPDATE "OGInsp2021__OGMB_1"
SET "Formal_employment_income" = (
    CASE "OGInsp2021__OGMB_1"."Formal_employment_income"
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

SELECT * FROM "OGInsp2021__OGMB_1";


UPDATE "OGInsp2021__OGMB_1"
SET "Enough_cereal_2018" = (
    CASE "OGInsp2021__OGMB_1"."Enough_cereal_2018"
        WHEN 1 THEN 'yes'
        WHEN 2 THEN 'no'
);
