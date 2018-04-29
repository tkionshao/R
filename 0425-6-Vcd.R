setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

install.packages("vcd")
library(vcd)

# table()

  df <- data.frame(
    group = c(rep('個人戶', 20), rep('企業戶', 20)),
    sex = sample(c("M", "F"), size = 40, replace = TRUE),
    age = floor(runif(n = 40, min = 25, max = 40)),
    bill = floor(runif(n = 40, min = 199, max = 2600))
  )
  
  # According to "colume" to count
  
      table(df$group) # but it has been distinct, so can't do it for every row
      table(df$sex)
      table(df$bill) # not dataFrame
      df # row: 40
  
      # prop.table()
      
      prop.table(df$bill)
      data.frame(df$group, prop.table(df$group))
      data.frame(df$bill, prop.table(df$bill))
      
      prop.table(df$age)
      data.frame(df$age, prop.table(df$age))
      
      # 2 dimemsion count
      table(df$age, df$group)
      table(df$group, df$age) # dicision of who is x and y
      
      prop.table(table(df$age, df$group))
      
      # mutiply 100 times
      x = df$age
      x = prop.table(x)
      x = x * 100
      
  # combine ftable with vcd
      library(dplyr)
      ti = read.table("train.csv", header = TRUE, sep = ",")
      ti = ti[2:5]
      ti = ti[-2] # out col1 no need
      ti = ti[-2] # out col2 no need
      ti = ti[-2] # out col3 no need
      tbl_ti = tbl_df(ti)
      View(ti)
      ftable(tbl_ti, row.vars = "Sex", col.vars = "Survived")
      f_ti = ftable(ti, row.vars = "Survived", col.vars = "Sex")
      
      prop.table(f_ti, 2)
      