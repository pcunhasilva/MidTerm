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

# Calculate the probability for an object named John with theta equal 1
set.seed(1223)
John <- new("Rasch", name = "John", 
            a = sample(-3:3, size = 4, replace = TRUE),
            y = sample(c(0,1), size = 4, replace = TRUE))
probRasch(raschObj = John, theta = 1)

# Calculate the likelihood for an object named John with theta equal 1
llRasch(raschObj = John, theta = 1)

# Calculate the prior probability of a theta equal 5
priorRasch(theta = 5)

# Calculate EAP for an object named John using the default to lower and upper
eapRasch(raschObj = John)
# Now changing the defaults
eapRasch(raschObj = John, lower = -1, upper = 1)




