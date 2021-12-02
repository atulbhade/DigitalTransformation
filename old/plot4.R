library(dplyr)
library(ggplot2)
#Reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#required data
coal_comb_short <- SCC[grepl("coal|comb",SCC$Short.Name, ignore.case=TRUE),]
scc_list <- coal_comb_short[grepl("coal",coal_comb_short$SCC.Level.Four, ignore.case=TRUE),]

filteredSCC <- SCC[scc_list$SCC,]$SCC
filteredNEI <- NEI[NEI$SCC %in% filteredSCC,]
filteredNEI$year <- as.factor(filteredNEI$year)
agg <- aggregate(Emissions~year, filteredNEI, sum)

#ploting
ggplot(data=agg, aes(y=Emissions/10^6, x=year, fill = year)) + 
        geom_bar(stat="identity") +
        ggtitle("Total PM2.5 Emissions - All United States", subtitle = "By Coal Comsumption") +
        labs(x = "Year", y = "PM2.5 Emissions (10^6 Tons)")+
        scale_y_continuous(breaks=seq(0,0.6,by=0.1), limits=c(0,0.6)) 
#copying plot
png("plot4.png", width=480, height=480)
dev.off()