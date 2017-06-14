## Reading in the data 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
## Subsets for Baltimore City and Los Angeles County with type == "ON-ROAD" 
vec_bc_tot <- aggregate(Emissions ~ year, subset(NEI, fips == "24510" & type == "ON-ROAD"), sum) 
vec_lac_tot <- aggregate(Emissions ~ year, subset(NEI, fips == "06037" & type == "ON-ROAD"), sum) 
## plot 
png(filename = "plot6.png", width = 1000) par(mfrow = c(1,2)) 
plot(vec_bc_tot, type = "l", lwd = 2, col = "red", xlab = "Year", ylab = "PM 2.5 (tons)", main = "Baltimore City") 
legend("topright", c("vehicle sources (BC)"), 
lty = 1, col = "red", cex = 1) 
plot(vec_lac_tot, type = "l", lwd = 2, col = "blue", xlab = "Year", ylab = "PM 2.5 (tons)", 
main = "Los Angeles County") 
legend("topleft",
c("vehicle sources (LAC)"), lty = 1, col = "blue", cex = 1) 
dev.off()
