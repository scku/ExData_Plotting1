library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

vehicle_index <- grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle_index, ]
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle$SCC, ]

target = c("24510", "06037")
total_emissions = NEI_vehicle %>%
  filter(fips %in% target) %>%  
  group_by(year, fips) %>%
  summarise(
    total = sum(Emissions)
  )

png(filename="./plot6.png")
ggplot(total_emissions, aes(year, total)) +
  geom_point(aes(colour=fips, size=5)) +
  xlab("Year") +
  ylab("Total Emission") +
  ggtitle("Total Emission From Vehicle Sources in Baltimore City and Los Angeles")
dev.off()
