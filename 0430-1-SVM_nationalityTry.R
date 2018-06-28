
install.packages("e1071")

library(e1071)
library(C50)
library(plyr)






# !!!! Fucking bad result of prediction





?(churn)
data(churn)

# Close the data which's words.
df <- churnTrain
# View(df)

# To seperate df to training and testing data.
# Count data number and extract 30 pecent to be testing data/
n = 0.3*nrow(df)
n_test = sample(1:nrow(df),n)

df_train = df[-n_test,]
df_test = df[n_test,]
y_test = df[,1]
df_test_noY <- df_test[,-1]

# Import SVM to establish model.
svm_model = svm(state ~ . , data = df_train)
summary(svm_model)


# Make a prediction for testing data.
state_pred = predict(svm_model, df_test) # The second argument is just dataframe's name.
# Table the result and answers.
table(df_test$state,state_pred) # Result
diag(table(df_test$state,state_pred)) # Prediction

# Calcution of the accuracy
sum(table(df_test$state,state_pred))
sum(diag(table(df_test$state,state_pred)))
message("準確度：",sum(diag(table(df_test$state,state_pred))) / sum(table(df_test$state,state_pred)) *100,"%")
