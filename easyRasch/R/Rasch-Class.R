#' Generate class Rasch
#' 
#' An object of the class Rasch must contain:
#' \itemize{
#' \item \code{name} The name of the test taker
#' \item \code{a} A vector of the question-item paramenters a (the difficulty of the question). 
#' \item \code{y} A vector of answers for the respondent y
#' }
#' 
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @aliases Rasch-class initialize, Rasch-method 
#' @rdname Rasch
#' @export
setClass(Class = "Rasch",
         representation = representation(
            name = "character",
            a = "numeric",
            y = "numeric"),
         prototype = prototype(
            name = character(),
            a = numeric(),
            y = numeric()
         )
)

#' @export  
setMethod("initialize", "Rasch",
          function(.Object, ...){
             value = callNextMethod()
             return(value)
          }
)

#' @export
setValidity("Rasch", function(object){
   # Test if a and y have the same lenght
   testlength <- length(object@y)==length(object@a)
   # Return an error message if one of the tests returns FALSE.
   if (!testlength){return(" a and y do not have the same length")}
}
)

#' @export
setGeneric("Rasch",
           function(x){
              standardGeneric("Rasch")
           }
)





