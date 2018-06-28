install.packages("e1071")

library(e1071)
library(C50)
library(plyr)

?(churn)
data(churn)

# Close the data which's words.
  df <- churnTrain[,-c(1,3,4,5)]
  # View(df)

# To seperate df to training and testing data.
  # Count data number and extract 30 pecent to be testing data/
    n = 0.3*nrow(df)
    n_test = sample(1:nrow(df),n)
    
    df_train = df[-n_test,]
    df_test = df[n_test,]
    y_test = df[,16]
    df_test_noY <- df_test[,-16]

# Import SVM to establish model.
    svm_model = svm(churn ~ . , data = df_train)
    summary(svm_model)

    
# Make a prediction for testing data.
    churn_pred = predict(svm_model, df_test) # The second argument is just dataframe's name.
    # Table the result and answers.
    table(df_test$churn,churn_pred) # Result
    diag(table(df_test$churn,churn_pred)) # Prediction
    View(churn_pred)
    View()
    # Calcution of the accuracy
    sum(table(df_test$churn,churn_pred))
    sum(diag(table(df_test$churn,churn_pred)))
    message("準確度：",sum(diag(table(df_test$churn,churn_pred))) / sum(table(df_test$churn,churn_pred)) *100,"%")
    