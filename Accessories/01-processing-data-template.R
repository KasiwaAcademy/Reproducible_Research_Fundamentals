# Template for Data Processing
# Reproducible Research Fundamentals

### Libraries ----
# Load the required libraries
library(dplyr)
library(tidyr)
library(stringr)

### Instructions ----
# 1. Replace dataset paths with your own file paths.
# 2. Update variable names (e.g., 'hhid', 'crop_other', etc.) to match your dataset.
# 3. Follow the steps in the template and customize as needed.

### Step 1: Load the Dataset ----
# Load your dataset (replace the path with your dataset path)
# Example: data <- read.csv("path/to/your/dataset.csv")

data <- read.csv("Path/To/Your/Dataset.csv")

# Exercise 1: Explore the data
# Use `glimpse()` or `head()` to preview your data structure.
glimpse(data)

### Step 2: Remove Duplicates ----
# Replace 'unique_id_column' with the column used to identify duplicates.
# Example: duplicates <- data %>% group_by(unique_id_column) %>% filter(n() > 1)

# Identify and display duplicates
duplicates <- data %>%
    group_by(unique_id_column) %>%  # Replace 'unique_id_column' with your column
    filter(n() > 1)

# Remove duplicates
data_clean <- data %>%
    distinct(unique_id_column, .keep_all = TRUE)

### Step 3: Data Cleaning ----
# Add your data cleaning steps here.

# Example: Clean and standardize text variables
data_clean <- data_clean %>%
    mutate(text_variable = str_to_title(text_variable)) %>%  # Replace 'text_variable'
    
    # Recode values in specific columns
    mutate(variable_name = case_when(
        str_detect(other_variable, "Condition1") ~ NewValue1,  # Replace placeholders
        str_detect(other_variable, "Condition2") ~ NewValue2,
        TRUE ~ variable_name
    )) %>%
    
    # Recode negative values (-88) as missing (NA)
    mutate(across(where(is.numeric), ~ replace(., . == -88, NA)))

### Step 4: Data Validation ----
# Add your data validation checks here.
# Example: Check for outliers
boxplot.stats(data_clean$column_name)  # Replace 'column_name'

### Step 5: Save Cleaned Data ----
# Save the processed dataset to an intermediate folder
write.csv(data_clean, "Path/To/Save/Your/Cleaned_Data.csv", row.names = FALSE)

### Notes ----
# 1. Replace all placeholder text (e.g., 'Path/To/Your/Dataset.csv', 'unique_id_column').
# 2. Add or remove steps as needed for your project requirements.
