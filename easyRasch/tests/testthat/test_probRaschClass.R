context("Test Class of probRasch output")
Ted <- new("Rasch", name = "Ted", 
           a = sample(-3:3, size = 10, replace = TRUE),
           y = sample(c(0,1), size = 10, replace = TRUE))
test_that("output is a list", 
             expect_is(probRasch(Ted, theta = 5),  "list")
)