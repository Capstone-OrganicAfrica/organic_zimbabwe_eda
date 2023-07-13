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

--------------------------
this now in Python_ 
--------------------------
Data cleaning in python 
# Import get_dataframe function from the sql module
import pandas as pd 
from sql_functions import get_dataframe
schema = 'organic_africa'
df = get_dataframe(f'SELECT * FROM {schema}."OGInfo__OGMB_1"')
df.info()
df.head()
df['OG_Nr'] = df['OG_Nr'].astype('int')
df['Date_of_Birth'] = pd.to_datetime(df['Date_of_Birth'])
df['date_contracted'] = pd.to_datetime(df['date_contracted'])
df['Date_dropped_out'] = pd.to_datetime(df['Date_dropped_out'])
df.head()
df = df.drop(['date_contracted1', 'Date_contracted'], axis=1)
df.head()
df.set_index('OG_Nr')
df.info()
import numpy as np
We want to have all the area names equal across tables - so all with Capital first letter and no following letter
# have a look at the unique area names 

print(df['Area'].unique())
# alter the area names 

df['Area'] = df['Area'].str.title()
#replace the 3 Mbires with just a single Mbire

df['Area'] = df['Area'].replace('Mbire P', 'Mbire')
df['Area'] = df['Area'].replace('Mbire M', 'Mbire')
df['Area'] = df['Area'].replace('Mbire K', 'Mbire')
print(df['Area'].unique())
# have a look at what else needs to be done 

df.head()
#noticed some mistakes in the dob column. will correct those somehow now. 

df['Date_of_Birth'].sort_values(ascending=False)

pd.set_option('display.max_rows', 20, 'display.max_columns', None) ####to see all the columns

## to filter the crazy birthdays. 
    
df_overage = df[df['Date_of_Birth'] > '2010-01-01']
##df.query('Date_of_Birth < 2050-01-01') # and Date_of_Birth > 2005-01-01')
df_overage.head()

for a in df['Date_of_Birth'] > '2010-01-01'
replace a with null 


type(df['Date_of_Birth'])

##df.loc[df['Date_of_Birth'] > '2010-01-01', 'Date_of_Birth'] = 0
df['Date_of_Birth'].tail(100)
from datetime import datetime
import numpy as np
threshold_date = datetime(2010, 1, 1)
df.loc[df['Date_of_Birth'] > threshold_date, 'Date_of_Birth'] = np.nan
df.head()
# we need psycopg2 for raising possible error message
import psycopg2
import sqlalchemy 
from sql_functions import sqlalchemy 
from sql_functions import get_engine 

# Write records stored in a dataframe to SQL database
engine = get_engine()
table_name = 'OGInfo__OGMB_1'
if engine!=None:
    try:
        df.to_sql(name='OGInfo__OGMB_1', # Name of SQL table variable - at the front its the dataframe!! 
                        con=engine, # Engine or connection
                        schema='organic_africa', # your class schema variable
                        if_exists='replace', # Drop the table before inserting new values 
                        index=False, # Write DataFrame index as a column
                        chunksize=5000, # Specify the number of rows in each batch to be written at a time
                        method='multi') # Pass multiple values in a single INSERT clause
        print(f"The {table_name} table was imported successfully.")
    # Error handling
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        engine = None
else:
    print('No engine')

