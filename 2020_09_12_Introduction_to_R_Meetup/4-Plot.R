# We shall manipulate dates in this exercise
# Step 0: Install the lubridate package
install.packages("lubridate")
library(lubridate)

# Read from the AAPL (Apple) stock data
Apple <- read.csv("AAPL.csv",
                  header=TRUE)

# List the first and last few rows of the dataset
print("The first and last sections of the dataset are")
print(head(Apple))
print(tail(Apple))

# Note: R treats the Date field as factor
print(paste("The initial type of Date is", 
            class(Apple$Date)))

# Step 1: Need to convert this into Date type
print("Converting the Date column to date type")
Apple$Date <- as.Date(Apple$Date)

# Step 2: Focus on 2020 stock activity
#         Express it as a classic time series
Aug2020 <- subset(Apple,
                  # month(Date) == 8 & 
                  year(Date) == 2020,
                  select = c(Date, Close))

# Step 3: Set the options for the plot, after making a copy
# of the old settings
oldPars <- par(no.readonly=TRUE)
par(bg="beige")
par(lty="solid")

# Margin in inches: bottom, left, top, right
# par(mai=c(1.5,1.5,1.5,1.5)) 

# Step 4: Graph the time series, after setting parameters
with(Aug2020, {
  plot(Date, Close, 
       col="red",
       xlab="Month",
       pch=20) # symbol type
  lines(Date, Close, col="navy")
  title("Apple's Stock Activity for 2020")
})

# Step 5: Restore the old parameter settings
par(oldPars)
