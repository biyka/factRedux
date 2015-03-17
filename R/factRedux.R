#' 
#' @title factRedux Function
#' 
#' @author Ben Downe
#' 
#' @param factor factor to be simplified
#' @param new.level factor level to replace levels outside those being considered
#' @param levels number of levels to retain
#' @param include.other if the other factor levels are to be retained
#' 
#' @details Function to create an other category in functions where there are too many different levels to present cleanly
#' 
#' @import magrittr
#' @import dplyr
#' 
#' @export
#' 

factRedux <- function(data, factor = "", new.level = "Other", levels=10, inc.other=TRUE) {
  
  l <- as.data.frame(data %>% count_(factor, sort=TRUE) %>% head(n=levels))
  
  l[,factor] <- droplevels(l[,factor])
  
  data[,factor] <- factor(data[,factor], levels = c(levels(l[,factor]), "Other"))
  
  data[!(data[,factor] %in% l[,factor]), factor ] <- "Other"
  
  if (!(inc.other)) {
    
    data[data[,factor] == "Other" ] <- NULL
    
  }
  
  return(data)
  
}
