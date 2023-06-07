
dfTPP22 %>% arrange(desc(ALPpc.22)) %>% 
  ggplot(aes(fct_inorder(seat.22), ALPpc.22, fill = PartyAb.22)) + 
  geom_bar(stat='identity') +
  theme_classic()


dfTPPCOMPARE %>% mutate(vicnsw = ifelse(state %in% c('NSW', 'VIC'), 'NSW/VIC', 'OTHER')) %>%
  ggplot(aes(ALPpc.22, ALPpc.19, color = TPP.swap)) +
  geom_point(size = 5, alpha = 0.5) + 
  theme(text=element_text(size=10,  family="Inter", color='black'), plot.title = element_text(size=12, family="Inter", face="bold"), axis.title=element_text(size=8)) +
  ggtitle('AusVotes22 | Shifting seats') +
  facet_wrap(~vicnsw) +
  theme_classic()


dfTPPCOMPARE %>% mutate(vicnsw = ifelse(state %in% c('NSW', 'VIC'), 'NSW/VIC', 'OTHER')) %>%
  ggplot(aes(ALPpc.19, Swing.22, color = TPP.swap)) +
  geom_point(size = 5, alpha = 0.5) +   
  theme_classic() + 
  theme(text=element_text(size=8,  family="Inter", color='black'), plot.title = element_text(size = 12, face="bold")) +
  ggtitle('AusVotes22 | Shifting seats') +
  facet_wrap(~vicnsw) + 
  geom_hline(yintercept=0, linetype="dashed", color = "#3f3f3f") +
  geom_vline(xintercept=50, linetype="dashed", color = "#3f3f3f") + 
  scale_color_manual(values = c("grey",  "red")) 

