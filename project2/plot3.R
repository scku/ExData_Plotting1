library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

total_emissions = NEI %>%
  filter(fips == 24510) %>%
  group_by(year, type) %>%
  summarise(
    total = sum(Emissions)
  )

png(filename="./plot3.png")
ggplot(total_emissions, aes(year, y=total)) +
  geom_point(aes(colour=type, size=4)) +
  xlab("Year") +
  ylab("Total Emission") +
  ggtitle("Total Emission in Baltimore City, Maryland by Type") +
  facet_wrap(~type, ncol=2)
dev.off()