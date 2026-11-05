library(dplyr)
library(gtsummary)
library(here)


here::i_am("code/code_table1.R"
)

cleveland <- readRDS(
  here::here("data", "cleveland_clean.rds")
)

table1 <- cleveland %>%
  select(
    heart_disease,
    age,
    sex,
    trestbps,
    chol,
    thalach,
    oldpeak
  ) %>%
  tbl_summary(
    by = heart_disease,
    label = list(
      age ~ "Age",
      sex ~ "Sex",
      trestbps ~ "Resting Blood Pressure",
      chol ~ "Serum Cholesterol",
      thalach ~ "Maximum Heart Rate",
      oldpeak ~ "ST Depression"
    ),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "ifany"
  ) %>%
  add_p() %>%
  modify_header(
    label ~ "**Characteristic**",
    stat_1 ~ "**No Heart Disease**",
    stat_2 ~ "**Heart Disease**",
    p.value ~ "**p-value**"
  ) %>%
  bold_labels()

table1

saveRDS(table1,here::here ("output","table1.rds"))
