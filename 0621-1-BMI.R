setwd('E:\\MegaSync\\MEGAsync\\R\\')

heitgh_vector <- c(180,169,173)
weitgh_vector <- c(73,87,43)
names_vector <- c('Brian','Toby','Sherry')
names(heitgh_vector) <- c('Brian','Toby','Sherry')
names(weitgh_vector) <- c('Brian','Toby','Sherry')

BMI_vector = (weitgh_vector / ((heitgh_vector/100)^2))
