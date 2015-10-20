predict.ridgereg1 <- function(x, newdata = NULL){
  if (is.null(newdata)){
    return(x$fitted)
  }else{
    newdata <- as.matrix(newdata)
    R <- as.vector(newdata %*% x$coefficients)
    return(R)
  }
}
