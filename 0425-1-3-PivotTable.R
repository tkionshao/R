setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

library(plyr)
  
  df <- data.frame(
    group = c(rep('個人戶', 20), rep('企業戶', 20)),
    sex = sample(c("M", "F"), size = 40, replace = TRUE),
    age = floor(runif(n = 40, min = 25, max = 40)),
    bill = floor(runif(n = 40, min = 199, max = 2600))
  )
  
  View(df)
  
  # 使用了plyr工作包可以簡化group by的指令
  
  dfg <- ddply(df, .(group, sex), summarize,
        mean_age = round(mean(age), 2),
        sd_age = round(sd(age), 2),
        sum_bill = sum(bill),
        mean_bill = round(mean(bill), 2)
  )
  
  View(dfg)

# Titanic's pivot table

  data <- read.table("train.csv", header = TRUE, sep = ",")
  View(data)
  data2 <- data[,2:5]
  data2 <- data2[-3]
  data2 <- data2[1:891,]
  fare <- data.frame(Fare =data$Fare)
  fare <- data.frame(data2)
  data2 <- cbind(data2,fare)
  View(data2)
  
  # check the number of row data
  nrow(data2)
  nrow(fare)
  
  # Try out the relation between Vector and data.frame
  
  a <- c(1,2,3)
  b <- c(4,5,6)
  f = data.frame(a,b)
  
  # so I could see, catalogry of sex and Survived with their mean value of fare
  
  library(plyr)
  ti <- ddply(data2, .(Sex, Survived), 
              summarise, 
              mean_fare = round(mean(Fare),2), 
              sd_fare = round(sd(Fare),2))
  View(ti)

  # make it like ftable
  data_dd = ddply(data2, c('Sex', 'Survived'), nrow)
  
  
  ddply(data2, c('Sex', 'Survived', 'Fare'), number = nrow)
  














# Import Titanic > Train

  data <- read.table("train.csv", header = TRUE, sep = ",")
  data2 <- data[,2:5]
  data2 <- data2[-3]
  View(data2)
  
    # use pivot table on data2
    library(plyr)
    dfg <- ddply(data2, .(Sex, Survived), summarize)
  
  
  
    # Just give a shot of ftable
    
    sur = ftable(data2, row.vars = "Sex", col.vars = "Survived")
    View(sur)
    
  
  




