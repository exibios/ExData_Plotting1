## This R file is to read the original data and extract only 2007-02-01 and 2007-02-02
## final file is data.csv
final_file = "data.csv"
## data provided 2,075,259 rows x 9 columns
## ./Data/exdata_data_household_power_consumption.zip
## Rule of thumb 1 - all columns are numeric 8bytes for x64
## 2.075M*9*8=149 418 648 bytes / 2^30 = .14Gb
## Rule of thumb 2 - double the number
## Memory Needed .28Gb

## Real Bytes Memory (.132 Gb)
#unzip("Data/exdata_data_household_power_consumption.zip",list=TRUE)
#>                             Name    Length Date
#1 household_power_consumption.txt 132960755  2012-10-12 13:38:00

## Real rows on the file
# TERMINAL
#Franco@DESKTOP-SR909K3 MINGW64 ~/My Documents/Johns Hopkins DS/ExData_Plotting1 (master)
#$ wc -l household_power_consumption.txt
#2075260 household_power_consumption.txt     ->   +1 because of the header

# 0
unzip(zipfile="Data/exdata_data_household_power_consumption.zip")
dir()
file = "household_power_consumption.txt"
# 1 Change because of Note 1
# 2 Change because of Note 2
initial <- read.table(file,nrows=100,header=TRUE,sep=";",na.strings = "?")
clases <- sapply(initial,class)
tabAll <- read.table(file
                     ,colClasses = clases
                     ,header = TRUE
                     ,sep = ";"
                     ,na.strings = "?"
                     )
head(tabAll)
table(tabAll$Date)
# Note 1 discovered the ; delimiter, the data has headers
# Note 2 discovered the ? symbol as null values

# create a csv file with the rows we want
# discovered that dates could have single digit for day, single digit for month, and have an special format
tabAll$Date <- as.Date(tabAll$Date,tryFormats = c("%e/%m/%Y"))
sapply(tabAll,class)
head(tabAll)
# filter february 1,2 of 2007
data_to_export <- tabAll[(tabAll['Date']=='2007-02-01')|(tabAll['Date']=='2007-02-02'),]
# we dont want the rownames, indexes
write.csv(data_to_export,file=final_file,row.names = FALSE)
