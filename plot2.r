sdata<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
fdata<-subset(sdata,sdata$V1=="1/2/2007"|sdata$V1=="2/2/2007")
names(fdata)<-c("Date",	"Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

fdate<-as.character(fdata$Date)
fdate<-gsub("/", ' ', fdate)

ftime<-fdata$Time
ftime<-as.character(ftime)

datetime<-as.POSIXct(paste(fdate, ftime), format="%d %m %Y %H:%M:%S")

gap<-as.numeric(as.character(fdata$Global_active_power))
png(filename="plot2.png")
plot(datetime,gap,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()