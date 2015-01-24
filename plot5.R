NEI=readRDS("summarySCC_PM25.rds")
SCC=readRDS("Source_Classification_Code.rds")
library(ggplot2)
MDOnroad=subset(NEI, fips == 24510 & type == 'ON-ROAD')

MDData=aggregate(MDOnroad[, 'Emissions'], by = list(MDOnroad$year), sum)
MDData=setNames(MDData, c('year', 'Emissions'))

png(filename = 'plot5.png')
barplot(MDData$Emissions, names.arg=MDData$year, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()