library(ggplot2)
library(calibrate)
unzip("exdata%2Fdata%2FNEI_data.zip")
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
data <- scc[grep("coal" ,scc$Short.Name, ignore.case = TRUE ), ]
nei2 <- nei[which(nei$SCC %in% data$SCC) , ]
nei3 <- tapply(nei2$Emissions , nei2$year , sum)
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
plot(names(nei3) , nei3 ,  main = "Total Emission(Tons) due to Coal in US between 1999 to 2008" , xlab = "Year", ylab = "Total PM2.5 emission(Tons) due to Coal" ,type = "l" ,font.axis = 2 , lty = 2 , col = "red")
textxy(names(nei3) , nei3 , nei3)
dev.off()