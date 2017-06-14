## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
## Finding only the coal related observations summary(SCC$Short.Name) 
# grepl returns a locial vector 
SCC_coal <- SCC[grepl("Coal", SCC$Short.Name, ignore.case = TRUE),] 
NEI_coal <- subset(NEI, NEI$SCC %in% SCC_coal$SCC) 
## Total emissions over each year 
NEI_coal_total <- with(NEI_coal, tapply(Emissions, year, sum)) 
## plot 
png(filename = "plot4.png") 
plot(NEI_coal_total, xaxt="n", xlab = "Year", ylab = "PM 2.5 (tons)", main = "Total Emissions from coal combustion-related sources across the US ", type = "b", col = "blue") 
axis(1, 1:4, c("1999", "2002", "2005", "2008")) 
dev.off()
