# Johanna Tuhkanen
#Week 5
#http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt

human<-read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep=",", header=T)
is.numeric(human$GNI)
as.numeric(human$GNI)

library(stringr)
str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
complete.cases(human)
data.frame(human[-1], comp = human)
human_ <- filter(human, complete.cases(human))

