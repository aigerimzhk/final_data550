library(tidyverse)
library(here)


here::i_am(
  "code/data_cleaning_code.R"
)

cleveland <- read.csv(
  "data/processed.cleveland.data",
  header = FALSE,
  na.strings = "?"
)

colnames(cleveland) <- c(
  "age",
  "sex",
  "cp",
  "trestbps",
  "chol",
  "fbs",
  "restecg",
  "thalach",
  "exang",
  "oldpeak",
  "slope",
  "ca",
  "thal",
  "num"
)

cleveland <- cleveland %>%
  mutate(
    heart_disease = if_else(num == 0, "No", "Yes"),
    heart_disease = factor(
      heart_disease,
      levels = c("No", "Yes")
    ),
    
    sex = case_when(
      sex %in% c(0.0, "0") ~ "Female",
      sex %in% c(1.0, "1") ~ "Male",
      sex %in% c("Female", "Male") ~ as.character(sex),
      TRUE ~ NA_character_
    ),
    
    sex = factor(
      sex,
      levels = c("Female", "Male")
    )
  )

#saving the cleaned dataset
saveRDS(
  cleveland, here::here(
  "data","cleveland_clean.rds")
)
