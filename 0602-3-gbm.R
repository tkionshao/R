
library(rpart)
library(C50)
data(churn) 
data_train = churnTrain[,-3] # 排除 "area_code"欄位

set.seed(123)
data_train$churn = ifelse(data_train$churn=='yes',1,0) #GBM的Y變數僅識別 0與1
churn_GBM =gbm(churn~.,
                 data=data_train , 
                 distribution= "bernoulli", #損失函數
                 n.trees =10000, #迭代次數
                 interaction.depth =4, #決策樹深度
                 shrinkage = 0.01, # learning rate避免過度訓練
                 bag.fraction = 0.5, #隨機選取訓練數據進行後續模型訓練的抽樣比率
                 cv.folds=5 # 交叉驗證組數
) # GBM作者建議shrinkage參數設在0.01 ~ 0.001之間
# n.trees參數設在3000-10000之間

# 用交叉驗證確定最佳迭代次數
best.iter <- gbm.perf(churn_GBM,method='cv')

churn_GBM =gbm(churn~.,
               data=data_train , 
               distribution= "bernoulli", #損失函數
               n.trees = best.iter, #迭代次數
               interaction.depth =4, #決策樹深度
               shrinkage = 0.01, # learning rate避免過度訓練
               bag.fraction = 0.5, #隨機選取訓練數據進行後續模型訓練的抽樣比率
               cv.folds=5 # 交叉驗證組數
               
)

summary(churn_GBM ) #檢視變數重要性





data_test <- churnTest
data_test$churn = ifelse(data_test$churn=='yes',1,0) #將yes/no轉為 1/0
pred=predict(churn_GBM ,newdata = data_test,n.trees = best.iter)

#繪製 ROC圖
install.packages("stats")
install.packages("pROC")
library(stats)
library(pROC)
churn.roc = roc(data_test$churn,pred)
plot(churn.roc)

91


#利用coords函數找出 切割1/0的最佳臨界值 threshold
coords(churn.roc,"best")
churn.predict.class = ifelse(pred > coords(churn.roc,"best")["threshold"],"yes","no")
table(data_test$churn,churn.predict.class)
table.test <- table(data_test$churn,churn.predict.class)

#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

