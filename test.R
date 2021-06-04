library(readr)
d <- rnorm(1e6)
write_csv(d, "test.csv")