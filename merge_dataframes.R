dfMERGE <- dfTPPCOMPARE %>% inner_join(dfCED %>% inner_join(dfSA1, by = 'seat'), by = 'seat')


### Make dummy variables for linear regression

dfMERGE['LNP_19'] <- ifelse(dfMERGE$PartyAb.19 == 'LNP',1, 0)

states <- unique(dfMERGE$state)
for (state in states) {
  dfMERGE[state] <- ifelse(dfMERGE$state == state,1, 0)
}

seattypes <- unique(dfMERGE$seat.type)
for (seattype in seattypes) {
  dfMERGE[seattype] <- ifelse(dfMERGE$seat.type == seattype,1, 0)
}

### Safeness is based on pre-vote
safenesses <- unique(dfMERGE$safeness.19)
for (safeness in safenesses) {
  dfMERGE[safeness] <- ifelse(dfMERGE$safeness.19 == safeness,1, 0)
}

dfMERGE['state_seattype'] <- paste(dfMERGE$state, dfMERGE$seat.type, sep = '_') 
stateseattypes <- unique(dfMERGE$state_seattype)
for (stateseattype in stateseattypes) {
  dfMERGE[stateseattype] <- ifelse(dfMERGE$state_seattype == stateseattype,1, 0)
}


## Convert number columns from chars 
numeric_cols <- colnames(dfMERGE)[28:length(colnames(dfMERGE))]
for (col in numeric_cols) {
  print(col)
  dfMERGE[col] <- dfMERGE[col] %>% unlist %>% as.numeric()
}

occupation_cols <- list()
for (cn in colnames(dfMERGE)) {
  if (grepl('Occupation', cn, fixed = TRUE)) {
    occupation_cols <- append(occupation_cols, cn)
  }
}
occupation_cols <- unlist(occupation_cols)
occupation_cols

parents_cols <- list()
for (cn in colnames(dfMERGE)) {
  if (grepl('birth', cn, fixed = TRUE)) {
    if (!grepl('Not.stated', cn, fixed = TRUE)) {
      parents_cols <- append(parents_cols, cn)
    }
  }
}
parents_cols <- unlist(parents_cols)
parents_cols

age_cols <- c("Age..0.4.years..","Age..5.9.years..","Age..10.14.years..","Age..15.19.years..","Age..20.24.years..","Age..25.29.years..","Age..30.34.years..", "Age..35.39.years..","Age..40.44.years..","Age..45.49.years..","Age..50.54.years..","Age..55.59.years..","Age..60.64.years..","Age..65.69.years..", "Age..70.74.years.." ,"Age..75.79.years..","Age..80.84.years..","Age..85.years.and.over..")

dim(dfMERGE)

