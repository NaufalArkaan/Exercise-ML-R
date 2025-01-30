df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL

#Feature Scaling
df[,1:2] = scale(df[,1:2])

library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_tes = subset(df,split == TRUE)
test_tes = subset(df,split == FALSE)

#Train Model SVM
library(e1071)
classifier = svm(formula = Purchased ~.,
                  data = training_tes,
                 type = 'C-classification',
                 kernel = 'linear')
y_pred = predict(classifier, newdata = test_tes[-3])
result = cbind(test_tes,y_pred)
summary(y_pred)
