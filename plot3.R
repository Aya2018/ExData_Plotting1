library(dplyr)

#import file into R
my_data <- read.table(list.files()[[2]], sep = ";",header = T, na.strings = "?", stringsAsFactors = F)
data <- my_data2 %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") 

#plot3
my_limit <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png",width = 480, height = 480)
with(data
     ,plot(type = "l"
           ,x = my_limit ,y = Sub_metering_1
           ,xlab = "", ylab = "Energy sub metering"))
lines(x = my_limit, y = data$Sub_metering_2, type = "l", col = "red")     
lines(x = my_limit, y = data$Sub_metering_3, type = "l", col = "blue")     
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty=1, lwd=2.5,col=c("black", "red", "blue"))
dev.off()
