# Johanna Tuhkanen
# 10.2.2017
#week 3 data wrangling
getwd()
setwd("C:\\Users\\Kari\\Desktop\\IODS")
student_mat<-read.csv("student-mat.csv", sep=";")
student_por<- read.csv("student-por.csv", sep=";")

str(student_mat)
# structure
dim(student_mat)
# Data has 395 observations and 33 variables.

str(student_por)
#structure
dim(student_por)
# dimension

install.packages("dplyr", dependencies = TRUE)
library("dplyr")

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
mat_por <- inner_join(student_mat,student_por, by = join_by, suffix= c(".math" , ".por"))

str(mat_por)
dim(mat_por)


#if-else: 
colnames(mat_por)

alc <- select(mat_por, one_of(join_by))
notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]
notjoined_columns


for(column_name in notjoined_columns) {
  two_columns <- select(mat_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else {
    alc[column_name] <- first_column
  }
}

## if else stops

glimpse(alc)

library(ggplot2)

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
alc <- mutate(alc, high_use = alc_use > 2)
glimpse(alc)
# Everything looks ok.

write.csv(alc, file="IODS")

