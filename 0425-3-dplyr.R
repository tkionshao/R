install.packages("dplyr")
library(dplyr)

# Titanic origin data frame
data <- read.table("train.csv", header = TRUE, sep = ",")

# Show the colume you selected
select(data, Sex, Survived)
showData = select(data, Sex)

# Kind of formate to eadily review
  tbl_df
  tbl_data
  data
    tbl_data = tbl_df(data) #compare to data.frame, tbl_df could show the wholde data in one line.
  
  # filter
      # Those function could run for both of formate.
      filter(data, Sex == "male")
      filter(tbl_data, Sex == "male") # It is more clear, but not all.
  
  # head
      head(data,5)
      head(tbl_data,5)
  
  # Arrange
      arrange(tbl_data, desc(Fare))
      arrange(data, desc(Fare))
    
  # mutate()
    # It means "add colume", this colume coudl be an operation.
      tbl_data_mutate <- mutate(tbl_data, Test_col = Survived * Age)
      data_mean = summary(data$Age)
    
  # mean() *Not from dplyr
      mean(data$Age)
      mean(data$Age,na.rm = TRUE) # Remember to negloect NA(NULL).
  
  # sample_n() and sample_frac()
      data_10_sample = sample_n(data, 10) # by number
      data_10percent_sample = sample_frac(data, 0.1) # by percent
      
  # sample()    
      sample(5, size = 3)
  # count() 
    # Actually, it is counting for specific colume
      count(data, Survived)
    
  # Try matrix and dataframe.
      m_test = matrix(x = c(42,35,16,9),y = c(25,36,21,51))
      m_test = data.frame(x = c(42,35,16,9),y = c(25,36,21,51))    
  
  # n_distinct(iris_df$Species), it could be kind of count.
      n_distinct(iris$Species)
    