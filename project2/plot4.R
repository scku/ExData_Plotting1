library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

coal_index <- grep("coal", SCC$EI.Sector, ignore.case=TRUE)
SCC_coal <- SCC[coal_index, ]
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC, ]

total_emissions = NEI_coal %>%
  group_by(year) %>%
  summarise(
    total = sum(Emissions)
  )

png(filename="./plot4.png")
ggplot(total_emissions, aes(year, y=total)) +
  geom_point() +
  xlab("Year") +
  ylab("Total Emission") +
  ggtitle("Total Emission From Coal Combustion-Related Sources")
dev.off()
