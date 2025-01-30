df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL

#Feature Scaling
df[,1:2] = scale(df[,1:2])

library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_tes = subset(df,split == TRUE)
test_tes = subset(df,split == FALSE)

#Train Model KNN
library(class)
y_pred = knn(train = training_tes[,-3],
             test = test_tes[,-3],
             cl = training_tes[,3],
             k= 5
             )
summary(y_pred)

result = cbind(test_tes,y_pred)

#conf matrix
cm = table(test_tes[,3],y_pred)
cm

#auc
y_pred_num = as.numeric(y_pred)
colAUC(y_pred_num, test_tes[,3],plotROC = TRUE)
