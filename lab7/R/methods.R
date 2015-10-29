predict.ridgereg1 <- function(x, newdata = "default"){
  if(identical(newdata, "default")){
    return(x$y_hat)
  }else{
    X <- as.matrix(cbind(1, newdata))
    y_hat <- X %*% x$bhat
    return(y_hat)
  }
}