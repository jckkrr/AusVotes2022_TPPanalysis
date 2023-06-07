### DEMOGRAPHIC DATA

### This data frame contains demographic data per seat. 
### It should not be confused with the AEC demographic data, which refers to seat type

dfDEMOS <- read.csv('seat_demos.csv')
dim(dfDEMOS)

## Update rent and pay to to be monthly, as per mortgage payments
dfDEMOS <- dfDEMOS %>% mutate(MedianRentMonth = MedianRentWeek * 4.34, MedianHouseholdIncomeMonth = MedianHouseholdIncomeWeek * 4.34)
names(dfDEMOS)

### Clean up column names, which have imported badly. 
colnames(dfDEMOS) <- str_replace(colnames(dfDEMOS), 'X', 'age')
colnames(dfDEMOS) <- str_replace(colnames(dfDEMOS), 'State', 'state')

### Reduce columns to essential ones
selected_cols <- to_list(for (cn in colnames(dfDEMOS)) if (str_detect(cn, 'Seat|State|population|pc|Month')) c(cn))
dfDEMOS <- dfDEMOS[unlist(selected_cols)]
dim(dfDEMOS)

describe(dfDEMOS)



