install.packages("haven")
install.packages("rlang")
library(haven)


# Define a function to load all xpt files from a directory
read_all_xpt <- function(directory) {
  # Get list of all .xpt files
  files <- list.files(directory, pattern = "\\.xpt$", full.names = TRUE)
  
  # Check if there are no files
  if(length(files) == 0) {
    warning("No .xpt files found in the specified directory.")
    return(NULL)
  }
  
  # Load each file into a data frame and store in a list
  dfs <- lapply(files, function(f) {
    data <- read_xpt(f)
    return(data)
  })
  
  # Set names for the list based on file names (without extension)
  names(dfs) <- tools::file_path_sans_ext(basename(files))
  
  return(dfs)
}

# Use the function to read xpt files from a specified SDTM directory

dir_sdtm_path <- "S:/University Of Westminster/Data Science and Analytics/MSC_Data_science/cdiscpilot01/tabulations/sdtm"
list_sdtm_df <- read_all_xpt(dir_sdtm_path)

# Use the function to read xpt files from a specified ADAM directory
dir_adam_path <- "S:/University Of Westminster/Data Science and Analytics/MSC_Data_science/cdiscpilot01/analysis/adam/datasets"
list_adam_df <- read_all_xpt(dir_adam_path)


# We already created list_of_dataframes in the previous code

for (name in names(list_sdtm_df)) {
  assign(name, list_sdtm_df[[name]])
  
}

for (name in names(list_adam_df)) {
  assign(name, list_adam_df[[name]])
  
}


# Set the desired directory name for SDTM datasets
output_directory <- "S:/University Of Westminster/Data Science and Analytics/MSC_Data_science/cdiscpilot01/tabulations/sdtm/SDTM_dataframes"

# Create the directory if it doesn't exist
if (!dir.exists(output_directory)) {
  dir.create(output_directory)
}

# Iterate over the list and write each dataframe to a CSV in the new directory
for (name in names(list_sdtm_df)) {
  file_path <- file.path(output_directory, paste0(name, ".csv"))
  write.csv(list_sdtm_df[[name]], file_path, row.names = FALSE)
}

# Print message to notify that the process is done
cat("Dataframes have been saved in the", output_directory, "directory.")




# Set the desired directory name for ADAM datasets
output_directory <- "S:/University Of Westminster/Data Science and Analytics/MSC_Data_science/cdiscpilot01/analysis/adam/datasets/ADAM_dataframes"

# Create the directory if it doesn't exist
if (!dir.exists(output_directory)) {
  dir.create(output_directory)
}

# Iterate over the list and write each dataframe to a CSV in the new directory
for (name in names(list_adam_df)) {
  file_path <- file.path(output_directory, paste0(name, ".csv"))
  write.csv(list_adam_df[[name]], file_path, row.names = FALSE)
}

# Print message to notify that the process is done
cat("Dataframes have been saved in the", output_directory, "directory.")

