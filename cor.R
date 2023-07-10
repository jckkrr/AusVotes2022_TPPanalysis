############# Check correlation against social factors
corDF <- function(chosen_cols) {
  dfR <- data.frame()
  for (c in chosen_cols) {
    nr <- nrow(dfR) + 1
    r <- cor(dfMERGE$Swing.22, dfMERGE[c])
    dfR[nr, c('c', 'r')] <- c(c, cor(dfMERGE$Swing.22, dfMERGE[c]))
  }
  dfR$r <- as.numeric(dfR$r)
  dfR <- dfR %>% filter(abs(r) > 0.1 ) %>% arrange(r)
  dfR
}
corDF(census_col)

corDF(numeric_cols)

cor(dfMERGE$Swing.22, dfMERGE['informal_swg'])
cor(dfMERGE$Swing.22, dfMERGE['informal_pc'])
cor(dfMERGE$Swing.22, dfMERGE['turnout_pc'])
cor(dfMERGE$Swing.22, dfMERGE['enrolment'])

numeric_cols


##### 

makeCORPLOT <- function(chosen_cols) {
  swing_cols <- c("Swing.22", "poorSA1s_pc", "richSA1s_pc" ) #, "midSA1s_pc",
  l <- c(swing_cols, chosen_cols)
  dfx <- dfMERGE[l]
  corrplot(cor(dfx)[1:3, 4:length(l), drop=FALSE], 
  #corrplot(cor(dfx)[1, 2:length(l), drop=FALSE], 
           method = "color", addCoef.col = 'black', number.cex=0.85, 
           cl.pos='n', 
           tl.cex=0.6, tl.col='black', tl.srt = 90,
  ) + 
    theme_classic() +
    theme(element_text(size=24, family="Manrope-ExtraLight", face="bold"))
}

get_ordered_cols <- function(chosen_cols) {
  dfR <- data.frame()
  for (c in chosen_cols) {
    nr <- nrow(dfR) + 1
    r <- cor(dfMERGE$Swing.22, dfMERGE[c])
    dfR[nr, c('c', 'r')] <- c(c, cor(dfMERGE$Swing.22, dfMERGE[c]))
  }
  dfR$r <- as.numeric(dfR$r)
  dfR <- dfR %>% filter(abs(r) >= 0.38) %>% arrange(r) %>% pull(c)
  #dfR <- dfR %>% arrange(r) %>% pull(c)
  dfR
}

all_ordered <- get_ordered_cols(census_col[!(census_col %in% c("Tenure.type.OPD..Tenure.type.not.stated.."))])
makeCORPLOT(all_ordered)

makeCORPLOT(get_ordered_cols(parents_cols))


### 

makeCORPLOT2 <- function(chosen_cols, remove_text) {
  swing_cols <- c("Swing.22")
  l <- c(swing_cols, chosen_cols)
  dfx <- dfMERGE[l]
  
  colnames(dfx) <- str_replace_all(colnames(dfx), remove_text, '')

  corrplot(cor(dfx)[1, 2:length(l), drop=FALSE], 
           method = "color", addCoef.col = 'black', number.cex=0.85, 
           cl.pos='n', 
           tl.cex=0.8, tl.col='black', tl.srt = 90,
  ) + 
    theme_classic() +
    theme(element_text(size=24, family="Manrope-ExtraLight", face="bold"))
  
}
makeCORPLOT2(get_ordered_cols(occupation_cols), 'Occupation.Employed.people..')

### AGE 
makeCORPLOT(age_cols[5:18])
makeCORPLOT(get_ordered_cols(age_cols))




