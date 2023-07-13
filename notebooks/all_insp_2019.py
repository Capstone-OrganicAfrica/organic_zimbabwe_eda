import pandas as pd
import sqlalchemy 
import sql_functions as sf


# %%
schema = 'organic_africa'

# %%
df_1= sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2019_Makoni__OGOrg_1"')
df_2= sf.get_dataframe(f'SELECT * FROM {schema}."Copy_of_OGInsp2019__OGOrg_1"')
df_3= sf.get_dataframe(f'SELECT * FROM {schema}."OGInsp2019__OGMB_1"')
df_4= sf.get_dataframe(f'SELECT * FROM {schema}."OGInsp20191__OGMB_new"')


# %%
print(df_1['OG_Nr'].dtypes)
print(df_2['OG_Nr'].dtypes)
print(df_3['OG_Nr'].dtypes)
print(df_4['OG_Nr'].dtypes)


# %%
print(df_1['OG_Nr'].isnull().sum())
print(df_2['OG_Nr'].isnull().sum())
print(df_3['OG_Nr'].isnull().sum())
print(df_4['OG_Nr'].isnull().sum())


# %%
# Convert column names to lowercase in df_1
df_1.rename(columns=str.lower, inplace=True)

# Convert column names to lowercase in df_2
df_2.rename(columns=str.lower, inplace=True)

# Convert column names to lowercase in df_3
df_3.rename(columns=str.lower, inplace=True)

# Convert column names to lowercase in df_4
df_4.rename(columns=str.lower, inplace=True)


# %%
concatenated_df = pd.concat([df_1, df_2, df_3, df_4], ignore_index=True)


# %%
# Drop multiple columns 2
columns_to_drop = ['items_not_checked', 'other_orgs','leadership_position_1','leadership_position_2','leadership_position','overall_comment','additional_sanctions_ics','corrective_action_implemented','leadership_position_3','leadership_postion_2','all_items_checked','compliance_this_year_ics','corrective_actions','recurrent_corrective_actions','compliance_this_year','people_of_influence','observation','organisation_3','organisation_2','organisation_1','membership_to_other_organisations']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
# drop alternative_cereal_2	alternative_cereal_3 marital_status
columns_to_drop = ['alternative_cereal_2', 'alternative_cereal_3','marital_status','membership_other_orgs','last_year_corrective_actions']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
columns_to_drop = ['reason_for_joining_mb_rosella']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)

# %%
columns_to_drop = ['sex','alternative_cereal_source_2','alternative_cereal_source_3']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
columns_to_drop = ['input_received']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
#columns_to_update = ['enough_cereal_2018']
#concatenated_df[columns_to_update] = concatenated_df[columns_to_update].replace(2, 'no')


# %%
#columns_to_update = ['enough_cereal_2018']
#concatenated_df[columns_to_update] = concatenated_df[columns_to_update].replace(1, 'yes')


# %%
import pandas as pd
pd.set_option('display.max_rows', None)  # Show all rows
pd.set_option('display.max_columns', None)  # Show all columns

# Display the merged DataFrame as a table
display(concatenated_df)


# %%
from IPython.display import display

# Display the merged DataFrame as a table
display(concatenated_df)


# %%
### added to git 27.06

# %%
# we need psycopg2 for raising possible error message
import psycopg2
import sqlalchemy
from sql_functions import sqlalchemy
from sql_functions import get_engine
# Write records stored in a dataframe to SQL database
engine = get_engine()
table_name = 'all_insp_2019'
if engine!=None:
    try:
        concatenated_df.to_sql(name='all_insp_2019', # Name of SQL table variable - at the front its the dataframe!!
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


