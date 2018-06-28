weather = c('s','r','c','r','c')
weather_factor = factor(weather)
levels(weather_factor) = c('oor','rap','sick')
weather_factor

# is.na
array <- c(1,3,4,5,NA)
is.na(array)
result = !is.na(array)
class(result)
array[result]

# as.factor
array_2 = c('a','b','c','d')
class(array_2)
array_2_factor = as.factor(array_2)
class(array_2_factor)
levels(array_2_factor)