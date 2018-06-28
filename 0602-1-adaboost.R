setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

data <- read.table("babies.csv", header = TRUE, sep = ",")

# Missing compentsation.

for(i in 1:7){
  
  n_null <- is.na(data[,i])
  n_mean <- mean(data[,i], na.rm = TRUE)
  data[n_null,i] <- n_mean
  
}

# Slipt to Train and Test.
library(rpart)
library(C50)
data(churn) 
data = churnTrain[,-3] # 排除 "area_code"欄位
n = 0.3*nrow(data)
n_test = sample(1:nrow(data),n)
data_train = data[-n_test,]
test = data[n_test,]

# Modeling.
churn.tree=rpart(churn~.,data=data_train)
y = data_train$churn

# Prediction for train
y_hat=predict(churn.tree, newdata=data_train, type="class")
table.test=table(y,y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

# Prediction for test

#Adaboost
install.packages("fastAdaboost")
library(fastAdaboost)
churn_adaboost <- adaboost(churn~., data_train, 10) # 10表示有10個弱分類器
pred <- predict( churn_adaboost,newdata=data_train)
cat("Correct Classification Ratio(test)=", (1- pred$error)*100,"%\n")




