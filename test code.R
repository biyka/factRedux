library(magrittr)
library(dplyr)

test <- mtcars

test$cyl <- factor(test$cyl)

test2 <- factRedux(test,factor = "cyl", levels=2)

test[,t]

data <- test

factor <- "cyl"

levels <- 2

l <- data %>% count_(factor, sort=TRUE) %>% head(n=levels)

l[,factor] <- droplevels(l[,factor])

data[,factor] <- factor(data[,factor], levels = c(levels(data[,factor]), "Other"))

data[!(data[,factor] %in% l[,factor]), factor ] <- "Other"
