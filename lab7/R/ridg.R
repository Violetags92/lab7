ridgereg1 <- function(formula, data, lambda = 0){
  X<-model.matrix(formula, data=data)
  y<-as.matrix(data[all.vars(formula)[1]],ncol=1)
  p <- ncol(X)
  X_new<-rbind(X,sqrt(lambda)*diag(p))
  y_new<-rbind(y,matrix(data = 0, nrow = p, ncol = 1))
  QR <- qr((X_new))
  Q <- qr.Q(QR)
  R <- qr.R(QR)
  bhat<- qr.solve(R) %*% t(Q) %*% as.matrix(y_new)
  yhat <- X %*% bhat
  result <- list(formula = formula, data=data, bhat=bhat, yhat = yhat)
  ridgereg_result <- structure(result, class="ridgereg1")
  return(ridgereg_result)
}
