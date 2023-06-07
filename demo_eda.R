#### EXPLORATORY DATA ANALYSIS ####
### Box Plots
### Breaking columns into groups to explore the data
makeBPs <- function(cols, angle) {
  dfx <- dfDEMOS[cols] %>% melt()
  dfx %>% ggplot(aes(variable, value, fill = variable)) + geom_boxplot() + theme_classic() + theme(legend.position = "none", axis.text.x = element_text(size = 8, angle=angle, hjust=1)) + xlab('') + ylab('%') 
}


### We see that professionals are the dominant group, despite politicians frequently pitching to the 'tradie vote' 
pro_cols <- c('Managers_pc','Professionals_pc', 'TechiciansTradeWorkers_pc', 'CommunityPersonalServiceWorkers_pc', 'SalesWorkers_pc', 'MachineryOperatorsDrivers_pc', 'Labourers_pc')
makeBPs(pro_cols, 45)

### Likewise, younger voters are the biggest block, but are frequently ignored
age_cols <- c("age0.17pc", "age18.34pc", "age35.49pc", "age50.64pc", "age65.79pc", "age80.pc")
makeBPs(age_cols, 0)

### Nuclear families are the leading group, but not majorly 
### Renters are reoughly level with the two home owner groups
home_cols <- c("Couple.families.without.children_pc", "CoupleFamiliesWithChildren_pc", "OneParentFamilies_pc", "OwnedOutright_pc", "OwnedWithMortgage_pc", "Rented_pc")
makeBPs(home_cols, 45)

### Renters are paying almost as much as mortgagees
money_cols <- c("MedianHouseholdIncomeMonth", "MedianRentMonth", "MedianMortgageRepaymentsMonth")
makeBPs(money_cols, 45)

### Most have finished Year 12; Many people are Not Engaged in work or study
work_cols <- c("FullyEngaged_pc", "PartiallyEngaged_pc", "AtLeastPartiallyEngaged_pc", "NotEngaged_pc", "Year12Completion_pc", "CertificateIIIOrHigherQualification_pc")
makeBPs(work_cols, 45)





### Does Not Engaged mean retired? There is some correlation, but it is not major
makeScatter <- function(xvar, yvar) {
  r <- as.numeric(cor(dfDEMOS[xvar], dfDEMOS[yvar]))
  dfDEMOS %>% ggplot(aes(x = .data[[xvar]], y = .data[[yvar]])) + geom_point(size = 5, alpha = 0.7, color = 'hotpink') + 
    geom_smooth(method='lm') + 
    ggtitle(paste(xvar, ' × ', yvar  , '| Correlation', round(r,4))) +
    theme_classic()
}

dfDEMOS <- dfDEMOS %>% mutate(age65plus = age65.79pc + age80.pc)
makeScatter('NotEngaged_pc', 'age65plus')

## It is more strongly negatively correlated to household income. But since retirees also have lower incomes, this is expected
makeScatter('NotEngaged_pc', 'MedianHouseholdIncomeMonth')

## The negative correlation to rent and mortgages may be more telling...
makeScatter('NotEngaged_pc', 'MedianRentMonth')
makeScatter('NotEngaged_pc', 'MedianMortgageRepaymentsMonth')
# ... as many retirees might be expected to own their own home or have reduced mortgages ...
makeScatter('age65plus', 'OwnedOutright_pc')
makeScatter('age65plus', 'MedianMortgageRepaymentsMonth')
# ... And while many are also shown as having lower rents, which may be due to affordability or downsizing
makeScatter('age65plus', 'MedianRentMonth')
### ... the numbers of older people renting is lower, due to ownership levels seen above
makeScatter('age65plus', 'Rented_pc')

