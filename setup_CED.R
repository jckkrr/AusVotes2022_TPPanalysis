dfCED <- read.csv('commonwealth_seats_data_WIDE.csv')
dfCED <- dfCED %>% select_if(~ !any(is.na(.)))
head(dfCED)
dim(dfCED)

census_col <- colnames(dfCED)[3:length(colnames(dfCED))]
census_col

pairs(dfCED[colnames(dfCED)[3:10]])

hist(dfCED$People..Female.., breaks = 6)

hist(dfCED[, c(40:44)], breaks = 6)

describe(dfCED[, c(1:10)])

