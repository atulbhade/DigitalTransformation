#Reading the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extracting the required data
total_emmissions <- aggregate(Emissions ~ year, NEI, sum)
# Drawing plot
barplot(total_emmissions$Emissions, names.arg=total_emmissions$year,col = c("red","green", "blue", "yellow"),
        xlab="Year", ylab="Total PM2.5 Emissions ", main = "Total PM2.5 emmison by year in US")

# copying plot to png file
png("plot1.png",width = 480, height = 480)
dev.off()

