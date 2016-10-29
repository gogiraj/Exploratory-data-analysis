## Assigning a Database path to a Variable with the Database file name
url <- "C:/Users/Gagan/Desktop/DataScientist/04. Exploratory-data-analysis/Week01/household_power_consumption.txt"

## Reading the Data from the Database Text file and assiging it to a variable 
data <- read.table(url, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Taking a Subset for the date 1/2/2007 and 2/2/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 