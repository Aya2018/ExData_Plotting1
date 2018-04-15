library(dplyr)

#import file into R
my_data <- read.table(list.files()[[2]], sep = ";",header = T, na.strings = "?", stringsAsFactors = F)
data <- my_data2 %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") 

#plot 2
my_limit <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480) 
with(data
     ,plot(type = "l"
           ,x = my_limit, y = Global_active_power
           ,ylab = "Global Active Power(kilowatts)", xlab ="")) #default language is 'japanese'
dev.off()
