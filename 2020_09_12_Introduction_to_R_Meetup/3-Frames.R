# NOTE: We rarely construct frames in R. Instead, frames
#       are what datasets are read into
#
# Ergo, this is just a pedagogical exercise, to demonstrate
# that we can handle data columns with different modes

# Declare the first column for the data frame
serialNums <- c(1:10)

# Next, let's have a categorical variable 
dayOfWeek <- c("Monday", "Tuesday", "Wednesday", 
               "Thursday", "Friday", "Monday",
               "Tuesday", "Wednesday", "Thursday","Friday")

# First, declare an empty frame
frame <- c()

# Code the day column ordinally
dayCoded <- factor(frame$dayOfWeek, 
                   ordered=TRUE,
                   levels=c("Monday", "Tuesday", 
                            "Wednesday", "Thursday",
                            "Friday"))

# Finally, let's have a logical column which 
# indicates whether the row number is odd
# %% here indicates the MOD function
oddRow <- (c(1:10) %% 2 == 1)

# Let's bring all columns together under one data frame
frame <- data.frame(serialNums, dayOfWeek, oddRow)

cat("The data frame is...\n")
print(frame)

cat("Here is a summary of the serial numbers 1:10\n")
print(summary(frame$serialNums))

cat("Contents & summary of the day column\n")
print(dayCoded)
print(summary(dayCoded))
