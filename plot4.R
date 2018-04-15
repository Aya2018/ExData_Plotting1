library(dplyr)

#import file into R
my_data <- read.table(list.files()[[2]], sep = ";",header = T, na.strings = "?", stringsAsFactors = F)
data <- my_data2 %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") 

#plot 4

my_limit <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

with(data
     ,plot(type = "l"
           ,x = my_limit, y = Global_active_power
           ,ylab = "Global Active Power(kilowatts)", xlab ="")) #default language is 'japanese'

with(data
     ,plot(type = "l"
           ,x = my_limit, y = Voltage
           ,ylab = "Voltage", xlab = "datetime"))
with(data
     ,plot(type = "l"
           ,x = my_limit ,y = Sub_metering_1
           ,xlab = "", ylab = "Energy sub metering"))
lines(x = my_limit, y = data$Sub_metering_2, type = "l", col = "red")     
lines(x = my_limit, y = data$Sub_metering_3, type = "l", col = "blue")     
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty=1, lwd=2.5,col=c("black", "red", "blue"))

with(data
     ,plot(type = "l"
           ,x = my_limit, y = Global_reactive_power
           ,xlab = "datetime"))

dev.off()
