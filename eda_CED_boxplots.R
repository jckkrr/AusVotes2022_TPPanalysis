makeBPs <- function(cols) {
  dfM <- melt(dfCED[cols]) 
  
  ### For age columns
  dfM$variable <- gsub('Age..', '', dfM$variable)
  dfM$variable <- gsub('.years.and.over..', '+', dfM$variable)
  dfM$variable <- gsub('.years..', ' yrs', dfM$variable)
  
  ### For occupation columns
  dfM$variable <- gsub('Occupation.Employed.people..', '', dfM$variable)
  dfM$variable <- gsub('.and.', '/', dfM$variable)
  dfM$variable <- gsub('Workers..', '', dfM$variable)
  dfM$variable <- gsub('\\.\\.', '.', dfM$variable)
  dfM$variable <- gsub('\\.', ' ', dfM$variable)
  
  dfM %>% ggplot(aes(fct_inorder(variable), value, fill = variable)) + 
    geom_boxplot(show.legend = FALSE) +
    xlab('') + ylab('')
}
makeBPs(age_cols)
makeBPs(occupation_cols)
