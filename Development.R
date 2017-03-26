###############################################
## PS 5625 - Applied Statistical Programming
## MidTerm
## Author: Patrick Cunha Silva
## Tasks: 1 - Develop the package

rm(list = ls())

# Load libraries
library(devtools)
library(roxygen2)

# Define WD
setwd("~/Google Drive/2. Academicos/6. Doutorado/Class/2017/Spring/PS 5625 - Applied Statistical Programming/MidTerm/")

# Generate the Package Directory:
if(!dir.exists("easyRasch")){
   create("easyRasch", rstudio = FALSE)
}






