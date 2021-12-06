# finding relation between fuel rate and productivity of blast furnace
Bf1_fuel_prod_19_20 <- as.data.frame(cbind(months, fuel_rate_19_20$BF1, prouctivity_19_20$BF1))
colnames(Bf1_fuel_prod_19_20)[2:3] <- c("fuel_rate", "productivity")
Bf1_fuel_prod_19_20 <- melt(Bf1_fuel_prod_19_20, id = "months")
Bf1_fuel_prod_19_20$value[is.na(Bf1_fuel_prod_19_20$value)] <- 0
Bf1_fuel_prod_19_20$value[20] <- 0
Bf1_fuel_prod_19_20$months <- factor(Bf1_fuel_prod_19_20$months, labels = months)


g <- ggplot(data = Bf1_fuel_prod_19_20, aes(x = months, y = value, fill = variable))
g + geom_bar(stat = "identity", position = position_dodge())
