install.packages("C50")
library(C50)
data(churn)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Traindt <- princomp( data , cor=T) # cor=T 單位不同
summary(pca_Traindt)