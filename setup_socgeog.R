file <- 'Commonwealth Electoral Division, SA1 Distributions, SEIFA 2021.xlsx'
dfSA1 <- read_excel(file, sheet = 2, skip = 5)
dfSA1 <- data.frame(dfSA1)
dfSA1 <- dfSA1 %>% rename(SeatID = X2021.Commonwealth.Electoral.Division...CED..Code, seat = X2021.Commonwealth.Electoral.Division..CED..Name)
dfSA1 <- dfSA1 %>% select(names(dfSA1)[names(dfSA1) != '...3'])
dfSA1 <- dfSA1 %>% filter(!str_detect(Seat, 'No usual address')) %>% filter(!str_detect(Seat, 'Migratory - Offshore - Shipping')) 

for (col in decile_cols) {
  dfSA1[col] <- as.numeric(unlist(dfSA1[col]))
}
  
names(dfSA1)

dfSA1 <- dfSA1 %>% mutate(richSA1s = (Decile.8.SA1s + Decile.9.SA1s + Decile.10.SA1s))
dfSA1 <- dfSA1 %>% mutate(richSA1s_pc = round(richSA1s/Number.of.SA1s.with.a.SEIFA.score * 100, 2))

dfSA1 <- dfSA1 %>% mutate(poorSA1s = (Decile.1.SA1s + Decile.2.SA1s + Decile.3.SA1s))
dfSA1 <- dfSA1 %>% mutate(poorSA1s_pc = round(poorSA1s/Number.of.SA1s.with.a.SEIFA.score * 100, 2))

dfSA1 <- dfSA1 %>% mutate(midSA1s = (Decile.4.SA1s + Decile.5.SA1s + Decile.6.SA1s + Decile.7.SA1s))
dfSA1 <- dfSA1 %>% mutate(midSA1s_pc = round(midSA1s/Number.of.SA1s.with.a.SEIFA.score * 100, 2))

