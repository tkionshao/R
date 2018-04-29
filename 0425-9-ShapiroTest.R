setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

install.packages("dplyr")
library(dplyr)

  T = read.table("train.csv", header = TRUE, sep = ",")

# shapiro.test
  # Normal distribution or not
    # Make row data from Titanic
  library(vcd) # It is for table command.

  t1 = data.frame(T$Pclass, T$Fare) # this is for ftable.
  
  t2 = T$Fare
  shapiro.test(t2) # resulrt is that Fare is not a shapiro.

  filter(T, Pclass == 1, Fare < 30 ) # dplyr: Check class = 1 has low price ticket or not.
  hist(T$Fare, prob=F) # draw it.

  
# Use mean and sd to determine a curve.
  curve(dnorm(x,mean(iris$Petal.Length),sd(iris$Petal.Length)), col="red",add=T)
  curve(dnorm(x,mean(T$Fare),sd(T$Fare)), col="red",add=T)
  
# Create a normal distribution data.
  x<- rnorm(100, mean=20, sd=5)
  hist(x)
  summary(x)  
  View(x)
# check it
  shapiro.test(x)

# view the detail of it.
  summary(t2)
  hist(t2)
  View(t2)
  
  