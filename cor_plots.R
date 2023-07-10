### Correlation Plots

## Orders the columns so they are in order of most correlated positive to negative
### The cutoff lets you discard columns with criteria below your selected threshold
get_ordered_cols <- function(chosen_cols, cutoff) {
  dfR <- data.frame()
  for (c in chosen_cols) {
    nr <- nrow(dfR) + 1
    r <- cor(dfMERGE$Swing.22, dfMERGE[c])
    dfR[nr, c('c', 'r')] <- c(c, cor(dfMERGE$Swing.22, dfMERGE[c]))
  }
  dfR$r <- as.numeric(dfR$r)
  dfR <- dfR %>% filter(abs(r) >= cutoff) %>% arrange(r) %>% pull(c)
  dfR
}

### This version shortens the names of columns disaplyed

makeCORPLOT_shortencolnames <- function(chosen_cols, remove_text) {
  
  swing_cols <- c('Swing.22', 'poorSA1s_pc', 'richSA1s_pc')
  l <- c(swing_cols, chosen_cols)
  dfx <- dfMERGE[l]
  
  n <- length(swing_cols)
  print(n+1)
  
  colnames(dfx) <- str_replace_all(colnames(dfx), remove_text, '')

  corrplot(cor(dfx)[1:n, (n+1):length(l), drop=FALSE], 
           method = "color", addCoef.col = 'black', number.cex=0.66, 
           cl.pos='n', 
           tl.cex=0.5, tl.col='black', tl.srt = 90,
  ) + 
    theme_classic() +
    theme(element_text(size=24, family="Manrope-ExtraLight", face="bold"))
  
}

makeCORPLOT_shortencolnames(get_ordered_cols(occupation_cols, 0.1), 'Occupation.Employed.people..')

makeCORPLOT_shortencolnames(age_cols[5:18], 'xxx')
makeCORPLOT_shortencolnames(get_ordered_cols(voting_age_cols, 0), 'xxx')

makeCORPLOT_shortencolnames(get_ordered_cols(numeric_cols, 0.4), 'Occupation.Employed.people..')

makeCORPLOT_shortencolnames(get_ordered_cols(parents_cols, 0), 'xxx')

makeCORPLOT_shortencolnames(get_ordered_cols(census_col, 0.35), 'xxx')

dfMERGE$poorSA1s_pc


##### Original version

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



all_ordered <- get_ordered_cols(census_col[!(census_col %in% c("Tenure.type.OPD..Tenure.type.not.stated.."))],0.38)
makeCORPLOT(all_ordered)

makeCORPLOT(get_ordered_cols(parents_cols,0.38))
