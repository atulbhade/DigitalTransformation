#BF8 data on various techno parameters
BF8_19_20 <- as.data.frame(cbind(months, coke_rate_19_20$BF8, CDI_19_20$BF8, nutcoke_19_20$BF8, fuel_rate_19_20$BF8,prouctivity_19_20$BF8))
colnames(BF1_19_20)[2:6] <- c("coke_rate", "CDI", "nutcoke", "fuel_rate", "productivity")
BF8_19_20 <- melt(BF8_19_20, id = "months")
BF8_19_20$value[is.na(BF1_19_20$value)] <- 0 
BF8_19_20$value[56] <- 0
BF8_19_20$months <- factor(BF8_19_20$months, labels = months)



#ploting data line
g <- ggplot(BF1_19_20, aes(x = months, y = value, group = variable, color = variable)) 
g + geom_line() + geom_point() +
        ggtitle("Blast furnace 8 production with various techno parameters") +
        labs(x = "months",  y = "parameters")


#bar plot
g  <- ggplot(data=BF8_19_20, aes(fill = variable, y=value, x=months))
g + geom_bar(stat="identity", position = position_dodge()) +
        ggtitle("Blast Furnace 8 ", subtitle = "Techno parameters") +
        labs(x = "months", y = "parameters")        



