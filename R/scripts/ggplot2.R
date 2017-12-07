library(ggplot2); library(data.table); library(dplyr)

daq <- read.csv("yields_by_INSP.csv")
daq <- data.table(daq)
leach144 <- daq[AcidTime == 144,]
leach192 <- daq[AcidTime == 192,]
leach336 <- daq[AcidTime == 336,]

leach144 <- leach144[Customer == "BAKER HUGHES COMPANY" | 
                             Customer == "HALLIBURTON ENERGY SERVICES" ]
qplot(Week, leachyield, data = leach144, facets = . ~ Customer)
qplot(Week, leachyield, data = leach144, color = Customer)

HC <- daq[Week == 45 | Week == 46 | Week == 47 ,]
HC <- HC[Customer == "BAKER HUGHES COMPANY", ]

#histograms
qplot(leachyield, data = HC, facets = Customer ~ ., binwidth = 0.1, 
      main = "HC Leach Yields")
hist(HC$leachyield, col = "green", freq = FALSE)
geom_density()

leach144 %>%
        filter(!is.na(leachyield)) %>%
        group_by(Customer) %>%
        summarise_each(funs(mean), leachyield, totalyield)