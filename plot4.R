NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
# Coal-related SCC
DataCoal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merges two data sets
data= merge(x = NEI, y = DataCoal, by = 'SCC')
DataSum=aggregate(data[, 'Emissions'], by = list(data$year), sum)

DataSum=setNames(DataSum,c('Year', 'Emissions'))

png(filename = 'plot4.png')

ggplot(data =DataSum, aes(x = Year, y = Emissions)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle(expression('Total Emissions of PM'[2.5])) + ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + geom_text(aes(label = round(Emissions, digits = 2), size = 2)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'blue', high = 'red')

dev.off()