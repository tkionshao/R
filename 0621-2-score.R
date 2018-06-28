setwd('')

kevin = c(85,73)
marry = c(72,64)
jerry = c(59,66)
mat = matrix(c(kevin, marry, jerry),nrow=3, byrow=T)
colnames(mat) = c('first','second')
rownames(mat) = c('kevin', 'marry', 'jerry')
mat

weightGiven_first = c(mat[,1]*0.4)
weightGiven_two = c(mat[,2]*0.6)

weightGiven_mat = cbind(weightGiven_first,weightGiven_two)

score_sum = rowSums(weightGiven_mat)

weightGiven_mat_2 = cbind(mat[,1]*0.4, mat[,2]*0.6)

score_Sum_2 = rowSums(weightGiven_mat_2)
