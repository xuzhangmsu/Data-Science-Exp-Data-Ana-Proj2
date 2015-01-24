
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data=NEI

data1=aggregate(data$Emissions,by=list(data$year),FUN=sum)
data1=setNames(data1,c("year","Emissions"))

png(filename = "plot1.png")
barplot(data1$Emissions, names.arg=data1$year, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()

