library(factRedux)

test <- mtcars

test$cyl <- factor(test$cyl)

test <- factRedux(test,factor = "cyl", levels=2, inc.other = TRUE)

