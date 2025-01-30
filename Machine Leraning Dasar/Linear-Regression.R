df = read.csv('Salary_Data.csv')
library(caTools) #Baris ini memuat pustaka caTools yang digunakan untuk berbagai operasi seperti split data.
set.seed(123) #Baris ini menetapkan seed untuk fungsi acak sehingga hasil yang didapatkan dapat direproduksi. Nilai 123 adalah contoh nilai seed.

split = sample.split(df$Salary,SplitRatio = 0.7) #Kode ini membagi data menjadi dua subset berdasarkan rasio yang ditentukan. Di sini, 70% dari data akan masuk ke subset pelatihan, dan sisanya akan masuk ke subset pengujian.
training_tes = subset(df,split == TRUE) #Baris ini membuat subset pelatihan yang terdiri dari baris-baris di df di mana split bernilai TRUE.
test_tes = subset(df,split == FALSE) #Baris ini membuat subset pengujian yang terdiri dari baris-baris di df di mana split bernilai FALSE.

regresor = lm(formula = Salary ~ YearsExperience, 
              data = training_tes) #Kode ini membangun model regresi linear menggunakan lm() dengan Salary sebagai variabel dependen dan YearsExperience sebagai variabel independen, berdasarkan data pelatihan.

y_pred = predict(regresor, newdata = test_tes) #Baris ini menggunakan model regresi yang dibangun untuk memprediksi gaji (Salary) berdasarkan tahun pengalaman (YearsExperience) pada data pengujian.
reuslt = cbind(test_tes, y_pred) #Kode ini menggabungkan data pengujian (test_tes) dengan hasil prediksi (y_pred) menjadi satu data frame reuslt.