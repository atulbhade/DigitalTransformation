#Reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#required data
baltimoreDF <- subset(NEI, fips=="24510")
baltimoreEmission <- aggregate(Emissions ~ year, baltimoreDF, sum)

#ploting
barplot(baltimoreEmission$Emissions,names.arg=baltimoreEmission$year, col = c("red","green", "blue", "yellow"),
        xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions - Baltimore City,MD emissions at various years")
# copying plot to png file
png("plot2.png",width = 480, height = 480)
dev.off()