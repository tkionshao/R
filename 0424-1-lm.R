data(iris)
View(iris)
Sepal.Length~Species

data(iris)
data1 = cbind(iris$Sepal.Length,iris$Petal.Length)
data = iris[-5]
data

Train <- data.frame(x1 = iris$Sepal.Length,x2 = iris$Sepal.Width, y = iris$Petal.Length)


pca_Traindt <- princomp( data , cor=T)
summary(pca_Traindt)

View(data1)


xx = data.frame(x = c(1,2,3,4,5))


Train <- data.frame(x = iris$Sepal.Width, y = iris$Petal.Length)

lm_test = lm(formula = Train[,1]~Train[,2], data = Train)
lm_test = lm(formula = y~x, data = Train)

plot(Train$y~Train$x , main = "A", xlab = "B", ylab = "C") # 中文字形family = "STHeiti")
plot(Train$x~Train$y , main = "A", xlab = "B", ylab = "C") # 中文字形family = "STHeiti")

xx = data.frame(x = 3)

summary(lm_test)
predicted <- predict(lm_test , newdata = xx)
points(x = xx, y = predicted, col="green", cex = 2, pch = 16)
abline(lm_test = Train$coefficients, col = "red", lwd = 4)


plot(iris$Sepal.Length+~iris$Petal.Length , main = "A", xlab = "B", ylab = "C") # 中文字形family = "STHeiti")
points(x = iris$Sepal.Width, y = iris$Petal.Length, col="green", cex = 2, pch = 16)
abline(reg = lm_test$coefficients, col = "red", lwd = 4)



lm_test = lm(formula = y~x1+x2, data = Train)

