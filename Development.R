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

# Load the current code as a package
current.code <- as.package("easyRasch")
load_all(current.code)

# Generate the documentation
document(current.code)

###################################
########## Test functions #########
###################################

# Generate an object class Rasch
new("Rasch", name = "John", 
    a = sample(-3:3, size = 4, replace = TRUE),
    y = sample(c(0,1), size = 4, replace = TRUE))
new("Rasch", name = "John", 
    a = sample(-3:3, size = 4, replace = TRUE),
    y = sample(c(0,1), size = 3, replace = TRUE)) # Should return an error.




