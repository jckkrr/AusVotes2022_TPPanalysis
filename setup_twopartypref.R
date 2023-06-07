### TWO-PARTY PREFFERED 

### Functions
### As well as getting results for the 2022 election, it is also neceassary to get those from 2019, in order to make comparisons. 
### Therefore preparatory work is carried out by reusable functions. 

get_tpp_df <- function(yyyy) {
  yy <- str_sub(yyyy,-2,-1)
  csv_download_address <- paste('aec_downloads/', yyyy, ' Federal Election House of Representatives Two Party Preferred By Division.csv', sep='')
  dfTPP <- read.csv(csv_download_address, skip = 1)
  dfTPP <- dfTPP %>% rename(seat = DivisionNm, state = StateAb, LNP = Liberal.National.Coalition.Votes, LNPpc = Liberal.National.Coalition.Percentage, ALP = Australian.Labor.Party.Votes, ALPpc = Australian.Labor.Party.Percentage)

  ### Add / recalculate winning party
  updatePartyAb <- function(LNP, ALP) {
    if (LNP > ALP) {val <- 'LNP'} else if (LNP < ALP) {val <- 'ALP'}
    val
  }
  dfTPP <- dfTPP %>% mutate(PartyAb = mapply(updatePartyAb, dfTPP$LNP, dfTPP$ALP))
  
  ### How safe is the seat following election?
  dfTPP$safeness <- "NONE"
  dfTPP$safeness[dfTPP$ALPpc > 50 ] <- "marginalALP"
  dfTPP$safeness[dfTPP$ALPpc > 56 ] <- "safeALP"
  dfTPP$safeness[dfTPP$ALPpc > 60 ] <- "verysafeALP"
  dfTPP$safeness[dfTPP$ALPpc < 50 ] <- "marginalLNP"
  dfTPP$safeness[dfTPP$ALPpc < 44 ] <- "safeLNP"
  dfTPP$safeness[dfTPP$ALPpc < 40 ] <- "verysafeLNP"
  
  ### Update column names to have year (yy) as suffix. Exceptions made for two columns which will be used to join the dataframes
  ### yy is added to seat, as seats can change name. DivisionID is a better column to use for comparing seats 
  colnames(dfTPP) <- to_list(for (cn in colnames(dfTPP)) ifelse (!cn %in% c('DivisionID', 'state'), c(paste(cn, yy, sep='.')), c(cn) ))
  
  dfTPP
}

dfTPP19 = get_tpp_df('2019')
dfTPP22 = get_tpp_df('2022')

### Check for differences in seats/divisions
missing_from_19 <- setdiff(dfTPP22$DivisionID, dfTPP19$DivisionID)
missing_from_19

missing_from_22 <- setdiff(dfTPP19$DivisionID, dfTPP22$DivisionID)
missing_from_22

### Join the two dataframes in order to check for changing seats
### For simpilicity, the missing seats are not included 
#dfTPPCOMPARE <- dfTPP22 %>% merge(dfTPP19, by = c('DivisionID', 'state'), all = TRUE)
dfTPPCOMPARE <- dfTPP22 %>% inner_join(dfTPP19, by = c('DivisionID', 'state'))

dfTPPCOMPARE <- dfTPPCOMPARE %>% mutate(TPP.swap = ifelse(PartyAb.22 != PartyAb.19, paste(PartyAb.22, 'gain'), '--'))
dfTPPCOMPARE <- dfTPPCOMPARE %>% mutate(ALP.gain = ifelse(PartyAb.22 != PartyAb.19 & PartyAb.22 == 'ALP', 1, 0))
dfTPPCOMPARE <- dfTPPCOMPARE %>% mutate(ALP.loss = ifelse(PartyAb.22 != PartyAb.19 & PartyAb.22 == 'LNP', 1, 0))

dfTPPCOMPARE <- dfTPPCOMPARE %>% mutate(ALP.change = ALP.22 - ALP.19)
dfTPPCOMPARE <- dfTPPCOMPARE %>% mutate(ALP.change.ppt = ALPpc.22 - ALPpc.19)

### Now to add seat type (eg 'Inner Metro' or 'Regional') to data.frame
dfSEATTYPE <- read.csv('aec_downloads/Seat demographic type.csv') 
dfSEATTYPE <- dfSEATTYPE %>% subset(select = -c(State.or.territory)) %>% rename(seat.22 = Electoral.division, seat.type = Demographic.classification)
dfSEATTYPE$seat.type <- str_replace(dfSEATTYPE$seat.type, ' ', '')
dfSEATTYPE$seat.type <- str_replace(dfSEATTYPE$seat.type, 'Metropolitan', 'Metro')
head(dfSEATTYPE)

dfTPPCOMPARE <- dfTPPCOMPARE %>% inner_join(dfSEATTYPE) %>% rename(Seat = seat.22)  ### Renaming Seat to make it easier to join with social data
dim(dfTPPCOMPARE)

