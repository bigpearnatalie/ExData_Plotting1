sdata<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
fdata<-subset(sdata,sdata$V1=="1/2/2007"|sdata$V1=="2/2/2007")
names(fdata)<-c("Date",	"Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

gap<-as.numeric(as.character(fdata$Global_active_power))


png(filename="plot1")
hist(gap,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()