num_str <- readline(prompt = "Enter number: ")

prime_checker <- function(number){
  
  if (is.character(number)) {
    number <- as.integer(number)
  }
  
  if (is.na(number) || number <= 1) {
    return(print("The number is not prime"))
  }
  
  if (number == 2 || number == 3) {
    return(TRUE)
  }
  
  is_prime <- TRUE
  for (i in 2:floor(sqrt(number))){
    if (number %% i == 0){
      is_prime <- FALSE
      break
    }
  }
  
  if (is_prime) {
    return (TRUE)
  } else {
    return (FALSE)
  }
}

prime_number_range <- function(){
  lower_num_str <- readline("Enter lower range : ")
  upper_num_str <- readline("Enter upper range : ")
  
  lower_num <- as.integer(lower_num_str)
  upper_num <- as.integer(upper_num_str)
  
  for (i in lower_num:upper_num){
    if (prime_checker(i)){
      print(i)
    }
  }
}


prime_checker(num_str)
prime_number_range()



