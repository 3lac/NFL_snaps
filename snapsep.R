#function that separates snap count and percentage
snapsep <- function(x,n){    # x is the data frame, n is the weeks played
  nr <- nrow(x)
  for (i in 1:nr){ #outter loop for rows
    for(q in 3:5){  # inner loop for columns
      combined <- x[i,q]
      if(is.na(combined)){
          x[i,q-1] <- 0
          x[i,q] <- 0
      }
      if (!is.na(combined)) {
        if(combined/10 >= 1){
          x[i,q-1] <- trunc(combined/10)
          x[i,q] <- combined%%10
        }
        if(combined/100 >= 1){
          x[i,q-1] <- trunc(combined/100)
          x[i,q] <- combined%%100
        }
        
        if(combined/1000 >= 1){
          x[i,q-1] <- trunc(combined/100)
          x[i,q] <- combined%%100
        }
        if(combined/10000 >= 1){
          x[i,q-1] <- trunc(combined/1000)
          x[i,q] <- combined%%1000
        }
      }
    }
  }
  x
}
