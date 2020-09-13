# We shall manipulate dates in this exercise
# Step 0: Install the lubridate package
library(lubridate)

# Read from the AAPL (Apple) stock data
Apple <- read.csv("AAPL.csv",
                  header=TRUE)

# Step 1: Need to convert this into Date type
Apple$Date <- as.Date(Apple$Date)

# Step 2: Focus on August stock activities for two years
#         Express it as a classic time series
Aug2020 <- subset(Apple,
                  month(Date) == 8 & 
                    year(Date) == 2020,
                  select = c(Date, Close))

Aug2019 <- subset(Apple,
                  month(Date) == 8 & 
                    year(Date) == 2019,
                  select = c(Date, Close))

# Step 3: Set the options for the plot, after making a copy
# of the old settings
oldPars <- par(no.readonly=TRUE)
par(lty="solid")

# Step 4: Graph the two time series
plot(day(Aug2020$Date), Aug2020$Close,
       ylim=c(40,150),
       xlab="Day of Month",
       ylab="Price",
       type="b",
       col="darkgreen",
       pch=20, # symbol type
       main = "An Apple in August"
  )


lines(day(Aug2019$Date), Aug2019$Close, 
       type="b",
       col="brown",
       cex=0.7,
       pch=17) # symbol type

# Step 6: Now add a legend
legend("topright",
       c("2020","2019"),
       pch=c(20,17),
       col=c("darkgreen", "brown"))

# Step 7: Restore the old parameter settings
par(oldPars)
