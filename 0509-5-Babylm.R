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
lmBaby = lm(formula = bwt~ gestation+parity+height+smoke, data=train)
lmBaby = lm(formula = bwt~ ., data=train)

summary(lmBaby)
colnames(data)

# Prediction for train
predicted <- predict(lmBaby,data = train)
yTest = train$bwt
train.MAPE <- mean(abs(yTest-predicted)/yTest)
cat("MAPE(train)=",train.MAPE*100,"%\n")

# Prediction for test
predicted <- predict(lmBaby,newdata = test)
yTest = test$bwt
test.MAPE <- mean(abs(yTest-predicted)/yTest)
cat("MAPE(test)=",test.MAPE*100,"%\n")


