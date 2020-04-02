#install.packages("randomForest")
library(randomForest)

#in Categorical
highsales<- ifelse(CompanyData$Sales<9,"No","Yes")
highsales
#Creating Data frame
CompanyData1<- data.frame(CompanyData[2:11],highsales)
View(CompanyData1)

table(company_1$highsales)

#Training and testing Data
Company_training<-CompanyData1[1:380,]
Company_testing<- CompanyData1[381:400,]

#model random forest with 1000 tree.
model<-randomForest(highsales~.,data = Company_training,ntree=1000)
print(model)
print(importance(model))

#prediction on training data
pred_1<-predict(model,Company_training)
head(pred_1)
install.packages('caret')
library(MASS)
library(caret)
library(e1071)

#confusion Matrix
confusionMatrix(pred_1,Company_training$highsales)

pred_2<-predict(model,Company_testing)
head(pred_2)
confusionMatrix(pred_2,Company_testing$highsales)

#############try with changing in number of tree

model2<-randomForest(highsales~.,data = Company_training,ntree=500)
print(model2)
print(importance(model2))

pred_1<-predict(model2,Company_training)
head(pred_1)
install.packages('caret')
library(MASS)
library(caret)
library(e1071)

confusionMatrix(pred_1,Company_training$highsales)

pred_2<-predict(model,Company_testing)
head(pred_2)
confusionMatrix(pred_2,Company_testing$highsales)
