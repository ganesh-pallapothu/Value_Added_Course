# import dataset
dataset1 <- 'studentattendanceanalysis.csv'
#To view dataset
dataset <-read.csv(dataset1)
View(dataset)
#Datatype Conversion
dataset$Reg.no<-as.factor(dataset$Reg.no)
dataset$Attendance<-as.factor(dataset$Attendance)
dataset$Exam.1<-as.factor(dataset$Exam.1)
dataset$Exam.2<-as.factor(dataset$Exam.2)
dataset$Assignment.1<-as.factor(dataset$Assignment.1)
dataset$Project<-as.factor(dataset$Project)
dataset$Result<-as.factor(dataset$Result)
#Datatype Recheck
str(dataset)
#Express table for Assignment.1
prop.table(table(dataset$Assignment.1))
#importing library
library(ggplot2)
#Bar graph for people based on Result
ggplot(dataset, aes(x = Result)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Student", title = "Student result analysis")
#Bar graph for people who submitted assignment
ggplot(dataset, aes(x = Project)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Student", title = "Student Project analysis")
# Pie chart for Male and female
ggplot(dataset, aes(x = "", fill = Project)) + 
  geom_bar(position = "fill") + 
  facet_grid(~Result) + coord_polar(theta = "x")
#Box plot based on GENDER AND INCOME..USD.
ggplot(dataset, aes(x = Project, y = Result )) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "Result", x = "Project", 
       title = "Project&Result")
#3d plot
scatterplot3d(x = dataset$Attendance, y = dataset$Assignment.1, z = dataset$Project)
plot3d(x = dataset$Attendance, y = dataset$Assignment.1, z = dataset$Project)
lines3d(x = dataset$Attendance, y = dataset$Assignment.1, z = dataset$Project)
surface3d(x = dataset$Attendance, y = dataset$Assignment.1, z = dataset$Project)

