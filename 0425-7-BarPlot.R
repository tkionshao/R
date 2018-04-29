setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

ti = read.table("train.csv", header= TRUE, sep = ",")
View(ti)
# Reference
    barplot(T_cyl, 
            main="cyl汽缸數次數分配表", 
            xlab="汽缸數", 
            col=c("blue", "blue", "green"), 
            names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
            border = "magenta"
          )
    
# Titanic 
    ti_pclass = table(ti$Pclass) # choosing colume
    
    # The Bar plot will be inputted a table, and table is a counting for content of colume
      barplot(ti_pclass, 
              main="Titanic Position Class", 
              xlab="Number of people", 
              col=c("red", "blue", "orange"),
              names.arg=c("Class 1.", "Class 2.", "Class 3."), 
              border = "black"
      )
