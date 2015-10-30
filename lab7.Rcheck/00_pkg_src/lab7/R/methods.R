predict.ridgereg1 <- function(x, newdata = "default"){
  if(identical(newdata, "default")){
    return(x$yhat)
  }else{
    X <- as.matrix(cbind(1, newdata))
    y_hat <- as.vector(X %*% x$bhat)
    return(y_hat)
  }
}

coef.ridgereg1<-function(x){
  
  name <- rownames(x$bhat)
  bhat <- as.vector(x$bhat)
  names(bhat) <- name
  
  return(bhat)
  
}

print.ridgereg1 <- function(x){
  
  name <- rownames(x$bhat)
  bhat <- as.vector(x$bhat)
  names(bhat) <- name
  return(Coefficients=bhat)
}