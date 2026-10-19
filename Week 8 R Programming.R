# load packages and dataset
install.packages("plyr")
library(plyr)
student6 <- Assignment.6.Dataset

# compute mean of Grade by Sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
print(gender_mean)

# Write the grouped means to a file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

# Filter tor names containing "i"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
print(i_students)

# write to csv
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)