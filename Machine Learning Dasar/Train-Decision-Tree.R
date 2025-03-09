df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL

library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_tes = subset(df,split == TRUE)
test_tes = subset(df,split == FALSE)

#Train Decision Tree
library(rpart)
classifire = rpart(formula = as.factor(Purchased)~.,
                   data = training_tes
                   )
classifire

y_pred = predict(classifire,
                 newdata = test_tes[-3],
                 type = 'class')
result = cbind(test_tes,y_pred)
