df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL
df$Purchased = as.factor(df$Purchased)

library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_tes = subset(df,split == TRUE)
test_tes = subset(df,split == FALSE)

#Train Random Forest
library(randomForest)
classifier = randomForest(x = training_tes[-3],
                          y = training_tes$Purchased,
                          ntree = 10
                          )
y_pred = predict(classifier,newdata = test_tes[-3])
result = cbind(test_tes,y_pred)

#conf matrix
cm = table(test_tes[,3],y_pred)
cm

#auc
y_pred_num = as.numeric(y_pred)
colAUC(y_pred_num, test_tes[,3],plotROC = TRUE)

