library(ggplot2)
unzip("exdata%2Fdata%2FNEI_data.zip")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
nei1 <- subset(nei , fips == "24510")
total <- aggregate(nei1$Emissions ,list(nei1$year , nei1$type) , sum)
names(total) <- c("Year" , "Type" , "Emissions")
total$Emissions2 <- round(total$Emissions , digits = 2)
g <- ggplot(total , aes(Year , Emissions , colour = Type))
g + geom_line() + labs(y = "Total PM2.5 Emission(Tons)") + labs(title = "Emissions(Tons) by Source Type and Year") + geom_text(aes(label=total$Emissions2), size = 3)
ggsave("Plot3.png")

 