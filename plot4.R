df <- read.table("/Users/stanleyku/Desktop/ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)/1000
#df$Time <- strptime(df$Time, "%H:%M:%S")
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

subset <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

