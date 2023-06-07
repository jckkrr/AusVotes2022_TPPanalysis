
makeMatrix <- function(seat_col, columns_group) {
  
  dfSEATDEMOMATRIX <- data.frame()
  
  ordered_seats <- dfMERGE %>% group_by_at(seat_col) %>% summarise(amount = median(Swing.22)) %>% arrange(desc(amount)) %>% pull(seat_col) #dfMERGE[order(dfTPPCOMPARE[order_seats_by], decreasing = TRUE),] %>% pull(seat_col) %>% unlist()
  
  ordered_value_types <- dfMERGE[columns_group] %>% colSums() %>% as.data.frame() %>% rename(amount = '.') %>% arrange(amount) %>% rownames()
  
  for (seat_selected in ordered_seats) {
    
    print(seat_selected)
  
    for (value_type in ordered_value_types) {
      nr <- nrow(dfSEATDEMOMATRIX)+1
      value <- dfMERGE[dfMERGE[seat_col] == seat_selected, value_type]
      
      ### For when you are looking at groups of seats, the median is returned
      if (length(value) > 1) {value <- median(value)}       
      
      dfSEATDEMOMATRIX[nr, 'seat'] = seat_selected
      dfSEATDEMOMATRIX[nr, 'work_type'] = value_type
      dfSEATDEMOMATRIX[nr, 'value'] = value
    }
  }
  
  ggplot(dfSEATDEMOMATRIX, aes(x = fct_inorder(seat), y = fct_inorder(work_type), fill = value)) +
    geom_tile() + theme_classic() +
    scale_fill_continuous_divergingx(palette = 'PRGn', mid = 0) + scale_color_hue(direction = -1) +
    theme(axis.text.x = element_text(angle = 90,hjust=1, vjust = 0.5), axis.ticks.x=element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), axis.ticks.y=element_blank(), text=element_text(size=10,  family="Inter", color='black'), plot.title = element_text(size=14, family="Inter", face="bold"), axis.title=element_text(size=8)) +
    ggtitle('AusVotes 2022 | Demographic overview | median per (%) ') +  
    xlab('swing to ALP >>>') + ylab('more people in group >>>') 

}

makeMatrix('state', pro_cols)
makeMatrix('seat.type', pro_cols)
makeMatrix('state_seattype', pro_cols)
makeMatrix('safeness.19', pro_cols)
makeMatrix('safeness.22', pro_cols)

makeMatrix('state_seattype', age_cols)
makeMatrix('seat.type', age_cols)
makeMatrix('state_seattype', home_cols)
makeMatrix('state_seattype', work_cols)
makeMatrix('state_seattype', money_cols)
makeMatrix('seat.type', money_cols)
makeMatrix('state_seattype', money_cols[1])

                           
