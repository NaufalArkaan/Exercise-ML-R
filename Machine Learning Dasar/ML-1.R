df = read.csv('Social_Network_Ads - na.csv')
is.na(df$Age) #Mengecek bagian kolom age apakah data true/false
df2 = subset(df, is.na(df$Age) == FALSE) #Memanggil variabel df, lalu mencari bagian kolom Age dan nilainya harus false, jadi data yang true akan kehapus

df2$EstimatedSalary = ifelse(df2$EstimatedSalary > 100000, 
                             100000, df2$EstimatedSalary) #Jika estimated salary lebih dari 100.000 dia akan membuat menjadi mentok 100.000, jika tidak data akan tetap seperti biasa ditampilkan

df = read.csv("Social_Network_Ads - na.csv")
df$EstimatedSalary[is.na(df$EstimatedSalary)] = 0 #Mengubah baris pada kolom Estimated Salary menjadi 0

mean(df$Age) #tidak akan bisa mencari nilai mean karena ada nilai salah satu yang NA
mean(df$Age, na.rm = TRUE) #na.rm = mengabaikan nilai yang NA sehingga bisa dicari nilain meannya
min(df$Age, na.rm = TRUE) 
max(df$Age, na.rm = TRUE) 

df$Age[is.na(df$Age)] =  #mencari NA pada baris pas kolom Age
mean(df$Age, na.rm = TRUE) #mengisi NA dengan nilai mean dari keseluruhan Age

