
# EDA for ADaM.dm
print("EDA for ADSL")
gender_stats <- table(adsl$SEX)
itt_population <- sum(adsl$ITTFL == "Y", na.rm = TRUE)  # IITFL is Intend to Treat patients flag
safety_population <- sum(adsl$SAFFL == "Y", na.rm = TRUE)  # SAFFL is Safety population flag
Death_population <- sum(adsl$DTHFL == "Y", na.rm = TRUE)  # DTHFL is Death population flag

print(gender_stats)
print(paste("Number in ITT Population:", itt_population))
print(paste("Number in Safety population:", safety_population))
print(paste("Number in Death population:", Death_population))


# EDA for ADaM.ae
print("EDA for ADaM.ae")
ae_counts <- table(adae$AEDECOD)
serious_ae_count <- sum(adae$AESER == "Y", na.rm = TRUE)  # AESER is the serious AE flag

print(ae_counts)
print(paste("Number of Serious Adverse Events:", serious_ae_count))

