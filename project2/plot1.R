library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

total_emissions = NEI %>%
  group_by(year) %>%
  summarise(
    total = sum(Emissions)
  )
  
png(filename="./plot1.png")
plot(total_emissions$year, total_emissions$total,
     main="Total Emissions from PM2.5",
     xlab="Year",
     ylab="Total Emissions")
dev.off()
