# create dataframe that represents 1995-2013 historical data
Past <- data %>%
  group_by(Year, Month) %>%
  arrange(Day) %>%
  ungroup() %>%
  group_by(Year) %>%
  mutate(newDay = yday(Dato)) %>%   # label days as 1:365 (will represent x-axis)         
  ungroup() %>%
  filter(Year != 2019) %>%     # filter out missing data (identified with '-99' value) & current year data
  group_by(newDay) %>%
  mutate(upper = max(Temp), # identify max value for each day
         lower = min(Temp), # identify min value for each day
         avg = mean(Temp),  # calculate mean value for each day
         se = sd(Temp)/sqrt(length(Temp))) %>%  # calculate standard error of mean
  mutate(avg_upper = avg+(2.101*se),  # calculate 95% CI for mean
         avg_lower = avg-(2.101*se)) %>%  # calculate 95% CI for mean
  ungroup()

# create dataframe that represents current year data
Present <- data %>%
  group_by(Year, Month) %>%
  arrange(Day) %>%
  ungroup() %>%
  group_by(Year) %>%
  mutate(newDay = yday(Dato)) %>%  # create matching x-axis as historical data
  ungroup() %>%
  filter(Year == 2019)  # filter out missing data & select current year data


# create dataframe that represents the lowest temp for each day for the historical data
PastLows <- Past %>%
  group_by(newDay) %>%
  summarise(Pastlow = min(Temp)) # identify lowest temp for each day from 1995-2013

# create dataframe that identifies the days in 2014 in which the temps were lower than all previous 19 years
PresentLows <- Present %>%
  left_join(PastLows) %>%  # merge historical lows to current year low data
  mutate(record = ifelse(Temp<Pastlow, "Y", "N")) %>% # identifies if current year was record low
  filter(record == "Y")  # filter for days that represent current year record lows

# create dataframe that represents the highest temp for each day for the historical data
PastHighs <- Past %>%
  group_by(newDay) %>%
  summarise(Pasthigh = max(Temp))  # identify highest temp for each day from 1995-2013

# create dataframe that identifies the days in 2014 in which the temps were higher than all previous 19 years
PresentHighs <- Present %>%
  left_join(PastHighs) %>%  # merge historical highs to current year low data
  mutate(record = ifelse(Temp>Pasthigh, "Y", "N")) %>% # identifies if current year was record high
  filter(record == "Y")  # filter for days that represent current year record highs


# function to turn y-axis labels into degree formatted values
dgr_fmt <- function(x, ...) {
  parse(text = paste(x, "*degree", sep = ""))
}

# create y-axis variable
a <- dgr_fmt(seq(-20,40, by=5))

# create a small dataframe to represent legend symbol for 2014 Temperature
legend_data <- data.frame(x=seq(175,182),y=rnorm(8,15,2))



