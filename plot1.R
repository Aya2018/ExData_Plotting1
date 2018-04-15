library(dplyr)

#import file into R
my_data <- read.table(list.files()[[2]], sep = ";",header = T, na.strings = "?", stringsAsFactors = F)
data <- my_data2 %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") 

#plot 1
png("plot1.png", width = 480, height = 480) 
with(data,hist(Global_active_power, col = "red", xlim = range(0:6), ylim = range(0:1200), xlab = "Global Active Power(kilowatts)"))
dev.off()
