temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv2(temp[i],stringsAsFactors=FALSE))


data <- rbind(table1.csv,table2.csv,table3.csv,table4.csv,table5.csv,table6.csv)
backup <- data

rm(list=ls(pattern="^table"))


data$Dato <- dmy(data$Dato)
data$Day <- mday(data$Dato)
data$Month <- month(data$Dato)
data$Year <- year(data$Dato)
data$Temp <- data$Middel

df60 <- data %>% filter(Year >= 1960 & Year < 1970)
df70 <- data %>% filter(Year >= 1970 & Year < 1980)
df80 <- data %>% filter(Year >= 1980 & Year < 1990)
df90 <- data %>% filter(Year >= 1990 & Year < 2000)
df00 <- data %>% filter(Year >= 2000 & Year < 2010)
df10 <- data %>% filter(Year >= 1990 & Year < 2020)


df10$Stasjon <- NULL
df10$ï..Navn <- NULL
df10$Middel <- NULL
df10$Maks <- NULL
df10$Min <- NULL
  
Month <- df10$Month
Day <- df10$Day
Year <- df10$Year
Temp <- df10$Temp
Dato <- df10$Dato

df10 <- data.frame(Month, Day, Year, Temp, Dato)


