df <- read.csv(file.choose(),sep='|',header = F)
str(df)

# Teacher's way
tmp <- table(df)
mat <- matrix(rep(-1,5^2),nrow=5)
rownames(mat) = c('A','B','C','D','E') 
colnames(mat) = c('A','B','C','D','E')

for (i in 1:nrow(df)){
  mat[df[i,1],df[i,2]] = df[i,3]
}




# Way One
res = 0
for(i in len){
  res = res + tmp[,,i] * i
}
print(res)

diag(res) = -1

for(i in 1:5){
  res[i,i] = -1
}
print(res)

# Way Two
group_res <- group_by(df,V1)
group_res_sum <- summarise(group_res,count = n())

name_ <- group_res_sum$V1
class(name_)
name <- c('A','B','C','D','E')
name_fac <- factor(name)
