series_sum <- function(user_terms){
  
  first_term <- 0
  sum <- first_term
  
  for (i in 1:user_terms){
    if (i%%2 ==0){
      sum <- sum - (i/(2*i-1))
    }
    else{
      sum <- sum + (i/(2*i-1))
    }
  }
  
  print (sum)
}

get_user_input <- function(){
  user_terms <- readline("Enter the number of terms : ")
  user_terms <- as.integer(user_terms)
  
  series_sum(user_terms)
}

get_user_input()
