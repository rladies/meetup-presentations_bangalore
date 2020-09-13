# Here's how you write a function of your own
# A function's graph is a pair (x, f(x))

#########################
# Simple polynomial
funx <- function(x) {
  return (x^3 + 2*x^2 + sin(x) - 1)
}

# x coordinate for the pair
xvals <- seq(-3, 2, by=0.001)

# Plot the function
plot(xvals, funx(xvals),
     main="Function plotting",
     type="l", lwd=2, 
     col="darkred",
     xlab="x", ylab="f(x)")

# Axes
abline(v=0)
abline(h=0)
