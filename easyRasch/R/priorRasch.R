#' Prior probability of theta
#'
#' Calculates the prior probability of theta integrating the probability density function of theta.
#' 
#' @param theta A proposed value of theta.
#' 
#' @return The prior probability of a given theta.
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' priorRasch(theta = 1)
#' @seealso \code{\link{Rasch}}
#' @rdname priorRasch
#' @aliases priorRasch, ANY-method
#' @import stats
#' @export
setGeneric(name = "priorRasch",
           def = function(theta, ...)
           {standardGeneric("priorRasch")}
)

#' @export
setMethod(f = "priorRasch",
          definition = function(theta, ...){
             height <- dnorm(theta, mean = 0, sd = 3)
             return(height)
          })

