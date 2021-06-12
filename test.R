library.path <- .libPaths()
# print(library.path)
.libPaths(c("C:/Users/abel/Documents/R/R-4.0.3/library", .libPaths()))
library.path <- .libPaths()
# print(library.path)

wd <- "C:/Users/abel/Documents/GitHub/demography-talks/"

library(readr)
d <- data.frame(x = rnorm(1e6))
write_csv(d, paste0(wd, "test.csv"))

# file.remove("test.csv")