## Import Libraries, Load in Data, and Initiate Data Exploration ##

# Pandas and Numpy for Data Manipulation, Analysis, and Numerical Calculations
import pandas as pd
import numpy as np

# Matplotlib and Seaborn for Data Visualisation
import matplotlib.pyplot as plt
import seaborn as sns

# Set Visualisation Theme
sns.set_theme()

# Load in the Data
baseline = pd.read_csv('Data/Raw/TZA_CCT_baseline.csv')

# Set the display option so that output display a maximum of 100 columns ##
pd.set_option('display.max_columns', 100)

# Switch off warnings
import warnings
warnings.filterwarnings(action = 'ignore')

# Display the structure of the dataset
baseline.info()

#########################################################################################
# Display the first five rows of the dataset
print(baseline.head(3))
########################################################################################
# Identify duplicate by "hhid" column
duplicates = baseline['hhid'].duplicated().sum()

# Display the number of duplicates in the dataset
print(f"The Dataset has {duplicates} duplicates.")
###########################################################################################3
# Drop Duplicates -- the code will drop duplicates
baseline.drop_duplicates(subset = ['hhid'], ignore_index = True, inplace = True)

# Check if indeed duplicates have been deleted
new_duplicates = baseline['hhid'].duplicated().sum()
print(f"The new number of duplicated observation is: {new_duplicates}.")
############################################################################################
# Display the first five rows of "assoc" column
print(baseline['assoc'].head())
##########################################################################################
