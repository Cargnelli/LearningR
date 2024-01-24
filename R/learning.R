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
