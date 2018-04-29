setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

# 想知道結果與結果之間的關係

z <- data.frame(Main= c('豚','牛','牛','牛','豚','牛','豚'), sub=c('有','沒有','沒有','有','有','有','沒有') , drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
ftable(z, row.vars = "drink", col.vars = "Main")
View(z)

# 是否能把ftable結果存成一個表格

ftable(z, row.vars = 1:2, col.vars = "drink")
x <- ftable(z, row.vars = "drink", col.vars = "Main")
View(x)


# Just give a shot of ftable, Titanic
    
    setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")
    
    data <- read.table("train.csv", header = TRUE, sep = ",")
    data2 <- data[,2:5]
    data2 <- data2[-3]
    View(data2)
    
      # use pivot table on data2
    
    library(plyr)
    dfg <- ddply(data2, .(Sex, Survived), summarize)
    sur = ftable(data2, row.vars = "Sex", col.vars = "Survived")
    View(sur)
    