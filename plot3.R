## Exploratory Data Analysis Peer-graded Assignment Course Project 1

## Create plot3: Plot Energy sub metering over the period of 2 days  
## First read the data
power_df<-read.table("./desktop/household_power_consumption.txt", header=TRUE, sep=";")

## Cleaning data: convert date and time variables to Date/Time classes and subset the data for 2days 

power_df$Date<- as.Date(power_df$Date, format="%d/%m/%Y")
power_df_2days<- subset(power_df, power_df$Date=="2007-02-01" | power_df$Date=="2007-02-02")
power_df_2days$Time<- strptime(paste(power_df_2days$Date,power_df_2days$Time), "%Y-%m-%d %H:%M:%S")

## Convert factor variables into numeric ones
power_df_2days$Global_active_power<- as.numeric(power_df_2days$Global_active_power)
power_df_2days$Global_reactive_power<- as.numeric(power_df_2days$Global_reactive_power)
power_df_2days$Voltage<- as.numeric(power_df_2days$Voltage)
power_df_2days$Global_intensity<- as.numeric(power_df_2days$Global_intensity)
power_df_2days$Sub_metering_1<- as.numeric(power_df_2days$Sub_metering_1)
power_df_2days$Sub_metering_2<- as.numeric(power_df_2days$Sub_metering_2)
power_df_2days$Sub_metering_3<- as.numeric(power_df_2days$Sub_metering_3)


## plot Energy sub metering over the period of 2 days 

par(mfrow(1,1),mar=c(4,4,4,2))
png("./desktop/plot3.png", width=480, height=480)
plot(power_df_2days$Time, power_df_2days$Sub_metering_1, 
     xlab="", 
     ylab="Energy sub metering",
     type="l", 
     col="black")
points(power_df_2days$Time, power_df_2days$Sub_metering_2, type="l", col="red")
points(power_df_2days$Time, power_df_2days$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
dev.off()

