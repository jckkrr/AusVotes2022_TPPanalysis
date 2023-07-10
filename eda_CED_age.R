### See which voting age groupd (20+) is the dominant in their electorate

voting_age_cols <- age_cols[5:length(age_cols)]
dfAGE <- dfMERGE[c(c('seat'), voting_age_cols)]
dfAGE$top_group <- voting_age_cols[apply(dfAGE[voting_age_cols],1,which.max)]

dfAGE$top_group <- str_replace_all(dfAGE$top_group, 'Age..', '')
dfAGE$top_group <- str_replace_all(dfAGE$top_group, '.years', 'yrs')
dfAGE$top_group <- str_replace_all(dfAGE$top_group, '\\.\\.', '')
dfAGE$top_group <- str_replace_all(dfAGE$top_group, '\\.', '-')

dfAGE %>% 
  ggplot(aes(top_group)) +
  geom_bar(aes(y = (..count..)/sum(..count..)), fill='goldenrod') +
  ggtitle('Dominant voting age block in each electorate') + xlab('') + ylab('proportion of seats') +
  #theme(axis.ticks.x=element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), axis.ticks.y=element_blank()) +
  theme(text=element_text(size=12, family="Manrope-ExtraLight", color='black')) +
  theme(plot.title = element_text(size=14)) +
  theme(axis.title=element_text(size=12))

dfAGE %>% filter(top_group == 'seat')

