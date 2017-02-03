# Johanna Tuhkanen
# 28.1.2017
# I start week 2 exercises.
# Data wrangling

learning2014<- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt")

str(learning2014)
# I can see some structure information about data.There is information about each variables.

class(learning2014)
# The type is dataframe.

dim(learning2014)
# learning2014 should be 184X60.

setwd("C:/Users/Tommy/Desktop/IODS17/IODS-project")

write.table(learning2014, file="learningFile2014.txt")
learning2014<-read.table("learningFile2014.txt")
# I can read the data again.
str(learning2014)
head(learning2014)
# It looks correct.

