setwd("E:\\MegaSync\\MEGAsync\\R\\tryByself")

install.packages("dplyr")

library(dplyr)
# Just choose the colume to summary.

x <- group_by(iris, Species)
summarise(x ,
            count = n(),
            Sepal.Length_avg = mean(Sepal.Length, na.rm = TRUE),
            Sepal.Length_max = max(Sepal.Length, na.rm = TRUE),
            Sepal.Length_min = min(Sepal.Length, na.rm = TRUE)
        )

install.packages("plyr")
library(plyr)

# Plyr could easliy make a pivot table.
ddply(df, .(group, sex), summarize,
        count = n(),
        mean_age = round(mean(age), 2),
        sd_age = round(sd(age), 2),
        sum_bill = sum(bill),
        mean_bill = round(mean(bill), 2)
    )

ddply(x, .(Species), summarize,
      count = n(),
      Sepal.Length_avg = mean(Sepal.Length, na.rm = TRUE),
      Sepal.Length_max = max(Sepal.Length, na.rm = TRUE),
      Sepal.Length_min = min(Sepal.Length, na.rm = TRUE)
    )
