# reading the data from files
library(readxl)
library(ggplot2)
library(reshape2)
file_location1 <- "./DataScience-BF/V PARAMETERS ( 2019-20)C &IT.xls"
file_location2 <- "./DataScience-BF/V PARAMETERS ( 2020-21)C &IT.xls"
file_location3 <- "./DataScience-BF/V PARAMETERS ( 2021-22)C &IT.xls"
column_names <- c("BF1","BF4","BF5","BF6","BF7","BF8","Shop_Average")
months <- c("Apr19","May19","Jun19","Jul19","Aug19","Sep19","Oct19","Nov19","Dec19","Jan20","Feb20","Mar20")

#reading various parameters
hot_metal_prod_19_20 <- read_excel(file_location1, col_names = column_names, range = "B11:H22")
hot_metal_temp_19_20 <- read_excel(file_location1, col_names = column_names, range = "B51:H62")
productivity_vol_day_19_20 <- read_excel(file_location1, col_names = column_names, range = "N73:T84")
coke_rate_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "N93:T104")
CDI_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "N93:T104")
nutcoke_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "N156:T167")


# calculating various parameter
prouctivity_19_20 <- hot_metal_prod_19_20/productivity_vol_day_19_20
coke_rate_19_20 <- coke_rate_THM_19_20/hot_metal_prod_19_20 *1000
CDI_19_20 <- CDI_THM_19_20/hot_metal_prod_19_20 *1000
nutcoke_19_20 <- nutcoke_THM_19_20/hot_metal_prod_19_20 *1000
fuel_rate_19_20 <- coke_rate_19_20 + CDI_19_20 + nutcoke_19_20


#BF1 data on various techno parameters
BF1_19_20 <- as.data.frame(cbind(months, coke_rate_19_20$BF1, CDI_19_20$BF1, nutcoke_19_20$BF1, fuel_rate_19_20$BF1))
colnames(BF1_19_20)[2:5] <- c("coke_rate", "CDI", "nutcoke", "fuel_rate")
BF1_19_20 <- melt(BF1_19_20, id = "months")
BF1_19_20$value[is.na(BF1_19_20$value)] <- 0 
BF1_19_20$months <- factor(BF1_19_20$months, labels = months)
BF1_19_20$value <- as.integer(BF1_19_20$value)

#ploting data line
g <- ggplot(BF1_19_20, aes(x = months, y = value, group = variable, color = variable)) 
g + geom_line() + geom_point() +
        ggtitle("Blast furnace 1 production with various techno parameters") +
        labs(x = "months",  y = "parameters")
        

#bar plot
g  <- ggplot(data=BF1_19_20, aes(fill = variable, y=value, x=months))
g + geom_bar(stat="identity") +
        ggtitle("Blast Furnace 1 ", subtitle = "Techno parameters") +
        labs(x = "months", y = "parameters")        
