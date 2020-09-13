#
# We will work with Apple stock data since inception
# You may choose to look up this page for its history
# http://en.wikipedia.org/wiki/History_of_Apple_Inc.
#

# Step 0: Load the lubridate package. This helps manipulate
# date fields, which is critical to time series
library(lubridate)

# Read from the AAPL (Apple) stock data
Apple <- read.csv("AAPL.csv",
                  header=TRUE)

# Step 1: Need to recognise the Date field formally
# Otherwise R treats it as character data
Apple$Date <- as.Date(Apple$Date)

# Step 2: Create a separate variable for the year 
# associated with a date, and append it as a column
Apple$Year <- year(Apple$Date)

# Step 3: Let's contrast the ativities of the stock
# between the Jan-Aug periods of 2018 and 2019
Aug2018 <- subset(Apple,
                  Year == 2018 & month(Apple$Date) < 9)
Aug2019 <- subset(Apple,
                  Year == 2019 & month(Apple$Date) < 9)

# We are going to change some options to superimpose
# one graph over another. So, capture the original
# set of graphing parameters 
oldParameters <- par(no.readonly=TRUE)

with(Aug2018, {
  aveAug2018 <- round(mean(Adj.Close),2)
  print(paste("2018 average is: ", aveAug2018))
  
  plot(Date, Adj.Close,
       main="Contrast 2018 with 2019",
       pch=20, # Character representing a plot point
       cex=0.4, # Scaling of the character
       ylim=c(30, 60), # Limits for the y axis
       col="blue",
       ylab="Adjusted Close Price")
})

# Change this parameter to superimpose the plot
par(new=TRUE)
with(Aug2019, {
  aveAug2019 <- round(mean(Adj.Close),2)
  print(paste("2019 average is: ", aveAug2019))
  
  plot(Date, Adj.Close,
       pch=20,
       cex=0.4,
       xaxt="n", yaxt="n",
       ylim=c(30, 60),
       ann=FALSE,
       col="darkgreen")
  
  # Now add a legend
  legend("bottomright",
         c("2019","2018"),
         cex=0.8,
         pch=c(20,17),
         col=c("darkgreen", "blue"))
})

# Reset with the old parameters
par(oldParameters)

# Step 4: Let's work on a combined graph, which depicts
#         the activity for 2019
with(Aug2019, {
  par(fig=c(0, 0.8, 0, 1))
  plot(Date, Adj.Close,
       main="AAPL for Year 2019: Jan-Aug",
       pch=20,
       cex=0.4,
       ylim=c(30, 70),
       ylab="Adjusted Close",
       col="darkgreen")
  
  par(fig=c(0.7, 1, 0, 1), new=TRUE)
  boxplot(Adj.Close,
          axes=FALSE,
          ylim=c(30, 70),
          col="beige")
})

# Reset the parameters
par(oldParameters)

# Step 5: Plot the summaries of Adj.Close in three slabs
slab1 <- subset(Apple, Year < 2010)
slab2 <- subset(Apple, Year > 2009 & Year < 2020)
slab3 <- subset(Apple, Year > 2019)

boxplot(Adj.Close ~ Year, data=slab1,
        col=colors()[80:89],
        main="AAPL before 2010")
boxplot(Adj.Close ~ Year, data=slab2,
        col=colors()[139:147],
        main="AAPL between 2010-2019")
boxplot(Adj.Close ~ Year, data=slab3,
        col=colors()[501:510],
        main="AAPL after 2019")

# Reset the parameters
par(oldParameters)

