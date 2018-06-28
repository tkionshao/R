setwd("D:\\MegaSync\\MEGAsync\\R\\tryByself")

data = iris

x <- data$Sepal.Width
y <- data$Petal.Width

df <- data.frame(x = x, y = y)

n = 0.3 * nrow(df)
n_test = sample(1:nrow(df),n)

df_train <- df[-(n_test),]
df_test <- df[n_test,]


lmTrain <- lm(formula = y ~ x, data = df_train)
predicted <- predict(lmTrain , newdata = df_test)
summary(predicted)

plot(y~x , main = "Test", xlab = "Age", ylab = "Fare")

points(x = df_test$x, y = predicted, col="green", cex = 2, pch = 16)
abline(reg = lmTrain$coefficients, col = "red", lwd = 1) #函數繪製輔助線
