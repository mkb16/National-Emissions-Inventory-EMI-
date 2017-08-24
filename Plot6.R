library(ggplot2)
unzip("exdata%2Fdata%2FNEI_data.zip")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
data <- scc[grep("motor" ,scc$Short.Name, ignore.case = TRUE ), ]
nei1 <- subset(nei , fips == "24510" | fips == "06037" )
nei2 <- nei1[which(nei1$SCC %in% data$SCC) , ]
total <- aggregate(nei2$Emissions ,list(nei2$year , nei2$fips) , sum)
names(total) <- c("Year" , "Fips" , "Emissions")
total$Emissions2 <- round(total$Emissions , digits = 2)
g <- ggplot(total , aes(Year , Emissions , colour = Fips))
g + geom_line() + labs(y = "Total PM2.5 Emission (Tons) due to MV") + labs(title = "Emissions (Tons) by City and Year") + scale_colour_discrete(name="City",breaks=c("06037", "24510"),labels=c("Los Angles", "Baltmore")) + geom_text(aes(label=total$Emissions2), size = 3)
ggsave("plot6.png")



