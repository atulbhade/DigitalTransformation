library(readxl)

## Reading the excel 


path = "C:/Users/bspadmin/Desktop/Coursera_Atul_Bhade/DigitalTransformation/DataScience-BF"
Months = c("APR","MAY","JUNE","JULY","AUG","SEP","OCT","NOV","DEC","JAN","FEB","MAR","Yearly")


## read hot metal production 
Hot_metal_prod_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "B10:H23")
Hot_metal_prod_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "B8:H22")
Hot_metal_prod_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "B8:H22")

## Average Daily rate of production
Avg_Dly_Rate_Prod_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "A28:I43")
Avg_Dly_Rate_Prod_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "A27:H41")
Avg_Dly_Rate_Prod_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "A27:H41")

## Hot Blast temp 
Hot_Blast_temp_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "A48:I63")
Hot_Blast_temp_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "A46:H60")
Hot_Blast_temp_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "A46:H60")

##Useful volume/day 
Vol_Day_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "N72:T85")
Vol_Day_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "N65:T79")
Vol_Day_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "N67:T81")

## Kg of coke 
Coke_kg_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "N92:T105")
Coke_kg_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "N84:T98")
Coke_kg_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "N86:T100")


## Kg of CDI
CDI_kg_2019 <- read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "N113:T126")
CDI_kg_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "N104:T118")
CDI_kg_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "N106:T120")

## KG of Nutcoke 
nut_coke_2019 <-  read_excel(paste(path,"/VPARAMETERS(2019-20)C&IT.xls",sep=""),range = "N155:T168")
nut_coke_2020 <- read_excel(paste(path,"/VPARAMETERS(2020-21)C&IT.xls",sep=""),range = "N144:T158")
nut_coke_2021 <- read_excel(paste(path,"/VPARAMETERS(2021-22)C&IT.xls",sep=""),range = "N146:T160")




## Calculating various parameters based on data available 

## Productivity 
Productivity_2019 <-  Hot_metal_prod_2019/Vol_Day_2019
Productivity_2019 <- cbind(Months,Productivity_2019)
Productivity_2020 <- Hot_metal_prod_2020/Vol_Day_2020
Productivity_2020 <- cbind(Months,Productivity_2020[-1,])
Productivity_2021 <- Hot_metal_prod_2021/Vol_Day_2021
Productivity_2021 <- cbind(Months,Productivity_2021[-1,])

## Coke Rate 
Coke_Rate_2019 <- (Coke_kg_2019/Hot_metal_prod_2019)*1000
Coke_Rate_2019 <- cbind(Months,Coke_Rate_2019)
Coke_Rate_2020 <- (Coke_kg_2020/Hot_metal_prod_2020)*1000
Coke_Rate_2020 <- cbind(Months,Coke_Rate_2020[-1,])
Coke_Rate_2021 <- (Coke_kg_2021/Hot_metal_prod_2021)*1000
Coke_Rate_2021 <- cbind(Months,Coke_Rate_2021[-1,])

## CDI Rate 
CDI_Rate_2019 <-  (CDI_kg_2019/Hot_metal_prod_2019)*1000
CDI_Rate_2019 <- cbind(Months,CDI_Rate_2019)
CDI_Rate_2020 <-  (CDI_kg_2020/Hot_metal_prod_2020)*1000
CDI_Rate_2020 <- cbind(Months,CDI_Rate_2020[-1,])
CDI_Rate_2021 <-  (CDI_kg_2021/Hot_metal_prod_2021)*1000
CDI_Rate_2021 <- cbind(Months,CDI_Rate_2021[-1,])

## Nut Coke Rate 
Nut_Coke_Rate_2019 <- (nut_coke_2019/Hot_metal_prod_2019)*1000
Nut_Coke_Rate_2019 <- cbind(Months,Nut_Coke_Rate_2019)
Nut_Coke_Rate_2020 <- (nut_coke_2020/Hot_metal_prod_2020)*1000
Nut_Coke_Rate_2020 <- cbind(Months,Nut_Coke_Rate_2020[-1,])
Nut_Coke_Rate_2021 <-  (nut_coke_2021/Hot_metal_prod_2021)*1000
Nut_Coke_Rate_2021 <- cbind(Months,Nut_Coke_Rate_2021[-1,])

## Fuel Rate 
Fuel_Rate_2019 <-  Coke_Rate_2019[,-1] + CDI_Rate_2019[,-1] + Nut_Coke_Rate_2019[,-1]
Fuel_Rate_2019 <- cbind(Months,Fuel_Rate_2019)
Fuel_Rate_2020 <-  Coke_Rate_2020[,-1] + CDI_Rate_2020[,-1] + Nut_Coke_Rate_2020[,-1]
Fuel_Rate_2020 <- cbind(Months,Fuel_Rate_2020)
Fuel_Rate_2021 <-  Coke_Rate_2021[,-1] + CDI_Rate_2021[,-1] + Nut_Coke_Rate_2021[,-1]
Fuel_Rate_2021 <- cbind(Months,Fuel_Rate_2021)
library(reshape2)
source("~/Data Science using R/Projects/emd/parameters.R")


## melting and reshaping the data for plotting 

CDI_Rate_2019 <- melt(CDI_Rate_2019,id="Months")
CDI_Rate_2019$value[is.na(CDI_Rate_2019$value)] <- 0
CDI_Rate_2019$Months <- factor(CDI_Rate_2019$Months, levels = Months)

CDI_Rate_2020 <- melt(CDI_Rate_2020,id="Months")
CDI_Rate_2020 <- subset(CDI_Rate_2020,!is.na(CDI_Rate_2020$value))
CDI_Rate_2020$Months <- factor(CDI_Rate_2020$Months, levels = Months)


CDI_Rate_2021 <- melt(CDI_Rate_2021,id="Months")
CDI_Rate_2021 <- subset(CDI_Rate_2021,!is.na(CDI_Rate_2021$value))
CDI_Rate_2021$Months <- factor(CDI_Rate_2021$Months, levels = Months)




# Opening the Plotting device 

## CDI Rate 2019

png("CDI_Rate_2019.png",width = 480, height = 480)

ggplot(CDI_Rate_2019,            
       aes(x = Months,
           y = value,group=variable,
           color = variable)) +  geom_line()
#Making the device off 
dev.off()


## CDI Rate 2020

png("CDI_Rate_2020.png",width = 480, height = 480)

ggplot(CDI_Rate_2020,            
       aes(x = Months,
           y = value,group=variable,
           color = variable)) +  geom_line()
#Making the device off 
dev.off()


## CDI Rate 2021
png("CDI_Rate_2021.png",width = 480, height = 480)

ggplot(CDI_Rate_2021,            
       aes(x = Months,
           y = value,group=variable,
           color = variable)) +  geom_line()
#Making the device off 
dev.off()