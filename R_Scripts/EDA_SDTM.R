install.packages("cli")
install.packages(c("ggplot2", "dplyr", "gridExtra", "purrr"))
library(ggplot2)
library(dplyr)
library(gridExtra)
library(purrr)

# Function to add data labels and total labels
add_labels <- function(plot, data, column) {
  plot + 
    geom_text(stat='count', aes(label=..count..), vjust=-0.5, position = position_dodge(0.9)) + 
    ggtitle(paste0("Total ", column, ": ", nrow(data)))
}

# EDA for SDTM.dm
print("EDA for SDTM.dm")

# Descriptive statistics for gender and race
gender_stats <- table(dm$SEX)
print(gender_stats)
race_stats <- table(dm$RACE)
print(race_stats)

# Advanced Age Distribution with density plot
age_density_plot <- ggplot(dm, aes(x = AGE)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "blue", alpha = 0.7) +
  geom_density(alpha = 0.5, fill = "#FF66CC") +
  labs(title = "Age Distribution with Density", x = "Age", y = "Density")
print(age_density_plot)

# EDA for SDTM.ae
print("EDA for SDTM.ae")

# Advanced Bar plots for severity and relationship

ae$AEREL <- ifelse(is.na(ae$AEREL) | ae$AEREL == "", "UNKNOWN", ae$AEREL)

severity_colored_plot <- ggplot(ae, aes(x = AESEV, fill = AESEV)) +
  geom_bar(alpha = 0.7) +
  labs(title = "Adverse Events by Severity", x = "Severity", y = "Count") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")
severity_colored_plot <- add_labels(severity_colored_plot, ae, "AE Severity")
print(severity_colored_plot)

relationship_colored_plot <- ggplot(ae, aes(x = AEREL, fill = AEREL)) +
  geom_bar(alpha = 0.7) +
  labs(title = "Adverse Events by Relationship to Study Drug", x = "Relationship", y = "Count") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")
relationship_colored_plot <- add_labels(relationship_colored_plot, ae, "AE Relationship")
print(relationship_colored_plot)

# Cross Frequency table for Severity and Relationship
cross_table <- table(ae$AESEV, ae$AEREL)
print(cross_table)

# EDA for SDTM.ex
print("EDA for SDTM.ex")

# Advanced Bar plot for treatment regimen with color
treatment_colored_plot <- ggplot(ex, aes(x = EXTRT, fill = EXTRT)) +
  geom_bar(alpha = 0.7) +
  labs(title = "Records by Treatment", x = "Treatment", y = "Count") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")
treatment_colored_plot <- add_labels(treatment_colored_plot, ex, "Treatment")
print(treatment_colored_plot)

