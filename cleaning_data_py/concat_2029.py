# %%
import pandas as pd
import sqlalchemy
import sql_functions as sf


# %%
schema = 'organic_africa'

# %%
df_1= sf.get_dataframe(f'SELECT * FROM {schema}."OG_Insp_2019_Makoni__OGOrg_1"')
df_2= sf.get_dataframe(f'SELECT * FROM {schema}."Copy_of_OGInsp2019__OGOrg_1"')
df_3= sf.get_dataframe(f'SELECT * FROM {schema}."OGInsp2019__OGMB_1"')


# %%
print(df_1['OG_Nr'].dtypes)
print(df_2['OG_Nr'].dtypes)
print(df_3['OG_Nr'].dtypes)


# %%
print(df_1['OG_Nr'].isnull().sum())
print(df_2['OG_Nr'].isnull().sum())
print(df_3['OG_Nr'].isnull().sum())


# %%
# Convert column names to lowercase in df_1
df_1.rename(columns=str.lower, inplace=True)

# Convert column names to lowercase in df_2
df_2.rename(columns=str.lower, inplace=True)

# Convert column names to lowercase in df_3
df_3.rename(columns=str.lower, inplace=True)


# %%
concatenated_df = pd.concat([df_1, df_2, df_3], ignore_index=True)


# %%
# Drop multiple columns 2
columns_to_drop = ['items_not_checked', 'other_orgs','leadership_position_1','leadership_position_2','leadership_position','overall_comment','additional_sanctions_ics','corrective_action_implemented','leadership_position_3','leadership_postion_2','all_items_checked','compliance_this_year_ics','corrective_actions','recurrent_corrective_actions','compliance_this_year','people_of_influence','observation','organisation_3','organisation_2','organisation_1','membership_to_other_organisations']
concatenated_df.drop(columns=columns_to_drop, axis=1, inplace=True)


# %%
# drop alternative_cereal_2	alternative_cereal_3

# %%
from IPython.display import display

# Display the merged DataFrame as a table
display(concatenated_df)


# %%
concatenated_df = pd.concat([df_1, df_2, df_3], ignore_index=True)


# %%
columns_df1 = set(df_1.columns)
columns_df2 = set(df_2.columns)
columns_df3 = set(df_3.columns)
columns_concatenated = set(concatenated_df.columns)

# Columns present in df_1 but not in concatenated_df
columns_only_in_df1 = columns_df1.difference(columns_concatenated)
print("Columns only in df_1:", columns_only_in_df1)

# Columns present in df_2 but not in concatenated_df
columns_only_in_df2 = columns_df2.difference(columns_concatenated)
print("Columns only in df_2:", columns_only_in_df2)

# Columns present in df_3 but not in concatenated_df
columns_only_in_df3 = columns_df3.difference(columns_concatenated)
print("Columns only in df_3:", columns_only_in_df3)



