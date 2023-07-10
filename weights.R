## Get data frame showing slope, p-value and r.squared value for each of the factors with the highest correlation 

corDF <- function(chosen_cols) {
  dfR <- data.frame()
  for (c in chosen_cols) {
    nr <- nrow(dfR) + 1
    r <- cor(dfMERGE$Swing.22, dfMERGE[c])
    dfR[nr, c('c', 'r')] <- c(c, cor(dfMERGE$Swing.22, dfMERGE[c]))
  }
  dfR$r <- as.numeric(dfR$r)
  dfR <- dfR %>% filter(abs(r) > 0.3) %>% arrange(r)
  dfR
}
dfLM <- corDF(numeric_cols)

getS <- function(xcol) {
  fit <- lm(unlist(dfMERGE['Swing.22']) ~ unlist(dfMERGE[xcol]))
  s <- summary(fit)
  c(s$coef[2, 'Estimate'], s$coef[2, 'Pr(>|t|)'], s$r.squared)
}
dfLM <- dfLM %>% mutate(slope = sapply(c, getS)[1, ], pval = sapply(c, getS)[2, ], rsq = sapply(c, getS)[3, ])

dfLM <- dfLM %>% arrange(desc(rsq))
dfLM


xcol1 <- 'Highest.educational.level..Year.9.or.below..'
xcol2 <- 'Country.of.birth.of.parents..Mother.only.born.overseas..'
xcol3 <- 'Family.composition..One.parent.family..'
xcol4 <- 'Unpaid.domestic.work..number.of.hours..Less.than.5.hours..'
xcol5 <- 'LNPpc.19'
xcol6 <- 'LNP_19'

fit <- lm(unlist(dfMERGE['Swing.22']) ~ unlist(dfMERGE[xcol1]) + unlist(dfMERGE[xcol2]) + unlist(dfMERGE[xcol5]) + unlist(dfMERGE[xcol6]))
s <- summary(fit)
s
