#' Calculates the prior probability of theta
#' 
#' @param theta A proposed value of \theta[j]
#' 
#' @return The height of the specified normal curve evaluated at the theta
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' priorRasch(theta = 1)
#' @seealso \code{\link{Rasch}}
#' @rdname priorRasch
#' @aliases priorRasch, ANY-method
#' @export
setGeneric(name = "priorRasch",
           def = function(raschObj, theta, ...)
           {standardGeneric("priorRasch")}
)

#' @export
setMethod(f = "priorRasch",
          definition = function(theta, ...){
             height <- dnorm(theta, mean = 0, sd = 3)
             return(height)
          })

