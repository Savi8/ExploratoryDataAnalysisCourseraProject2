## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds") 
## sum of emissions per year 
pm25_sum <- with(NEI, tapply(Emissions, year, sum)) 
## plot 
png(filename = "plot1.png") 
plot(pm25_sum, xaxt = "n", main = "Total PM 2.5 Emissions", xlab = "Year", ylab = "PM 2.5 (tons)", pch = 19, type = "b") 
axis(1, 1:4, labels = c("1999", "2002", "2005", "2008")) 
dev.off()
