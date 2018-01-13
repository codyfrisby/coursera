df <- data.frame(t)
df$x <- rstandard(m)

library(ggplot2)
## Basic histogram. Each bin is .5 wide.
## These both result in the same output:
ggplot(df, aes(x=x)) + geom_histogram(binwidth = 0.5)
qplot(df$x, binwidth = 0.5)

# Draw with black outline, white fill
ggplot(df, aes(x=x)) + geom_histogram(binwidth = 0.5, 
                                      colour = "black", fill = "white")

# Density curve
ggplot(df, aes(x=x)) + geom_density()

# Histogram overlaid with kernel density curve
ggplot(df, aes(x=x)) + 
  geom_histogram(aes(y=..density..), # Histogram with density instead of count on y-axis
                 binwidth=0.7,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666")  # Overlay with transparent density plot



#or

x <- rstandard(m)
qplot(x, geom = "blank") +
  geom_histogram(aes(y = ..density..), binwidth = 0.75) +
  stat_density(geom = "line", aes(colour = "black")) +
  scale_color_manual(name = "", values = c("red", "green"),
                     breaks = c("bla", "blabla"),
                     labels = c("kernel_est", "norm_curv"))
# +  opts(legeng.position = "bottom", legend.direction = "horizontal")
#above line doesn't work

    #  bins = 3, xlab = "Standard Residuals", 
    #  main = "Histogram of Standard Residuals", fill = I("light blue"), 
    #  colour = I("black"))

gg <- ggplot(df, aes(x=Standard.Residuals))
gg <- gg + geom_histogram(binwidth=0.75, colour="black", 
                          aes(y=..density.., fill=..count..))
gg <- gg + scale_fill_gradient("Count", low="#DCDCDC", high="#7C7C7C")
gg <- gg + stat_function(fun=dnorm, color="red",
                         arg = list(mean = mean(df$Standard.Residuals), 
                                    sd = sd(df$Standard.Residuals)))

gg