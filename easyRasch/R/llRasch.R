#' Likelihood Theta (Rasch)
#' 
#' Calculate the likelihood of a proposed value of theta
#' 
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta
#' 
#' @return The calculate likelihood for a proposed theta given y
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' set.seed(124)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-5:5, size = 10, replace = TRUE),
#' y = sample(c(0,1), size = 10, replace = TRUE))
#' llRasch(raschObj = Maggie, theta = 2)
#' @seealso \code{\link{Rasch}}
#' @rdname llRasch
#' @aliases llRasch, ANY-method
#' @export
setGeneric(name = "llRasch",
           def = function(raschObj, theta, ...)
           {standardGeneric("llRasch")}
)

#' @export
setMethod(f = "llRasch",
          definition = function(raschObj, theta, ...){
             probabilities <- probRasch(raschObj, theta)
             ll <- prod(probabilities[[2]])
             return(ll)
          })
