graph <- function(z){
        yz <- dat[Name == z]
        qplot(year, Occurence, data = yz, color = Sex,
              main = z)
}