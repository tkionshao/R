setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

data <- read.table("babies.csv", header = TRUE, sep = ",")

# Missing compentsation.

for(i in 1:7){
  
  n_null <- is.na(data[,i])
  n_mean <- mean(data[,i], na.rm = TRUE)
  data[n_null,i] <- n_mean
  
}

# Slipt to Train and Test.
n = 0.3*nrow(data)
n_test = sample(1:nrow(data),n)
train = data[-n_test,]
test = data[n_test,]

# Modeling.
library(rpart)
baby.tree=rpart(bwt~. ,data=train)
baby.tree
plot(baby.tree)
text(baby.tree , cex=.6)

# Prediction for train
predicted <- predict(baby.tree,data = train)
yTest = train$bwt
train.MAPE <- mean(abs(yTest-predicted)/yTest)
cat("MAPE(train)=",train.MAPE*100,"%\n")

# Prediction for test
predicted <- predict(baby.tree,newdata = test)
yTest = test$bwt
test.MAPE <- mean(abs(yTest-predicted)/yTest)
cat("MAPE(test)=",test.MAPE*100,"%\n")


