#data eksternal

data = read.csv('Salary_Data.csv')

data = read.table('Salary_Data.csv', header = TRUE, sep = ',')

class(data) #memberi tau tipe data

data

var1 <- data$Salary #Mengambil data apada bagian salary saja
var1

data$Salary <= 100000 #mengecek hasil salary yang kurang dari sama dengan 100000
var2 = as.numeric(data$Salary <= 100000)
var2

dim(data)
length(data$YearsExperience)
head(data) #menunjukan 6 data paling atas
tail(data) #menunjukan 6 data paling bawah


data$Salary[5:10] #Mengambil bagian salary dari nomor 5 sampai 10
data[5:10,1] #Mengambil bagian data yearsexperience dari baris 5 sampai 10

mean(data$YearsExperience[data$Salary <= 100000]) #mengsorting data salary, lalu mencari mean dari years experience

data[data$Salary <= 100000 & data$YearsExperience < 3,]
data[data$Salary <= 100000 | data$YearsExperience < 3,]
data[data$Salary <= 100000 & data$YearsExperience < 3 & data$Salary <= 50000,]
data[data$Salary <= 100000 | data$YearsExperience < 3 & data$Salary <= 50000,]
