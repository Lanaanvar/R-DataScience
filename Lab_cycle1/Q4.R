password_generator <- function(password_length){
  all_letters <- c(letters, LETTERS, 0:9, "!", "@", "#", "$", "%", "^", "&", "*", "(", ")")
  
  random_password <- paste(sample(all_letters, password_length, replace = TRUE), collapse = "")
  
  print(random_password)
}

get_user_input <- function(){
  password_length <- readline("Enter the number of terms : ")
  password_length <- as.integer(password_length)
  
  password_generator(password_length)
}

get_user_input()