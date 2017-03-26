#' Probabiltiy function for a object Rasch
#' 
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of \theta_j
#' 
#' @return A list contains
#'  \item A vector of length n that represents P_{ij} for each question
#'  \item A vector of length n that represents P_{ij} if the question was 
#'  answered correct and Q_{ij} if the question was answered wrong
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' set.seed(1235)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-3:3, size = 7, replace = TRUE),
#' y = sample(c(0,1), size = 7, replace = TRUE))
#' probRasch(raschObj = Maggie, theta = 2)
#' @seealso \code{\link{Rasch}}
#' @rdname probRasch
#' @aliases probRasch, ANY-method
#' @export
setGeneric(name = "probRasch",
           def = function(raschObj, theta, ...)
           {standardGeneric("probRasch")}
)

#' @export
setMethod(f = "probRasch",
          definition = function(raschObj, theta, ...){
             prob_q <- exp(theta-slot(raschObj, "a"))/(1+exp(theta-slot(raschObj, "a")))
             prob_answer <- ifelse(slot(raschObj, "y")==1, prob_q, 1 - prob_q)
             return(list(prob_q = prob_q, prob_answer = prob_answer))
          }
)
