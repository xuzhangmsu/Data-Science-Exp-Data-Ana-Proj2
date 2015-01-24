NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data=NEI

library(ggplot2)
data2=data[data$fips=="24510",]
data3=aggregate(data2$Emissions,by=list(data2$year,data2$type),FUN=sum)
data3=setNames(data3,c("year","type","Emissions"))
#png(filename = 'plot3.png')
ggplot(data3,aes(x=data3$year,y=data3$Emissions))+
        geom_line(aes(colour=data3$type,group=data3$type))+
        geom_point(aes(colour=data3$type),size=3)
#dev.off()