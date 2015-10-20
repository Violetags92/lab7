#' Function for ridge regression 
#' @param formula formula.
#' @param data data.frame.
#' @param lambda numeric.
#' @return A linreg object.
#' @field formula A formula.
#' @field data A data.frame.
#' @field bhat A matrix.
#' @field yhat A matrix.
#' @examples 
#' ridgereg1 <- ridgereg(formula = Petal.Length ~ Species, data = iris, lambda = 0)
#' ridgereg1$print()
#' ridgereg1$coeff()
#' ridgereg1$pred()  
## We decide to use QR decompositon.
ridgereg <- setRefClass("ridgereg",
                      fields=list(formula="formula", 
                                  data = "data.frame", 
                                  bhat = "matrix",
                                  yhat = "matrix",
                                  lambda = "numeric",
                                  X_blabla = "matrix",
                                  X_bind = "matrix",
                                  y_bind = "matrix"
                                  ),
                      
                      methods = list(
                        initialize = function(formula, data, lambda = 0){
                          .self$formula <- formula
                          .self$data <- data
                          .self$lambda <- lambda
                          X <- model.matrix(.self$formula, .self$data)
                          y <- as.matrix(data[all.vars(.self$formula)[1]],1)
                          .self$X_blabla <- sqrt(.self$lambda) * diag(ncol(X))
                          .self$X_bind <- rbind(X,.self$X_blabla)
                          .self$y_bind <- as.matrix(c(y, rep(0, ncol(X))),ncol = 1)
                          qr_Xb <- qr(.self$X_bind)
                          .self$bhat <- qr.solve(qr.R(qr_Xb)) %*% t(qr.Q(qr_Xb)) %*% as.matrix(.self$y_bind)
                          .self$yhat <- X %*% .self$bhat
                          },
                        
                        print = function(){
                          writeLines("Call:")
                          f1 <- as.character(.self$formula)
                          writeLines(c("lm.ridge(formula =", f1[2],f1[1],f1[3], ",data=iris)"), sep=" ")
                          writeLines("\n")
                          writeLines("Coefficients:")
                          t(.self$bhat)
                        },
                        
                        coef = function(){
                          writeLines("Coefficientes:")
                          return(c(.self$bhat[]))
                        },
                        
                        pred = function(){
                          writeLines("Predicted values:")
                          return(.self$yhat)
                        }
                      )
)



