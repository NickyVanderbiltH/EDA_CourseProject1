## Exploratory Data Analysis Peer-graded Assignment Course Project 1

## Create plot1: The distribution of Global active power within 2days using histogram

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

## Transform Global active power into kilowatts
power_df_2days$Global_active_power<-power_df_2days$Global_active_power/1000

## Create the histogram for the distribution of Global active power 

par(mfrow(1,1),mar=c(4,4,4,2))
png("./desktop/plot1.png", width=480, height=480)
with(power_df_2days, hist(Global_active_power, 
                          col="red", 
                          xlab="Global Active Power(kilowatts)",
                          main="Global Active Power"))
dev.off()

