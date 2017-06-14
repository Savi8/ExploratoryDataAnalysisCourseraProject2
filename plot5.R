## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
## Subset with the observations containing vehicle emissions from baltimore city summary(SCC$EI.Sector) 
# grepl returns a logical vector 
SCC_vec <- SCC[grepl("Vehicles", SCC$EI.Sector, ignore.case = TRUE),] 
NEI_vec_bc <- subset(NEI, NEI$SCC %in% SCC_vec$SCC & fips == "24510") 
# simpler alternative, which gives the same results: # 
NEI_vec_bc <- subset(NEI, fips == "24510" & type == "ON-ROAD")
 ## Total Emissions for each year 
NEI_vec_total <- with(NEI_vec_bc, tapply(Emissions, year, sum)) 
## plot 
png(filename = "plot5.png") 
plot(NEI_vec_total, xaxt="n", xlab = "Year", ylab = "PM 2.5 (tons)", main = "Total Emissions from motor vehicle sources in Baltimore City", type = "b", col = "blue") 
axis(1, 1:4, c("1999", "2002", "2005", "2008")) 
dev.off()
