# %%
import pandas as pd
import sqlalchemy
import sql_functions as sf


# %%
schema = 'organic_africa'

# %%
df_1= sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2019_Makoni__OGOrg_1"')
df_2 = sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2020__OGOrg_1"')
df_3 = sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2021__OGOrg_1"')

# %%
df_1= pd.DataFrame(df_1)
df_2 =pd.DataFrame(df_2)
df_3 =pd.DataFrame(df_3)

# %%
# Concatenate the DataFrames vertically
merged_df = pd.concat([df_1, df_2, df_3])

# Sort by the year column
merged_df = merged_df.sort_values('Date_entered')

# Reset the index
merged_df = merged_df.reset_index(drop=True)


# %%
merged_df

# %%
print(merged_df.shape)  # Check the shape of the merged DataFrame


# %%
merged_df['nearest_shops']

# %%
duplicate_columns = merged_df.columns[merged_df.columns.duplicated()]
print("Duplicate columns:", duplicate_columns)


# %%
print(merged_df.head())  # Display the first few rows of the merged DataFrame


# %%
print(merged_df.duplicated().sum())  # Count the number of duplicate entries


# %%
import pandas as pd

# Set the maximum number of columns to display
pd.set_option('display.max_columns', None)

# Convert the columns to a list and print
columns = merged_df.columns.tolist()
print(columns)


# %%
# Drop multiple columns
columns_to_drop = ['Entered_by', 'Items_not_checked', 'Additional_sanctions_ICS','leadership_position_3','Leadership_postion_2','Leadership_position_1','Corrective_actions','Recurrent_corrective_actions','Compliance_this_year', 'people_of_influence', 'Organisation_3','Organisation_2', 'organisation_1', 'Hand_hoes']
merged_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
# Drop multiple columns 2
columns_to_drop = ['Training/inputs_recieved_1', 'Training/inputs_recieved_2', 'Training/inputs_recieved_3','Crop_management_corrective_action','Farm_and_Farm_Mgt_corrective_actions','Post_harvest_Mgt_corrective_action','Compliance_this_year_ICS','All_items_checked']
merged_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
# Drop multiple columns 3

columns_to_drop = ['Internal_Inspector', 'Observation','nearest_School','Sex','Household_head','Distance_from_nearest_Shops']
merged_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
columns_to_drop = ['Distance_from_nearest_Shops']
merged_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
columns_to_drop = ['Distance_from_nearest_clinic','Distance_from_nearest_School']
merged_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
print(merged_df.shape)  # Check the shape of the merged DataFrame


# %%
merged_df['Distance_from_nearest_clinic'] = merged_df['Distance_from_nearest_clinic'].str.replace('[^\d.]', '', regex=True).astype(float)
merged_df['nearest_clinic'] = merged_df['nearest_clinic'].fillna(merged_df['Distance_from_nearest_clinic'])


# %%
merged_df['nearest_clinic']

# %%
import pandas as pd

# Set display options to show all rows
pd.set_option('display.max_rows', None)

# Display the 'nearest_clinic' column
print(merged_df['nearest_clinic'])

# Reset display options to default
pd.reset_option('display.max_rows')


# %%
merged_df['Distance_from_nearest_School'] = merged_df['Distance_from_nearest_School'].str.replace('[^\d.]', '', regex=True).astype(float)
merged_df['nearest_school'] = merged_df['nearest_school'].fillna(merged_df['Distance_from_nearest_School'])


# %%
# Set display options to show all rows
pd.set_option('display.max_rows', None)

# Display the 'nearest_clinic' column
print(merged_df['Distance_from_nearest_clinic'])

# Reset display options to default
pd.reset_option('display.max_rows')

# %%
# Convert columns to numeric type and divide values by 13 where 'RTGS' is present
merged_df['Health__care_expenditure'] = pd.to_numeric(merged_df['Health__care_expenditure'], errors='coerce')
merged_df.loc[merged_df['Health__care_expenditure'].notna() & merged_df['Health__care_expenditure'].astype(str).str.contains('RTGS'),
              'Health__care_expenditure'] /= 13

merged_df['School_(fees)_expenditure'] = pd.to_numeric(merged_df['School_(fees)_expenditure'], errors='coerce')
merged_df.loc[merged_df['School_(fees)_expenditure'].notna() & merged_df['School_(fees)_expenditure'].astype(str).str.contains('RTGS'),
              'School_(fees)_expenditure'] /= 13

merged_df['last_quarter_food_expenditure'] = pd.to_numeric(merged_df['last_quarter_food_expenditure'], errors='coerce')
merged_df.loc[merged_df['last_quarter_food_expenditure'].notna() & merged_df['last_quarter_food_expenditure'].astype(str).str.contains('RTGS'),
              'last_quarter_food_expenditure'] /= 13


# %%
Cereal_harvest_last-months

# %%
#from IPython.display import display

# Display the merged DataFrame as a table
#display(merged_df)


# %%
group_by = merged_df.sort_values('OG_Nr')
group_by.head()

# %%
# Count the occurrences of each 'OG_Nr' value
count_per_og_nr = merged_df['OG_Nr'].value_counts()

# Check the count of 2837.0
count_2837 = count_per_og_nr.loc[2837.0]

# Display the count
print("Count of 2837.0 in OG_Nr:", count_2837)



