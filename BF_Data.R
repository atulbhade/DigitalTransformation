# reading the data from files
library(readxl)
library(ggplot2)
file_location1 <- "./DataScience-BF/V PARAMETERS ( 2019-20)C &IT.xls"
file_location2 <- "./DataScience-BF/V PARAMETERS ( 2020-21)C &IT.xls"
file_location3 <- "./DataScience-BF/V PARAMETERS ( 2021-22)C &IT.xls"
column_names <- c("month", "BF1","BF4","BF5","BF6","BF7","BF8","Shop_Average")

#reading various parameters
hot_metal_prod_19_20 <- read_excel(file_location1, col_names = column_names, range = "A11:H22")
hot_metal_temp_19_20 <- read_excel(file_location1, col_names = column_names, range = "A51:H62")
productivity_vol_day_19_20 <- read_excel(file_location1, col_names = column_names, range = "M73:T84")
coke_rate_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "M93:T104")
CDI_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "M93:T104")
nutcoke_THM_19_20 <- read_excel(file_location1, col_names = column_names, range = "M156:T167")
hot_metal_prod_19_20$month <- factor(hot_metal_prod_19_20$month, levels = hot_metal_prod_19_20$month)
#ploting data
ggplot(hot_metal_prod_19_20, aes(month, BF7)) +
        geom_line()

