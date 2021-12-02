# reading the data from files
library(readxl)
file_location1 <- "./DataScience-BF/V PARAMETERS ( 2019-20)C &IT.xls"
file_location2 <- "./DataScience-BF/V PARAMETERS ( 2020-21)C &IT.xls"
file_location3 <- "./DataScience-BF/V PARAMETERS ( 2021-22)C &IT.xls"
column_names <- c("month", "BF1","BF4","BF5","BF6","BF7","BF8","Shop_Average")

#reading various parameters
hot_metal_prod_19_20 <- read_excel(file_location1, col_names = column_names, range = "A11:H22")
