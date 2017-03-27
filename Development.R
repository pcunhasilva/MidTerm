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

# Edit the DESCRIPTION FILE
descriptionfile <- read.dcf("easyRasch/DESCRIPTION")
descriptionfile[1, 2] <- "A simple Rasch Model" 
descriptionfile[1, 3] <- "0.1"
descriptionfile[1, 4] <- "person(\"Patrick\", \"C. Silva\", email = \"pcunhasilva@wustl.edu\", role = c(\"aut\", \"cre\"))"
descriptionfile[1, 5] <- c("Calculate Rasch Probability, estimate Theta, Fisher information, and generate plots.")
descriptionfile[1, 6] <- c("\nR (>= 3.3.2), \n stats")
descriptionfile[1, 7] <- "GPL (>= 2)"

# Add the file "Imports" to DESCRIPTION FILE.
descriptionfile <- as.matrix(t(descriptionfile[, -11]))
Imports <- c("plyr, testthat, methods, graphics")
descriptionfile <- cbind(descriptionfile, Imports)

# Save the new version of the  DESCRIPTION FILE
write.dcf(descriptionfile, "easyRasch/DESCRIPTION")

# Readload the current code as a package
current.code <- as.package("easyRasch")
load_all(current.code)

# Generate the new documentation using the new DESCRIPTION FILE.
document(current.code)

###########################################
########## Functions Use Examples #########
###########################################

# class Rasch
new("Rasch", name = "John", 
    a = sample(-3:3, size = 4, replace = TRUE),
    y = sample(c(0,1), size = 4, replace = TRUE))
new("Rasch", name = "John", 
    a = sample(-3:3, size = 4, replace = TRUE),
    y = sample(c(0,1), size = 3, replace = TRUE)) # Should return an error.

# probRasch
set.seed(1223)
Jack <- new("Rasch", name = "Jack", 
            a = sample(-3:3, size = 4, replace = TRUE),
            y = sample(c(0,1), size = 4, replace = TRUE))
probRasch(raschObj = Jack, theta = 1)

# llRasch
llRasch(raschObj = Jack, theta = 1)

# priorRasch
priorRasch(theta = 5)

# eapRasch (default)
eapRasch(raschObj = Jack)
# eapRasch changing the defaults
eapRasch(raschObj = Jack, lower = -1, upper = 1)

# plot a Rasch object (default)
plot(Jack)
# plot a Rasch object changing the defaults
plot(Jack, minTheta = -3, maxTheta = 3, eatTheta = TRUE)

# fisherRasch
fisherRasch(raschObj = Jack, theta = 2)

# plotFisherRasch (default)
plotFisherRasch(raschObj = Jack)

# plotFisherRasch changing the defaults
plotFisherRasch(raschObj = Jack, minTheta = -10, maxTheta = 10)



