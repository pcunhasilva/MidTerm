#' Plot the probability of getting a question correct on possible values of theta.
#' 
#' @param raschObj An object of class Rasch
#' @param eatTheta A logical vector. If TRUE, estimate values for theta are added to the plot.
#' @param minTheta A minimum value for theta. 
#' @param maxTheta A maximum value for theta. 
#' @param title A character vector with the title defined by the user. If not specified,
#' the title will be "Item Characteristic Curve for 'name'".
#' 
#' @return A plot with possible values of theta in the x-axis and 
#' the probability of answer a question correct given the theta in the y-axis.
#' @author Patrick C. Silva: \email{pcunhasilva@wustl.edu}
#' @examples 
#' set.seed(1235)
#' Maggie <- new("Rasch", name = "Maggie", 
#' a = sample(-3:3, size = 7, replace = TRUE),
#' y = sample(c(0,1), size = 7, replace = TRUE))
#' plot(Maggie, eatTheta = TRUE)
#' @seealso \code{\link{Rasch}}
#' @rdname plotRasch
#' @aliases plotRasch, ANY-method
#' @import plyr
#' @export
setMethod(f = "plot", 
          signature = "Rasch",
          definition = function(x, eatTheta = FALSE, 
                                minTheta = -5, maxTheta = 5, 
                                title = NULL){
          # Define the matrix theta
          thetaMat <- matrix(seq(from = minTheta, to = maxTheta, by = 0.1), ncol = 1)
          # Compute the probabilities
          compProb <- adply(thetaMat, .margins = 1, .fun = function(w){
             probRasch(raschObj = x, theta = w)[[1]]
          })
          # Remove the first colunm
          compProb <- compProb[,-1]
          # Rename colunms
          colnames(compProb) <- 1:ncol(compProb)
          
          # Generate the plot's Title if title is NULL
          if(is.null(title)){
               title <- paste("Item Characteristic Curve for", slot(x, "name"))
          }
          # Generate the plot.
          plot(x = NULL, y = NULL,
               xlim = c(min(thetaMat[,1]), max(thetaMat[,1])),
               ylim = c(0, 1),
               type = "n",
               main = title,
               ylab = expression(paste("Pr(y=1|", theta[j],")")),
               xlab = expression(paste(theta[i]," ", "(Ability)")),
               axes = FALSE)
          # Add x-axis
          axis(side = 1, at = c(seq(min(thetaMat[,1]), max(thetaMat[,1]), length.out = 5)))
          # Add y-axis
          axis(side = 2, at = c(0, 0.5, 1))
          # Add lines
          matlines(x = thetaMat[,1], y = compProb, type = "l", 
                  col = 1:ncol(compProb), lty = 1)
          
          # Generate auxiliary vectors to use in the legend
          leg <-  paste0("Q",1:ncol(compProb))
          lcode <- rep(1, ncol(compProb))
          
          # If eatTheta = TRUE
          if(eatTheta){
             # Add the dashed line
             abline(v = eapRasch(x), lty = 2)
             # Add legend including eatTheta
             legend("topright", 
                    legend = c(leg, "EAT"), 
                    lty = c(lcode, 2), 
                    col = c(1:ncol(compProb), 1),
                    bty = "n",
                    cex = 0.7)
          }else{
             #Add Legend without eatTheta
             legend("topright", 
                    legend = c(leg), 
                    lty = c(lcode), 
                    col = c(1:ncol(compProb)),
                    bty = "n",
                    cex = 0.7)
             }
          }
)