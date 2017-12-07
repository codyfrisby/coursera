
library(dplyr); library(data.table)
daq <- read.csv("C:/Users/cfrisby/Documents/yields_by_INSP.csv")
daq <- data.table(daq)
leach144 <- daq[AcidTime == 144,]

leach144 <- leach144[Customer == "BAKER HUGHES COMPANY" | 
                             Customer == "HALLIBURTON ENERGY SERVICES" ]
qplot(Week, leachyield, data = leach144, facets = . ~ Customer)

leach144 %>%
        filter(!is.na(leachyield)) %>%
        group_by(Customer) %>%
        summarise_each(funs(mean), leachyield, totalyield)