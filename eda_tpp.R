hist(dfTPPCOMPARE$enrolment, breaks = 10)
hist(dfTPPCOMPARE$turnout_pc, breaks = 10)
hist(dfTPPCOMPARE$informal_pc, breaks = 10)
hist(dfTPPCOMPARE$informal_swg, breaks = 10)

dfTPPCOMPARE %>% ggplot(aes(enrolment, Swing.22, color = PartyAb.22)) + geom_point()
dfTPPCOMPARE %>% ggplot(aes(turnout_pc, Swing.22, color = PartyAb.22)) + geom_point()
dfTPPCOMPARE %>% ggplot(aes(informal_pc, Swing.22, color = PartyAb.22)) + geom_point()
dfTPPCOMPARE %>% ggplot(aes(informal_swg, Swing.22, color = PartyAb.22)) + geom_point()
