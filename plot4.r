sdata<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
fdata<-subset(sdata,sdata$V1=="1/2/2007"|sdata$V1=="2/2/2007")
names(fdata)<-c("Date",	"Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

fdate<-as.character(fdata$Date)
fdate<-gsub("/", ' ', fdate)

ftime<-fdata$Time
ftime<-as.character(ftime)

datetime<-as.POSIXct(paste(fdate, ftime), format="%d %m %Y %H:%M:%S")

sub1<-as.numeric(as.character(fdata$Sub_metering_1))
sub2<-as.numeric(as.character(fdata$Sub_metering_2))
sub3<-as.numeric(as.character(fdata$Sub_metering_3))

gap<-as.numeric(as.character(fdata$Global_active_power))
voltage<-as.numeric(as.character(fdata$Voltage))
grp<-as.numeric(as.character(fdata$Global_reactive_power))

png(filename="plot4.png")
par(mfrow=c(2,2))
plot(datetime,gap,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
plot(datetime,voltage,type="l",ylab="voltage",xlab="datetime")
plot(datetime,sub1,col="black",type="l",xlab="",ylab="Engergy sub metring")
lines(datetime,sub2,col="red",type="l")
lines(datetime,sub3,col="blue",type="l")
legend("topright", legend=c("sub_metering_1", "sub_metering_2","sub_metering_3"),
       col=c("black","red", "blue"), lty=c(1,1,1), cex=0.8)
plot(datetime,grp,type="l",ylab="Global reactive Power (kilowatts)",xlab="datetime")       
dev.off()