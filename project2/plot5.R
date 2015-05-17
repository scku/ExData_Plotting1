library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

vehicle_index <- grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle_index, ]
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle$SCC, ]

total_emissions = NEI_vehicle %>%
  filter(fips == 24510) %>%  
  group_by(year) %>%
  summarise(
    total = sum(Emissions)
  )

png(filename="./plot5.png")
ggplot(total_emissions, aes(year, total)) +
  geom_point() +
  xlab("Year") +
  ylab("Total Emission") +
  ggtitle("Total Emission From Vehicle Sources in Baltimore City")
dev.off()