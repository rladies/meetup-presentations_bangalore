# Let's study scatterplots now
Movies <- read.csv("Movies.csv",
                   header=TRUE)

# Declare a function to convert a currency variable into 
# numeric
DollarToNum <- function(Var) {
  
  # First remove the dollar sign
  Var <- sub("\\$","", Var)
  
  # Next remove the commas
  Var <- gsub(",", "", Var)
  
  # Finally convert the variable to number and return
  return(as.numeric(Var))
}

# Remove the rows where US Gross and/or Worldwide Gross
# are listed as Unknown
Movies <- subset(Movies,
                 US.Gross != "Unknown" &
                   Worldwide.Gross != "Unknown")

# Now convert all dollar variables to numeric
Movies$Budget <- DollarToNum(Movies$Budget)/1000000
Movies$US.Gross <- DollarToNum(Movies$US.Gross)/1000000
Movies$Worldwide.Gross <- DollarToNum(Movies$Worldwide.Gross)/1000000

# Eliminate the "outliers" - movies with heavy budgets
RegularMovies <- subset(Movies,
                        Budget < 100)

# Isolate the "money" variables for separate analysis
MoneyVars <- RegularMovies[3:5]

# Plot the scatterplots in one go!
plot(MoneyVars,
     cex=0.7,
     col="darkblue")

# Get the correlation matrix in one go!
print("Table of correlations")
print(cor(MoneyVars), digits=2)

# Noticing that US and Worldwide Gross are correlated,
# let us get a separate scatter plot
plot(RegularMovies$US.Gross,
     RegularMovies$Worldwide.Gross,
     xlab="US Gross in USD Million",
     ylab="Worldwide Gross",
     cex=0.6,
     col="darkgreen")

# The lm function below performs a regression
# between the indicated variables
lmfit <- lm(Worldwide.Gross ~ US.Gross,
            data=RegularMovies)

# Now run a trend line through it
abline(lmfit, col="red")