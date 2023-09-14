

library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)


# Function to calculate the total count and percentages
add_labels <- function(plot, data, column) {
  plot + 
    geom_text(stat='count', aes(label=..count..), vjust=-0.5) + 
    ggtitle(paste0("Total ", column, ": ", nrow(data)))
}

# Demographics Summary
print(summary(select(adsl, SEX, AGE, RACE, ETHNIC)))

# Visualize Gender, Race, Ethnicity Distribution using color differentiation
gender_plot <- ggplot(adsl, aes(x = SEX, fill = SEX)) + 
  geom_bar() + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Set2")
gender_plot <- add_labels(gender_plot, adsl, "Gender")
print(gender_plot)

race_plot <- ggplot(adsl, aes(x = RACE, fill = RACE)) + 
  geom_bar() + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Set3")
race_plot <- add_labels(race_plot, adsl, "Race")
print(race_plot)

ethnicity_plot <- ggplot(adsl, aes(x = ETHNIC, fill = ETHNIC)) + 
  geom_bar() + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Paired")
ethnicity_plot <- add_labels(ethnicity_plot, adsl, "Ethnicity")
print(ethnicity_plot)

# Treatment Arms Distribution with color
arm_plot <- ggplot(adsl, aes(x = ARM, fill = ARM)) + 
  geom_bar() + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_fill_brewer(palette = "Set1")
arm_plot <- add_labels(arm_plot, adsl, "Treatment Arm")
print(arm_plot)

# Define a larger custom color palette
my_palette <- c(RColorBrewer::brewer.pal(8, "Set2"), 
                RColorBrewer::brewer.pal(8, "Set3"),
                RColorBrewer::brewer.pal(8, "Paired"),
                RColorBrewer::brewer.pal(8, "Pastel1"))

# Study Completion Status with color
completion_plot <- ggplot(adsl, aes(x = DCDECOD, fill = DCDECOD)) + 
  geom_bar() + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_fill_manual(values=my_palette)
completion_plot <- add_labels(completion_plot, adsl, "Completion Status")
print(completion_plot)

# Distribution of AE Severity and Relationship to Study Drug with color

# Assigning missing or blanks to unknown for the adae.aerel 
adae$AEREL <- ifelse(is.na(adae$AEREL) | adae$AEREL == "", "UNKNOWN", adae$AEREL)

ae_severity_plot <- ggplot(adae, aes(x = AESER, fill = AESER)) + 
  geom_bar() + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Set3")
ae_severity_plot <- add_labels(ae_severity_plot, adae, "AE Severity")
print(ae_severity_plot)

ae_relationship_plot <- ggplot(adae, aes(x = AEREL, fill = AEREL)) + 
  geom_bar() + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Set2")
ae_relationship_plot <- add_labels(ae_relationship_plot, adae, "AE Relationship")
print(ae_relationship_plot)

# Outcome of AEs with color
outcome_plot <- ggplot(adae, aes(x = AEOUT, fill = AEOUT)) + 
  geom_bar() + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_fill_brewer(palette = "Paired")
outcome_plot <- add_labels(outcome_plot, adae, "AE Outcome")
print(outcome_plot)

# Visualizing first few rows of ADVS dataset
print(head(advs))

