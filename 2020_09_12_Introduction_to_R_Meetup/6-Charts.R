library(lubridate)

# Read from the AAPL (Apple) stock data
Apple <- read.csv("AAPL.csv",
                  header=TRUE)

# Step 1: Need to convert this into Date type
Apple$Date <- as.Date(Apple$Date)

# Step 2: Add a Month column to the frame
Apple$Month <- month(Apple$Date, label=TRUE)

# Step 3: Create a bar chart of the frequencies by month
counts <- table(Apple$Month)
barplot(counts, 
        main="Trading days over the years for AAPL",
        col=c("red","white","blue"))
# horiz=TRUE)

lbls=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
pie(counts, labels=lbls,
      main="Trading Days")

# Step 4: Let's average the means by trading month
means <- aggregate(Apple$Close,
                   by=list(Apple$Month),
                   FUN=mean)
# print(means)
barplot(means$x, 
        names=means$Group.1,
        main="Mean price over the years at AAPL",
        col=c("orange","white","darkgreen"))
