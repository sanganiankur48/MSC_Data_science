install.packages("cli")
install.packages(c("ggplot2", "dplyr", "gridExtra", "purrr"))
library(ggplot2)
library(dplyr)
library(gridExtra)
library(purrr)


# EDA for SDTM.dm
print("EDA for SDTM.dm")

# Descriptive statistics for gender and race
gender_stats <- table(dm$SEX)
print(gender_stats)

race_stats <- table(dm$RACE)
print(race_stats)

# Histogram for age
age_plot <- ggplot(dm, aes(AGE)) +
  geom_histogram(bins = 30, fill = "blue", alpha = 0.7) +
  labs(title = "Age Distribution", x = "Age", y = "Count")
print(age_plot)

# EDA for SDTM.ae
print("EDA for SDTM.ae")

# Number of events, severity, relationship to study drug
event_count <- nrow(ae)
severity_stats <- table(ae$AESEV) # Assuming SEV for severity
relationship_stats <- table(ae$AEREL) # Assuming RELY for relationship to study drug

print(paste("Total adverse events:", event_count))
print(severity_stats)
print(relationship_stats)

# Bar plots for severity and relationship
severity_plot <- ggplot(ae, aes(AESEV)) +
  geom_bar(fill = "red", alpha = 0.7) +
  labs(title = "Adverse Events by Severity", x = "Severity", y = "Count")
print(severity_plot)

relationship_plot <- ggplot(ae, aes(AEREL)) +
  geom_bar(fill = "green", alpha = 0.7) +
  labs(title = "Adverse Events by Relationship to Study Drug", x = "Relationship", y = "Count")
print(relationship_plot)


# EDA for SDTM.ex
print("EDA for SDTM.ex")

# Number of exposure records and treatment details
exposure_count <- nrow(ex)
treatment_stats <- table(ex$EXTRT)  # Assuming TRT is the treatment column

print(paste("Total exposure records:", exposure_count))
print(treatment_stats)

# Bar plot for treatment regimen
treatment_plot <- ggplot(ex, aes(EXTRT)) +
  geom_bar(fill = "blue", alpha = 0.7) +
  labs(title = "Records by Treatment", x = "Treatment", y = "Count")
print(treatment_plot)

# EDA for SDTM.lb
print("EDA for SDTM.lb")

# Number of records, lab test type, test results, and units
record_count <- nrow(lb)
test_type_stats <- table(lb$LBTESTCD)  # Assuming TESTCD is the lab test code column
unit_stats <- table(lb$LBSTRESU)     # Assuming LBSTRESU is the lab test unit column

print(paste("Total lab records:", record_count))
print(test_type_stats)
print(unit_stats)



