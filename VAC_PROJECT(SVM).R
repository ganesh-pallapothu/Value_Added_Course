# import dataset
dataset1 <- 'studentattendanceanalysis.csv'
dataset <-read.csv(dataset1)
View(dataset)
#importing libraries
library(caTools)
library(ggplot2)
library(GGally)
library(e1071)
#Data Split
set.seed(123)
split = sample.split(dataset$Result,SplitRatio = 0.75)
# Training set and Testing set
training_set = subset(dataset,split==TRUE)
testing_set = subset(dataset,split==FALSE)
View(training_set)
View(testing_set)
#Dataset Plot
ggpairs(training_set,ggplot2::aes(colour = Result,alpha = 0.6))
#scaling data
#training_set[-3] = scale(training_set[-3])
#testing_set[-3] = scale(testing_set[-3])
scaleddf <- as.data.frame(sapply(training_set, function(i) if(is.numeric(i)) scale(i) else i))
scaleddf <- as.data.frame(sapply(testing_set, function(i) if(is.numeric(i)) scale(i) else i))
#svc

svm.fit=svm(as.factor(Result)~ ., data=training_set, core="libsvm",kernel="linear",cross=10, probability=TRUE)
#classifier1 = svm(formula=Result~.,data = training_set, type = 'C-classification',kernal = 'radial')
#Prediction
pred1 = predict(svm.fit, type = 'response', newdata = testing_set)
#Actual  & Prediction Comp
comp = data.frame(testing_set$Result, pred1)
View(comp)
#confusion Matrix
cm1 = table(testing_set[,5],pred1)
cm1