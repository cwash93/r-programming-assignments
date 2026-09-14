## Create the vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

## Combine 
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

## view structure
str(df_polls)

## Summary stats
mean(df_polls$ABC_poll)
mean(df_polls$CBS_poll)
median(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll","CBS_poll")])

## Add column
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

## View column headers
head(df_polls)

## Visualize
# Create bar chart
library(ggplot2)

poll_long <- df_polls %>%
  pivot_longer(
    cols = c(ABC_poll, CBS_poll),
    names_to = "Poll",
    values_to = "Percentage"
  )

ggplot(poll_long, aes(x = Name, y = Percentage, fill = Poll)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "ABC and CBS Poll Results",
    x = "Candidate",
    y = "Poll Percentage",
    fill = "Poll"
  )