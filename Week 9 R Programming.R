data("iris", package = "datasets")

head(iris)

# Scatter plot: Petal Length vs Petal Width
plot(iris$Petal.Length, iris$Petal.Width,
     main = "Base R: Petal Length vs Petal Width",
     sub = "By Ciara Washington",
     xlab = "Petal Length",
     ylab = "Petal Width",
     col = "purple",
     pch = 19)

# Histogram: Petal Length
hist(iris$Petal.Length,
     main = "Base R: Petal Length Distribution",
     sub = "By Ciara Washington",
     xlab = "Petal Length",
     col = "pink")

library(lattice)

# Scatter plot by species
xyplot(Petal.Width ~ Petal.Length | Species,
       data = iris,
       main = "Lattice: Petal Length vs Width by Species",
       sub = "By Ciara Washington",
       xlab = "Petal Length",
       ylab = "Petal Width",
       col = "purple",
       pch = 19)

# Boxplot: Petal Length by Species
bwplot(Petal.Length ~ Species,
       data = iris,
       main = "Lattice: Petal Length by Species",
       sub = "By Ciara Washington",
       xlab = "Species",
       ylab = "Petal Length",
       col = "pink")

library(ggplot2)

# Scatter plot with trend lines
ggplot(iris, aes(x = Petal.Length,
                 y = Petal.Width,
                 color = Species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("pink", "purple", "lightblue")) +
  labs(
    title = "ggplot2: Petal Length vs Width by Species",
    subtitle = "By Ciara Washington",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_minimal()

# Histogram by species
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(fill = "purple", color = "lightblue", bins = 10) +
  facet_wrap(~ Species) +
  labs(
    title = "ggplot2: Petal Length Distribution by Species",
    subtitle = "By Ciara Washington",
    x = "Petal Length",
    y = "Count"
  ) +
  theme_minimal()