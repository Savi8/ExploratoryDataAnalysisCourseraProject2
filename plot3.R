## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds") 
## Subset for Baltimore City 
bc_type <- as.data.frame(aggregate(Emissions ~ type + year, subset(NEI, fips == "24510"), sum))
 ## ggplot2 library(ggplot2)
 png(filename = "plot3.png") 
g <- ggplot(data = bc_type, aes(x = year, y = Emissions, color = type))
g + geom_smooth(method = "lm", se = FALSE) + labs (x = "Year", y = "PM 2.5 (tons)", 
title = "Emission trends depending on type of source for Baltimore City") 
dev.off()
