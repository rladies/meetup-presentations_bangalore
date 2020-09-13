# This is how you declare a set of numbers
# In this case, from 1 to 10. 
nums <- c(1:10)

# Explicitly declaring a set of numbers
primes <- c(2,3,5,7,11,13,17,19,23,29)

# Some stats on sets of numbers
myMean <- mean(primes)
cat("The mean of primes is", myMean, 
    "\n") # This is an end-of-line character

mySD <- sd(primes)
cat("The SD of primes is", 
    round(mySD, 2), "\n")

cor_np <- cor(nums,primes)
cat("Correlation of nums vs primes is", 
    round(cor_np, 2), "\n")

# Here's a rudimentary plot
plot(nums,primes,
     pch=20,
     col=colors()[30:40],
     main="Colourful Primes")

regress <- lm(primes ~ nums)
abline(regress)
