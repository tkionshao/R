setwd("D:\\MegaSync\\MEGAsync\\R\\tryByself")

data <- read.table("train.csv", header = TRUE, sep = "," , null = FALSE)

x <- data$Age
y <- data$Fare

df <- data.frame(x = x, y = y)
x_mean <- mean(df$x,na.rm = TRUE)
n_null <- is.na(df$x)
df[n_null,1] <- x_mean

n = 0.3 * nrow(df)
n_test = sample(1:nrow(df),n)

df_train <- df[-(n_test),]
df_test <- df[n_test,]


lmTrain <- lm(formula = y ~ x, data = df_train)
predicted <- predict(lmTrain , newdata = df_test)
summary(predicted)

plot(y~x , main = "Test", xlab = "Age", ylab = "Fare")

points(x = df_test$x, y = predicted, col="green", cex = 2, pch = 16)
abline(reg = lmTrain$coefficients, col = "red", lwd = 1)

train.MAPE=mean(abs(df_test$y-predicted)/df_test$y)
cat("MAPE(train)=",train.MAPE*100,"%\n")
