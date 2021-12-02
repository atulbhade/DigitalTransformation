#Reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#extracting data
data_sector <- SCC[grepl("mobile",SCC$EI.Sector, ignore.case=TRUE),]
scc_list <- data_sector[grep("vehicle",data_sector$SCC.Level.Two, ignore.case=TRUE),]

filteredSCC <- SCC[scc_list$SCC,]$SCC
filteredNEI <- NEI[NEI$SCC %in% filteredSCC,]
filteredNEI$year <- as.factor(filteredNEI$year)
baltimore <- subset(filteredNEI, fips=="24510")
agg <- aggregate(Emissions~year, filteredNEI, sum)

#ploting
ggplot(data=agg, aes(y=Emissions/10^6, x=year, fill = year)) + 
        geom_bar(stat="identity") +
        ggtitle("Total PM2.5 Emissions - Baltimore City, MD", subtitle = "By Motor Vehicles") +
        labs(x = "Year", y = "PM2.5 Emissions (10^6 Tons)")
#copying plot
png("plot5.png", width=480, height=480)
dev.off()
