# Create a matrix with names for rows and columns
rownames <- c("1st Row", "2nd Row")
colnames <- c("1st Col","2nd Col","3rd Col")
A <- matrix(c(1,2,3,4,5,6), nrow=2, 
            dimnames=list(rownames, colnames))

# Access rows and columns
cat("The first row is", A[1, ], "\n")
cat("The second column is", A[, 2], "\n")

# Submatrices
B <- A[, c(2,3)]
print(B)

# Another way
B <- A[,-1]
print(B)

# Here's an easy way to build a matrix of any order
# If m = no. of rows, n = no. of cols, then order = mn
#
# Let's build a 4 x 5 matrix now
C = matrix(c(1:20), nrow=4)
cat("Column-wise filled 4 x 5 matrix is...\n")
print(C)

# Let's fill the entries row-wise
D = matrix(c(1:20), nrow=4, byrow=TRUE)
cat("Row-wise filled 4 x 5 matrix is...\n")
print(D)

# Let's now build an array of 60 elements
E = array(c(1:60), dim=c(3,4,5))

# Watch what happens when you print this out!
cat("Contents of 3 x 4 x 5 array\n")
print(E)
