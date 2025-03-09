df = read.csv('Social_Network_ads.csv')
df$User.ID = NULL
library(caTools) #Memanggil library caTools
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)#digunakan untuk membagi data menjadi dua subset, biasanya untuk keperluan pelatihan (training) dan pengujian (testing) dalam machine learning.
training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)

training_set$Purchased = as.factor(training_set$Purchased) #Fungsi as.factor() mengonversi variabel Purchased menjadi variabel faktor, yang sangat berguna dalam analisis data dan model machine learning, terutama saat berurusan dengan data kategorikal.
test_set$Purchased = as.factor(test_set$Purchased) #Fungsi as.factor() mengonversi variabel Purchased menjadi variabel faktor, yang sangat berguna dalam analisis data dan model machine learning, terutama saat berurusan dengan data kategorikal.

summary(training_set$Purchased)
summary(test_set$Purchased)
