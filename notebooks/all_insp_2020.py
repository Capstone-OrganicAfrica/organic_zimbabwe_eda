# %%
import pandas as pd  
import sqlalchemy
import sql_functions as sf 
 

# %%  
schema = 'organic_africa'

# %%
df_1= sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2020__OGOrg_1"')


# %%
# Convert column names to lowercase in df_1
df_1.rename(columns=str.lower, inplace=True)

# %%
import pandas as pd
import re

# Assuming your DataFrame is named 'df_1'
df_1['cereal_harvest_last'] = df_1['cereal_harvest_last'].apply(lambda x: re.sub(r'\D', '', str(x)))
df_1['cereal_harvest_last'] = pd.to_numeric(df_1['cereal_harvest_last'], errors='coerce')


# %%
import pandas as pd

# Assuming your DataFrame is named 'df'
df_1['cereal_harvest_last'] = pd.to_numeric(df_1['cereal_harvest_last'], errors='coerce').astype(pd.Int64Dtype())


# %%
import pandas as pd

# Assuming your DataFrame is named 'df'
df_1['cereal_harvest_last'] = df_1['cereal_harvest_last'].fillna(value=0)


# %%
columns_to_drop = ['new_member_(why_you_joined_rosella_farming','oah_works_in_income','crop_management_corrective_action']
df_1.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
import pandas as pd
pd.set_option('display.max_rows', None)  # Show all rows
pd.set_option('display.max_columns', None)  # Show all columns

# Display the merged DataFrame as a table
display(df_1)


# %%
# we need psycopg2 for raising possible error message
import psycopg2
import sqlalchemy
from sql_functions import sqlalchemy
from sql_functions import get_engine
# Write records stored in a dataframe to SQL database
engine = get_engine()
table_name = 'all_insp_2020'
if engine!=None:
    try:
        df_1.to_sql(name='all_insp_2020', # Name of SQL table variable - at the front its the dataframe!!
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


