fib_series <- function(num_terms){
  
  count <- 3
  i <- 0
  j <- 1
  k <- 2
  
  print(i)
  print(j)
  print(k)
  
  while (count<num_terms){
    new_term = j+i+k
    count <- count+1
    print(new_term)
    i <- j
    j <- j+1
    k <- k+1
  
  }
}

fib_series(10)