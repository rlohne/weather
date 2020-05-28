# 1. Package names 
# Define the names of the packages to be used, these are stored in the packages variable, and loaded/installed as needed
packages <- c("ggplot2", "dplyr", "tidyr", "stringr", "httr", "jsonlite", "shiny", "ggthemes", "purrr", "expss", "lubridate", "tictoc")

# 1.2 Packages description
# ggplot2: for plotting visualizations
# ggrepel: support for label related geoms in ggplot
# dplyr and tidyr: for data wrangling 
# deSolve: for running the ordinary differential equations (ODE) providing the values/predictions
# lubridate: for handling dates
# wpp: provides current projections for the populations of various countries according to the UN
# expss: provides vlookup-like functionality 


# 2. Install packages not yet installed
# Installed packages are stored in the installed packages variable
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
# 3. Packages loading
invisible(lapply(packages, library, character.only = TRUE))

