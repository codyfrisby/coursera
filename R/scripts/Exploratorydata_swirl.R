# Exploratory Graphs Swirl Lesson
#store the variable of interest as a variable for ease of use.
summary(x) #info about your variable
quantile(x) #another way of infor of your var.
boxplot(x, col="blue") #color argument included 
abline() #add strait line to the current plot
hist(x, col="green") #histogram of data with color green.
rug(x) # adds details to histogram plot.  Each tick mark is a datum.
hist(x, col="green", breaks=100) #adds breaks to histogram plot.  affects bin size.
abline(v= , lwd= ) #add vertical line and lwd is line width.
abline(v = median(x), col = "magenta", lwd = 4)
var <- table(x)
barplot(x, col = "wheat", main ="title")
boxplot(y1~y2, data = x, col = "red") #like saying plot y1 by y2.
par(mfrow=c(2,1)#plot window set up with 2 rows and 1 column 
    ,mar=c(4,4,2,1))#sets up the plot window to allow multiple graphs in one window.
        #a 4-long vector indicated number of lines for the bottom, left, top and right.
#subset the data and store it in a variable.
hist(x, col = "green") #places this plot in the top position.
hist(subset(pollution, region == "west")$pm25, col = "green") #places the next plot below.
with(data, plot(x, y, ...))
abline(h= , lty= , lwd= )
plot(data$x, data$y, col=data$factor)
par(mfrow=c(1,2), mar=c(5,4,2,1))

text(x, y, "what you want to put there")
xyplot(x, data, layout = c(,))

