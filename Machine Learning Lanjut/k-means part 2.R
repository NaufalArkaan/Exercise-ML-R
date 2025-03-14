library(dplyr)
data = read.csv("K Means Data.csv")

#elbow method
set.seed(6)
wcsss = vector()
for(i in 1:10) wcsss[i] = sum(kmeans(data,i)$withinss)
plot(1:10,wcsss,type = 'b',
     main = paste('cluster of plh'),
     xlabs = 'number',
     ylabs = wcsss
)

#Build K-means
set.seed(29)
kmeans6 = kmeans(data, 6, iter.max = 10, nstart = 10)
kmeans6$cluster
kmeans6$centers

kmeans6$size

kmeans4 = kmeans(data, 4, iter.max = 10, nstart = 10)

kmeans4$size


datafinal = cbind(data, kmeans6$cluster)

#get new data
data_pred = read.csv('K Means Data.csv')


library(clue)
result = cl_predict(kmeans6, newdata = data_pred)
table(result)
