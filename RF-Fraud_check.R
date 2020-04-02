library(randomForest)

#upload data path
fraud <- read.csv("C:/Users/user/Downloads/Fraud_check.csv")

hist(fraud$Taxable.Income)

# if Taxable Income is less than or equal to 30000 then Risky else Good.
taxable_income<- ifelse(fraud$Taxable.Income <=30000,"Risky","Good" )
taxable_income

fraud_1<-data.frame(fraud[,-3],taxable_income)
View(fraud_1)

table(fraud_1$taxable_income)

library(randomForest)

#Model Building with 1000 tree
fraud_model<- randomForest(taxable_income~., data = fraud_1,ntree = 1000)
fraud_model
# Prediction and Confusion Matrix 

pred<- predict(fraud_model,fraud_1)
pred

library(e1071)
library(caret)
library(MASS)
confusionMatrix(pred,fraud_1$taxable_income)

##Visualize
plot(fraud_model,lwd = 2)
legend("topright",colnames(fraud_model$err.rate), col = 1:6, cex = 0.8, fill = 1:6)

-----------------------------------------------------------------------------------------------------------------

#Model Building with 1200 tree
fraud_model<- randomForest(taxable_income~., data = fraud_1,ntree = 1200)
fraud_model
# Prediction and Confusion Matrix 

pred<- predict(fraud_model,fraud_1)
pred

library(e1071)
library(caret)
library(MASS)
confusionMatrix(pred,fraud_1$taxable_income)

##Visualize
plot(fraud_model,lwd = 2)
legend("topright",colnames(fraud_model$err.rate), col = 1:6, cex = 0.8, fill = 1:6)

