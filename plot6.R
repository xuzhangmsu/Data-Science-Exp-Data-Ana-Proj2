NEI=readRDS("summarySCC_PM25.rds")
SCC=readRDS("Source_Classification_Code.rds")
library(ggplot2)
# Baltimore City, Maryland
MDOnroad=subset(NEI, fips == '24510' & type == 'ON-ROAD')
# Los Angeles County, California
CAOnroad=subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregates
MDData=aggregate(MDOnroad[, 'Emissions'], by = list(MDOnroad$year), sum)
MDData=setNames(MDData,c('year', 'Emissions'))
MDData$City=paste(rep('MD', 4))

CAData=aggregate(CAOnroad[, 'Emissions'], by = list(CAOnroad$year), sum)
CAData=setNames(CAData,c('year', 'Emissions'))
CAData$City=paste(rep('CA', 4))

Data=as.data.frame(rbind(MDData, CAData))

png('plot6.png')

ggplot(data = Data, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year),stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources\n Los Angeles County, California vs. Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ City) + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))

dev.off()