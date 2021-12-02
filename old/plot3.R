library(ggplot2)
#Reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#required data
baltimoreDF <- subset(NEI, fips=="24510")
baltimoreDF$year <- as.factor(baltimoreDF$year)
baltimoreA.agg <- aggregate(Emissions~(year+type), baltimoreDF, sum)
#ploting 

#facet for each source type
g  <- ggplot(data=baltimoreA.agg, aes(fill = type, y=Emissions, x=year))
g + geom_bar(stat="identity") +facet_wrap(~type) +ggtitle("Total PM2.5 Emissions - Baltimore City, MD", subtitle = "By Source Type") +
        labs(x = "Year", y = "PM2.5 Emissions (10^6 Tons)")
#copying plot to png file
png("plot3.png", width=480, height=480)
dev.off()
