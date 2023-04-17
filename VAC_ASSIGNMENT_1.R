gender <- read.csv("gender.csv", stringsAsFactors = FALSE)
#To view the dataset
View(gender)
#Datatype check
str(gender)
#Datatype conversion
gender$Gender<-as.factor(gender$Gender)
gender$Age<-as.factor(gender$Age)
gender$Height..cm.<-as.factor(gender$Height..cm.)
gender$Weight..kg.<-as.factor(gender$Weight..kg.)
gender$Occupation<-as.factor(gender$Occupation)
gender$Height..cm.<-as.factor(gender$Height..cm)
gender$Education.Level<-as.factor(gender$Education.Level)
gender$Marital.Status<-as.factor(gender$Marital.Status)
gender$Income..USD.<-as.factor(gender$Income..USD.)
gender$Favorite.Color<-as.factor(gender$Favorite.Color)
gender$X<-as.factor(gender$X)
# Datatypes Recheck
str(gender)
# Express Table for Income..USD.
prop.table(table(gender$Income..USD.))
# Importing Library
library(ggplot2)

l# Bar Graph for people of different ages
ggplot(gender, aes(x = Age)) + theme_classic() + 
  geom_bar() + 
  labs(y = "People", title = "People with Different ages")
# Pie chart for Male and female
ggplot(gender, aes(x = "", fill = Gender)) + 
  geom_bar(position = "fill") + 
  facet_grid(~Age) + coord_polar(theta = "y")
#Box plot based on GENDER AND INCOME..USD.
ggplot(gender, aes(x = Gender, y = Income..USD.)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "Income", x = "Gender", 
       title = "")





