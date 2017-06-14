## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds")
## Sum of the emissions of Baltimore City 
pm25_sum_bc <- with(subset(NEI, fips == "24510"),
tapply(Emissions, year, sum))
 ## plot 
png(filename = "plot2.png")
plot(pm25_sum_bc, xaxt = "n", main = "Total PM 2.5 Emissions (Baltimore City)", xlab = "Year", ylab = "PM 2.5 (tons)", pch = 19, type = "b") 
axis(1, 1:4, labels = c("1999", "2002", "2005", "2008")) 
dev.off()
