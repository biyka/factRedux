#' @author Ben Downe
#' 
#' @param factor factor to be simplified
#' 
#' @title factRedux Function
#' 
#' @details Function to create an other category in functions where there are too many different levels to present cleanly
#' 
#' @export
#' 
#' 

factRedux <- function(data, factor = "", levels=10, inc.other=TRUE) {
  
  l <- data %>% count_(factor, sort=TRUE) %>% head(n=levels)
  
  l[,factor] <- droplevels(l[,factor])
  
  data[,factor] <- factor(data[,factor], levels = c(levels(l[,factor]), "Other"))
  
  data[!(data[,factor] %in% l[,factor]), factor ] <- "Other"
  
  if (!(inc.other)) {
    
    data[data[,factor] == "Other" ] <- NULL
    
  }
  
  return(data)
  
}
