#' Fisher Rasch
#'
#' Calculate the Fisher Information for a given value of theta
#' 
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta
#' 
#' @return A numeric vector with Fisher Information for each item given the proposed value of theta 
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' set.seed(1235)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-3:3, size = 7, replace = TRUE),
#' y = sample(c(0,1), size = 7, replace = TRUE))
#' fisherRasch(raschObj = Maggie, theta = 2)
#' @rdname fisherRasch
#' @aliases fisherRasch, ANY-method
#' @export
setGeneric(name = "fisherRasch",
           def = function(raschObj, theta, ...)
           {standardGeneric("fisherRasch")}
)

setMethod(f = "fisherRasch",
          definition = function(raschObj, theta, ...){
             # Calculate the probability of getting the correct answer
             prob1 <- probRasch(raschObj, theta)[["prob_q"]]
             # Calculate the probability of getting the wrong answer
             prob0 <- 1 - prob1
             # Calculate Fisher Information
             fisher <- prob1 * prob0
             return(fisher)
          })