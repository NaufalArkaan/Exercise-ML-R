#matrix

mat = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)
mat
mat[2,3] #Mengambil baris ke 2 kolom ke 3
mat[c(1:2), 3] #Mengambil bari ke 1 dan 2 pada kolom ke 3
mat*2

mat2 = matrix(c(2,3,4,5,6,7,8,9,10), nrow = 3, byrow = TRUE)
mat2
mat2*mat
