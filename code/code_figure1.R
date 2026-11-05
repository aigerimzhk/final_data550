library(ggplot2)
library(here)


here::i_am(
  "code/code_figure1.R"
)

cleveland <- readRDS(
  here::here("data", "cleveland_clean.rds")
)

figure1 <- ggplot(
  cleveland,
  aes(
    x = age,
    y = oldpeak,
    shape = heart_disease,
    color = heart_disease
  )
) +
  geom_point() +
  geom_smooth(
    aes(
      group = heart_disease,
      color = heart_disease
    ),
    method = "lm",
    se = FALSE
  ) +
  scale_color_manual(
    values = c(
      "No" = "steelblue",
      "Yes" = "firebrick"
    )
  ) +
  labs(
    title = "Age and ST Depression by Heart Disease Status",
    x = "Age (years)",
    y = "ST Depression",
    shape = "Heart Disease",
    color = "Heart Disease"
  ) +
  theme_minimal()

figure1

saveRDS(figure1, here::here("output", "figure1.rds"))
