#Given that We will only be using data from the dates 2007-02-01 and 2007-02-02, it efficient to 
#read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
#Hence the r code line below will enable you determine the number of rows to skip and the number of rows to read.
#Make sure that the downloaded file["household_power_consumption.txt"] is placed in your working directory. 
#Determine your working directory by using the command getwd()
#idata <- read.table("household_power_consumption.txt",sep = ";")[read.csv(fileUrl,header = TRUE,sep = ";")[[1]] == "1/2/2007" | read.csv(fileUrl,sep = ";")[[1]] == "2/2/2007",]
##-NOTE - The line of code above only need to be executed if no other plot script has been run previously


#Read the data from the text file and set the col names
idata <- read.table(fileUrl,sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),skip = 66637,nrows = 2880)
colnames(idata) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#The default width and height are 480 and 480 respectively so there is no need to set these attributes
png(file = "plot3.png") ## Open PNG device; create 'plot3.png' in your working directory

#convert the Date and Time variables to Time class in R
idata.time <- strptime(paste(idata$Date,idata$Time),format = "%d/%m/%Y %H:%M:%S")

plot(idata.time,idata$Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "l")
lines(idata.time,idata$Sub_metering_2,col = "red")
lines(idata.time,idata$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)
dev.off() ## Close the PNG file device