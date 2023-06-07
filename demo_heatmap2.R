makeMatrix <- function(seat_col, columns_group) {
  
  dfSEATDEMOMATRIX <- data.frame()
  
  ordered_seats <- dfMERGE %>% group_by_at(seat_col) %>% summarise(amount = median(Swing.22)) %>% arrange(desc(amount)) %>% pull(seat_col)
  ordered_value_types <- columns_group
  
  for (seat_selected in ordered_seats) {
    
    print(seat_selected)
    
    for (value_type in ordered_value_types) {
      nr <- nrow(dfSEATDEMOMATRIX)+1
      value <- dfMERGE[dfMERGE[seat_col] == seat_selected, value_type]
    
      dfSEATDEMOMATRIX[nr, 'seat'] = seat_selected
      dfSEATDEMOMATRIX[nr, 'value_type'] = value_type  
      dfSEATDEMOMATRIX[nr, 'value'] = value 
      
      print(paste(seat_selected, value_type, value))
      
    }
  }
  
  ggplot(dfSEATDEMOMATRIX, aes(x = fct_inorder(seat), y = fct_inorder(value_type), fill = value)) +
    geom_tile() + theme_classic() +
    scale_fill_continuous_divergingx(palette = 'PRGn', mid = 0) +
    theme(axis.text.x = element_text(angle = 90,hjust=1, vjust = 0.5), axis.ticks.x=element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), axis.ticks.y=element_blank(), text=element_text(size=10,  family="Inter", color='black'), plot.title = element_text(size=14, family="Inter", face="bold"), axis.title=element_text(size=6)) +
    ggtitle('AusVotes 2022, TPP vs SA1') + 
    xlab('swing to ALP >>>') + ylab('')
  
}

decile_cols <- c("poorSA1s_pc", "richSA1s_pc")
makeMatrix('Seat', decile_cols)

decile_cols <- c("Decile.1.SA1s","Decile.10.SA1s")
makeMatrix('Seat', decile_cols)
