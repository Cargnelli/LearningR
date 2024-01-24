# Loading packages --------------------------------------------------------
library(tidyverse)
library(tidyverse)
library(NHANES)


# Tidy dataset ------------------------------------------------------------

# Briefly glimpse contents of dataset
glimpse(NHANES)
head(NHANES)
str(NHANES)


# Select columns ----------------------------------------------------------

# Select columns by name
select(NHANES, Age, Weight, BMI)



# Rename all columns ------------------------------------------------------

NHANES <- rename_with(NHANES, snakecase::to_snake_case)



# Rename specific column --------------------------------------------------

rename(NHANES, sex = gender)



# Chain functions with pipe -----------------------------------------------

NHANES %>%
  colnames()

NHANES %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)

NHANES %>%
  select(bp_sys_ave, education)

NHANES %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

NHANES %>%
  select(bmi, contains("age"))

NHANES %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)



# Filtering data by row ---------------------------------------------------

filter(NHANES, phys_active == "No")

NHANES %>%
    filter(phys_active == "No")

NHANES %>%
    filter(phys_active != "No")

NHANES %>%
    filter(bmi == 25 | phys_active == "No") %>%
    select(bmi, phys_active)


# Arrange rows ------------------------------------------------------------

NHANES %>%
    arrange(age)

NHANES %>%
    arrange(education) %>%
    select(education)

NHANES %>%
    arrange(desc(age)) %>%
    select(age)

NHANES %>%
    arrange(age, education)



# Mutate ------------------------------------------------------------------

NHANES %>%
    mutate(old = if_else(age >= 30, "Yes", "No")) %>%
    select(old)



# Code section ------------------------------------------------------------


# 1. BMI between 20 and 40 with diabetes
NHANES %>%
    # Format should follow: variable >= number or character
    filter(bmi >= 20 & bmi <= 40 & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- NHANES %>% # Specifying dataset
    mutate(
        # 2. Calculate mean arterial pressure
        mean_arterial_pressure = ((2 * bp_dia_ave) + bp_sys_ave) / 3,
        # 3. Create young_child variable using a condition
        young_child = if_else(age < 6, "Yes", "No")
    )

nhanes_modified










