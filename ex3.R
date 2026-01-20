
library(GGally)
library(ggplot2)


if (!"AgeGroup" %in% colnames(healthcare_data)) {
  healthcare_data$AgeGroup <- cut(
    healthcare_data$Age,
    breaks = c(0, 30, 50, 80),
    labels = c("Young", "Middle-aged", "Senior")
  )
}


head(healthcare_data)


ggpairs(
  healthcare_data,
  columns = c("Age", "BMI", "Glucose", "BloodPressure"),
  aes(color = AgeGroup, alpha = 0.7),
  diag = list(continuous = "densityDiag"),
  upper = list(continuous = wrap("cor", size = 4)),
  lower = list(continuous = wrap("points", size = 2)),
  title = "Scatter Plot Matrix of Health Indicators\nMUHIL K B 23BAD070"
)

cor_matrix <- cor(
  healthcare_data[, c("Age", "BMI", "Glucose", "BloodPressure")]
)
print(cor_matrix)
