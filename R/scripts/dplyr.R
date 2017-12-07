
library(dplyr)
library(hflights)

data(hflights)
head(hflights)
flights <- tbl_df(hflights)
flights

#dplyr approach
filter(flights, Month==1 & DayofMonth==1)
select(flights, DepTime, ArrTime, FlightNum)

flights %>%
        select(UniqueCarrier, DepDelay) %>%
        filter(DepDelay > 60)
x1 <- 1:5
x2 <- 2:6
(x1-x2)^2 %>% sum() %>% sqrt()
sqrt(sum((x1-x2)^2))

flights %>%
        group_by(UniqueCarrier) %>%
        summarise_each(funs(mean), Cancelled, Diverted)
