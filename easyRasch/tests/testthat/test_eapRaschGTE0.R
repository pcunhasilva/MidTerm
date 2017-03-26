context("Test if EAP Rasch is greater or equal to than 0")
Ted <- new("Rasch", name = "Ted", 
           a = sample(-3:3, size = 10, replace = TRUE),
           y = sample(c(0,1), size = 10, replace = TRUE))
test_that("output is greater or equal to than zero", 
          expect_gte(eapRasch(Ted),  0)
)