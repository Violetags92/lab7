predict.ridgereg1 <- function(x, newdata = "default"){
  if(identical(newdata, "default")){
    return(x$yhat)
  }else{
    X <- as.matrix(cbind(1, newdata))
    y_hat <- as.vector(X %*% x$bhat)
    return(y_hat)
  }
}