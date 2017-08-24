library(ggplot2)
library(calibrate)
unzip("exdata%2Fdata%2FNEI_data.zip")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
data <- scc[grep("motor" ,scc$Short.Name, ignore.case = TRUE ), ]
nei1 <- subset(nei , fips == "24510")
nei2 <- nei1[which(nei1$SCC %in% data$SCC) , ]
nei3 <- tapply(nei2$Emissions , nei2$year , sum)
png("plot5.png", width = 480, height = 480, units = "px", bg = "white")
plot(names(nei3) , nei3 ,  main = "Total Emission(Tons) due to Motor Vechiles in US between 1999 to 2008" , xlab = "Year", ylab = "Total PM2.5 emission(Tons) due to MV" ,type = "l" , lty = 2 , col = "blue" , font.axis = 2)
textxy(names(nei3) , nei3 , nei3)
dev.off()
 