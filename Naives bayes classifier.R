#Loading Required Packages
install.packages('tidyverse')
library(tidyverse)
install.packages('ggplot2')
library(ggplot2)
install.packages('caret')
library(caret)
install.packages('caretEnsemble')
library(caretEnsemble)
install.packages('psych')
library(psych)
install.packages('Amelia')
library(Amelia)
install.packages('mice')
library(mice)
install.packages('GGally')
library(GGally)
install.packages('rpart')
library(rpart)
install.packages('randomForest')
library(randomForest)
#Load Dataset
dataset<- read.csv("studentattendanceanalysis.csv")
str(dataset)
head(dataset)
view(dataset)
#Visualizing data set
missmap(dataset)
ggplot(dataset, aes(Project, colour = Assignment.1)) +
  geom_freqpoly(binwidth = 1) + labs(title="Age Distribution by Outcome")
ggpairs(dataset)
#Modelling  of data
indxTrain <- createDataPartition(y = dataset$Result,p = 0.75,list = FALSE)
training <- dataset[indxTrain,]
testing <- dataset[-indxTrain,] #Check dimensions of the split > prop.table(table(data$Outcome)) * 100
prop.table(table(training$Result)) * 100
prop.table(table(testing$Result)) * 100
set.seed(120)  # Setting Seed
classifier_cl <- naiveBayes(Result ~ ., data = training)
classifier_cl
y_pred <- predict(classifier_cl, newdata = testing)
cm <- table(testing$Result, y_pred)
cm
confusionMatrix(cm)
