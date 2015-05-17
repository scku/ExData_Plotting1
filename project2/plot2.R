library(ggplot2)
library(dplyr)

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

total_emissions = NEI %>%
  filter(fips == 24510) %>%
  group_by(year) %>%
  summarise(
    total = sum(Emissions)
  )

png(filename="./plot2.png")
plot(total_emissions$year, total_emissions$total,
     main="Total Emissions from PM2.5 in Baltimore City, Maryland",
     xlab="Year",
     ylab="Total Emissions")
dev.off()
