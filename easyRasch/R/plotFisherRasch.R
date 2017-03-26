#' Test Fisher Information Plot 
#' 
#' @param raschObj An object of class Rasch
#' @param minTheta A minimum value for theta. 
#' @param maxTheta A maximum value for theta. 
#' @param title A character vector with the title defined by the user. If not specified,
#' the title will be "Information Plot for 'name'".
#' 
#' @return A plot with sum of the Fisher Information for a given theta in the y-axis
#' and the values of theta in the x-axis.
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples
#' set.seed(123)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-3:3, size = 16, replace = TRUE),
#' y = sample(c(0,1), size = 16, replace = TRUE))
#' plotFisherRasch(raschObj = Maggie, minTheta = -10, maxTheta = 10)
#' @seealso \code{\link{Rasch}}
#' @rdname plotFisherRasch
#' @aliases plotFisherRasch, ANY-method
#' @export
setGeneric(name = "plotFisherRasch",
           def = function(raschObj, minTheta = -5, maxTheta = 5, title = NULL, ...)
           {standardGeneric("plotFisherRasch")})

#' @export
setMethod(f = "plotFisherRasch",
          definition = function(raschObj, 
                                minTheta = -5, 
                                maxTheta = 5, 
                                title = NULL){
             # Define the matrix theta
             thetaMat <- matrix(seq(from = minTheta, to = maxTheta, by = 0.1), ncol = 1)
             # Calculate Fisher for different values of theta
             dataFisher <- adply(thetaMat, .margins = 1, .fun = function(w){
                          fisherRasch(raschObj = raschObj, theta = w)
                }
                )
             # Remove first colunm 
             dataFisher <- dataFisher[,-1]
             # Generate the data to use in the plot
             dataPlot <- cbind(thetaMat[,1], rowSums(dataFisher))
             
             # Start the Plot
             # Define Plot Main Title
             if(is.null(title)){
                title <- paste("Information Plot for", slot(raschObj, "name"))
             }
             #Define margin
             par(mar = c(5, 6, 5, 2))
             # Generate the plot Area
             plot(x = NULL, y = NULL, 
                  xlim = c(min(dataPlot[,1]), max(dataPlot[,1])),
                  ylim = c(min(dataPlot[,2]), max(dataPlot[,2])),
                  type = "n",
                  axes = FALSE,
                  xlab = expression(paste(theta[j])),
                  ylab = expression(paste(sum(italic(I)[i](theta)[j], i = 1, n))),
                  main = title
             )
             # Plot the line
             lines(x =  dataPlot[, 1], y = dataPlot[, 2])
             # Add axes
             axis(side = 1, at = seq(min(dataPlot[, 1]), max(dataPlot[, 1]), length.out = 5))
             axis(side = 2, at = round(seq(min(dataPlot[, 2]), max(dataPlot[, 2]), length.out = 5), 2))
          }
)
