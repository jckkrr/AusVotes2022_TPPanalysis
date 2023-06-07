
### Brings the three main dataframes together using relational algebra, and then clean up and add dummy variables for linear regression 

dfMERGE <-dfTPPCOMPARE %>% inner_join((dfDEMOS %>% inner_join(dfSA1, by = 'Seat')), by = 'Seat')
dim(dfMERGE)
names(dfMERGE)

### Make dummy variables for linear regression
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


##############




dfx <- dfMERGE %>% select(Swing.22, X0.17pc,  X18.34pc, X35.49pc, X50.64pc, X65.79pc, X80.pc)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, Managers_pc, Professionals_pc,TechiciansTradeWorkers_pc, CommunityPersonalServiceWorkers_pc,ClericalAdministrativeWorkers_pc....,SalesWorkers_pc, MachineryOperatorsDrivers_pc, Labourers_pc)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, Couple.families.without.children_pc, CoupleFamiliesWithChildren_pc, OneParentFamilies_pc, OwnedOutright_pc, OwnedWithMortgage_pc, Rented_pc, FullyEngaged_pc, PartiallyEngaged_pc, AtLeastPartiallyEngaged_pc, NotEngaged_pc, Year12Completion_pc, CertificateIIIOrHigherQualification_pc)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, MedianHouseholdIncomeWeek, MedianRentWeek, MedianMortgageRepaymentsMonth)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, SA, VIC, NSW, TAS, ACT, QLD, WA, NT)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, InnerMetro, OuterMetro, Provincial, Rural)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, safeALP, verysafeLNP, verysafeALP, safeLNP, marginalLNP, marginalALP)
corrplot(cor(dfx), method = "pie", type="upper")

dfx <- dfMERGE %>% select(Swing.22, SA_InnerMetro,VIC_OuterMetro,VIC_Provincial,NSW_InnerMetro,SA_Rural,TAS_Provincial,ACT_InnerMetro,NSW_OuterMetro,QLD_Provincial,QLD_OuterMetro,SA_OuterMetro,TAS_Rural,WA_OuterMetro,QLD_InnerMetro,NSW_Rural,VIC_Rural,VIC_InnerMetro,TAS_InnerMetro,NSW_Provincial,WA_InnerMetro,QLD_Rural,WA_Rural,TAS_OuterMetro,NT_Rural,NT_InnerMetro)
corrplot(cor(dfx), method = "pie", type="upper")

