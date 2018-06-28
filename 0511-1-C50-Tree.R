setwd("D:\\MegaSync\\MEGAsync\\R\\tryByself")
pack <- c('C50','randomForest','tree')
for (i in pack){install.packages(i)}

install.packages("caret") #caret library

library(C50)
library(randomForest)
library(tree)
  # check
  search()
  sapply(pack, FUN = library, character.only = TRUE)

#-----above are tree-----
# Data preparation
  
data <- iris
iris

# Import tree
install.packages("caret")
install.packages("iterators")
install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(caret) # This is for split data.
library(dplyr)
sample_Index <- createDataPartition(y=data$Species,p=0.7,list=FALSE)
iris.train=data[sample_Index,]
iris.test=data[-sample_Index,]
# Check sample is mostly diffetent.
par(mfrow=c(1,3)) 
plot(iris.train$Species)
plot(iris.test$Species)
plot(data$Species)

# Create model
iris.C50tree=C5.0(Species~ . ,data=iris.train)
summary(iris.C50tree)
plot(iris.C50tree)

# Confusion matrix
# To train sample
y = iris$Species[sample_Index]
y_hat= predict(iris.C50tree,iris.train,type='class')
table.train=table(y,y_hat)
cat("Total records(train)=",nrow(iris.train),"\n")
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

# To test sample
y = iris$Species[-sample_Index]
y_hat= predict(iris.C50tree,iris.test,type='class')
table.test=table(y,y_hat)
cat("Total records(train)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")
