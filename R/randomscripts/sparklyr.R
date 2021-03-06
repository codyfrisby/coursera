### Sparkly within Rstudio
library(sparklyr)
library(dplyr)
library(ggplot2)

sc <- spark_connect("local")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars", overwrite = TRUE)
# transform our data set, and then partition into 'training', 'test'
partitions <- mtcars_tbl %>%
  filter(hp >= 100) %>%
  sdf_mutate(cyl8 = ft_bucketizer(cyl, c(0,8,12))) %>%
  sdf_partition(training = 0.5, test = 0.5, seed = 888)

# fit a linear mdoel to the training dataset
fit <- partitions$training %>%
  ml_linear_regression(mpg ~ wt + cyl)

# summarize the model
summary(fit)

# Score the data
pred <- sdf_predict(fit, partitions$test) %>%
  collect

# Plot the predicted versus actual mpg
ggplot(pred, aes(x = mpg, y = prediction)) +
  geom_abline(lty = "dashed", col = "red") +
  geom_point() +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_fixed(ratio = 1) +
  labs(
    x = "Actual Fuel Consumption",
    y = "Predicted Fuel Consumption",
    title = "Predicted vs. Actual Fuel Consumption"
  )

## SQL from within Spark, connection "sc"
library(DBI)
iris <- copy_to(sc, iris, "iris", overwrite = TRUE)
iris_preview <- dbGetQuery(sc, "SELECT *
                           FROM iris Limit 10")
iris_preview
