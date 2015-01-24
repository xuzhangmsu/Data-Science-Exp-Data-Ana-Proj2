NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data=NEI

data2=data[data$fips=="24510",]
data3=aggregate(data2$Emissions,by=list(data2$year),FUN=sum)
data3=setNames(data3,c("year","Emissions"))

        png(filename = "plot2.png")
        barplot(data3$Emissions, names.arg=data3$year, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
        dev.off()

