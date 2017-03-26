#' EAP - Expected a posteriori value of theta
#' 
#' @param raschObj An object of class Rasch
#' @param lower The lower limit of integration
#' @param upper The upper limit of integration
#'
#' @return The estimated value of theta_j
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' set.seed(1235)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-3:3, size = 7, replace = TRUE),
#' y = sample(c(0,1), size = 7, replace = TRUE))
#' eapRasch(raschObj = Maggie, lower = -10, upper = 10)
#' @seealso \code{\link{Rasch}}
#' @rdname eapRasch
#' @aliases eapRasch, ANY-method
#' @export
setGeneric(name = "eapRasch",
           def = function(raschObj, lower = -6, upper = 6, ...)
              {standardGeneric("eapRasch")}
)
#' @export
setMethod(f = "eapRasch", 
          definition = function(raschObj, lower = -6, upper = 6, ...){
             f_to_integrate <- function(theta){
                llRasch(raschObj = raschObj, theta = theta) * 
                   priorRasch(raschObj = raschObj, theta = theta)
             }
             eap <- integrate(Vectorize(f_to_integrate), lower = lower, upper = upper)
             return(eap[[1]])
          }
)
