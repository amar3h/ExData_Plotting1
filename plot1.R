plot1 <- function() {

### Our overall goal here is simply to examine how household energy usage varies over a 2-day period
### in February, 2007. My task is to reconstruct the plots in the assignment, 
### all of which were constructed using the base plotting system.
### Andrew Marsh
### Created 4/14/2016
### 
### Step 1 - Import the dataset.
    household_power <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",dec=".")
### 
### Step 2 - Subset the Dataset.
    household_power_sub <- subset(household_power, household_power$Date=="1/2/2007"|household_power$Date=="2/2/2007")
### Step 3 - Add a column for date time.
    household_power_date <- cbind(household_power_sub, 
                    newDateTime=paste (household_power_sub$Date,household_power_sub$Time))
### Step 4- Convert to datetime.
    household_power_date_time <- cbind(household_power_date,
                                   newDateTimeFmt=strptime(household_power_date$newDateTime,"%d/%m/%Y %H:%M:%S"))
### Step 5- Plot file (plot 1) and save to png.
    library("datasets")
    png(file="plot 1.png",width=480,height=480)
    hist(as.numeric(household_power_date_time$Global_active_power,dec="."),col ="orangered1",
                xlab="Global Active Power (kilowatts)",main="Global Active Power")                        
    dev.off()
}