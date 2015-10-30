## ----echo=FALSE----------------------------------------------------------
library(lab7)
library(mlbench)
library(caret)
library(lattice)
library(ggplot2)
data("BostonHousing")
BostonHousing$chas <- as.numeric(BostonHousing$chas)-1
set.seed(1234)
inTrain <- caret::createDataPartition(y = BostonHousing$crim,
                               p = .75,
                               list = FALSE)
training <- BostonHousing[inTrain,]
testing <- BostonHousing[-inTrain,]

## ----echo=FALSE----------------------------------------------------------
set.seed(1234)
ctrl <- caret::trainControl(method = "repeatedcv",
                     number = 10,
                     repeats = 10
                     )
BostonHousing <- scale(BostonHousing)
lmfit <- caret::train(crim~.,
               data = training,
               method = "lm",
               trControl = ctrl
              )
lmfit
pred_lm <- predict(lmfit, newdata=testing)
forwardfit <- caret::train(crim~.,
               data = training,
               method = "leapForward",
               trControl = ctrl
              )
forwardfit
pred_for<-predict(forwardfit, newdata=testing)

## ----echo=FALSE----------------------------------------------------------
## custom models in caret
cm <- list(type = c("Classification", "Regression"),
           library = "lab7",
           loop = NULL)

cm$parameters<-data.frame(parameter="lambda",
                          class="numeric",
                          label="lambda")


cm$fit <- function(x,y, lambda, param, lev, last, classProbs, ...){
  dat <- as.data.frame(x)
  dat$y <- y
  formula <- "y ~ "
  formula <- paste(formula, names(dat)[1], sep="")
  if(ncol(x) > 1){
    for(i in 2:ncol(x)){
      formula <- paste(formula, " + ", names(dat)[i], sep="")
    }
  }

  formula <- as.formula(formula)
  lab7::ridgereg1(formula = formula, data=dat, lambda=param$lambda)
}
cm$predict <- function(modelFit, newdata, preProc = NULL, submodels = NULL){
  predict(modelFit, newdata)
}

cm$prob <- list(NULL)

cm$sort<-function(x) x[order(-x$lambda), ]

cm$label <- "ridgereg"


cm$grid <- function(x,y, len = NULL,search="grid") {
  data.frame(lambda = seq(0, 1000, by = 100))
}

set.seed(1234)
myfit <- caret::train( crim ~ ., 
                       data = training,
                      method = cm,
                      trControl = ctrl
)
myfit

## ---- echo=FALSE---------------------------------------------------------
m1 <- predict(lmfit, testing)
m2 <- predict(forwardfit,testing)
m3 <- predict(myfit, testing)

plot(m1, type = "l")
plot(m2, type = "l")
plot(m3, type = "l")



