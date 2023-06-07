

f <- function(state_selected, seattype_selected) {
  
  state_seattype_selected <- paste(state_selected, seattype_selected, sep='_')

  ## Get mean of selected seats
  dfx <- dfMERGE %>% filter(state == state_selected, seat.type == seattype_selected) %>% select(state_seattype_selected, Swing.22) #%>% as.data.frame() 
  mu <- mean(dfx$Swing.22)
  r <- as.numeric(cor(dfMERGE$Swing.22, dfMERGE[state_seattype_selected]))

  dfMERGE %>% ggplot(aes(x = .data[[state_seattype_selected]], Swing.22)) + geom_point() + geom_smooth(method = 'lm')
  #c(mu, r)
}

f('VIC', 'InnerMetro')
f('VIC', 'OuterMetro')
f('WA', 'InnerMetro')
f('WA', 'OuterMetro')
f('WA', 'Rural')



### Make matrix / heatmap for easy visual comparison

makeHM <- function(vn) {
  dfHM <- data.frame()
  for (st in unique(dfMERGE$state_seattype)) {
    s <- unlist(strsplit(st, '_'))
    v <- f(s[1], s[2])
    dfHM[nrow(dfHM)+1, c('state_seattype', 'state', 'seat.type', 'value')] <- c(st, s[1], s[2], v[vn])
  }
  dfHM$value <- as.numeric(dfHM$value)
  d <- c('1' = 'mean', '2' = 'cor')
  ggplot(dfHM, aes(x = seat.type, y = state, fill = value)) +
    geom_tile() + theme_classic() +
    ggtitle(paste('Swing from LNP - ', d[as.character(vn)], ' to national')) + 
    scale_fill_continuous_divergingx(palette = 'RdBu', mid = 0) 
}

### look at mean swing around the country
makeHM(1)

### look at how closely the state_seattype colorates to result
## WA Metor and QLD Metro most aligned to national results
## VIC OuterMetro most unaligned, but the swing was only minor 
makeHM(2)



############# Check corrlation against social factors

makeCORPIE <- function(l) {
  dfx <- dfMERGE[l]
  corrplot(cor(dfx), method = "pie", type="upper") + 
  theme_classic()
}

l <- c("Swing.22", "age0.17pc","age18.34pc", "age35.49pc", "age50.64pc","age65.79pc", "age80.pc")
makeCORPIE(l)

l <- c("Swing.22", 'Managers_pc','Professionals_pc', 'TechiciansTradeWorkers_pc', 'CommunityPersonalServiceWorkers_pc', 'SalesWorkers_pc', 'MachineryOperatorsDrivers_pc', 'Labourers_pc')
makeCORPIE(l)

l <- c("Swing.22", "Couple.families.without.children_pc", "CoupleFamiliesWithChildren_pc", "OneParentFamilies_pc", "OwnedOutright_pc", "OwnedWithMortgage_pc", "Rented_pc")
makeCORPIE(l)

l <- c("Swing.22", "MedianHouseholdIncomeMonth", "MedianRentMonth", "MedianMortgageRepaymentsMonth")
makeCORPIE(l)

l <- c("Swing.22", "FullyEngaged_pc", "PartiallyEngaged_pc", "AtLeastPartiallyEngaged_pc", "NotEngaged_pc", "Year12Completion_pc", "CertificateIIIOrHigherQualification_pc")
makeCORPIE(l)



unique(dfMERGE$seat.type)

l <- c("Swing.22", "SA", "VIC", "NSW", "TAS", "ACT", "QLD", "WA",  "NT")
makeCORPIE(l)

l <- c("Swing.22", "InnerMetro", "OuterMetro", "Provincial", "Rural"  )
makeCORPIE(l)


l <- c("Swing.22", "Decile.1.SA1s" ,"Decile.2.SA1s"  ,"Decile.3.SA1s", "Decile.4.SA1s"  ,"Decile.5.SA1s" , "Decile.6.SA1s" , "Decile.7.SA1s", "Decile.8.SA1s", "Decile.9.SA1s", "Decile.10.SA1s")
makeCORPIE(l)

l <- c("Swing.22", "richSA1s", "poorSA1s","midSA1s")
makeCORPIE(l)

l <- c("Swing.22", "WA", "richSA1s", "MedianHouseholdIncomeMonth", "MedianRentMonth", "MedianMortgageRepaymentsMonth",  'Professionals_pc',  "InnerMetro", "age35.49pc")
makeCORPIE(l)
 
l <- c("Swing.22", "OneParentFamilies_pc", "NotEngaged_pc",  "poorSA1s", 'Labourers_pc', 'MachineryOperatorsDrivers_pc',  "Rural")
makeCORPIE(l)

l <- c("Swing.22", 'TechiciansTradeWorkers_pc', 'Labourers_pc', 'MachineryOperatorsDrivers_pc', "MedianHouseholdIncomeMonth")
makeCORPIE(l)


## This illustrates further the more well off the seat, the greater the swing to Labor
dfMERGE %>% ggplot(aes(x = .data[['poorSA1s']], Swing.22)) + geom_point() + geom_smooth(method = 'lm') + theme_classic()

