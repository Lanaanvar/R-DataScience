data_validation <- function(age, grade){
  
  valid_grades <- list("A", "B", "C", "D", "F")
  
  
  if (age > 0 & (grade %in% valid_grades)){
    return(TRUE)
  }
  else{
    print("The entered input is not valid")
    return(FALSE)
  }
  
}

avg_age <- function(age_list) {

  average <- mean(unlist(age_list))
  
  return(sprintf("The average age is %.0f", average))
}

get_user_input <- function(){
  
  stud_num <- readline("Enter number of students : ")
  stud_num <- as.integer(stud_num)
  
  age_list <- list()
  
  
  for (i in 1:stud_num) {
    cat(sprintf("\nEnter the student details for Student %d:\n", i))
    
    name <- readline("Enter name: ")
    age <- readline("Enter age: ")
    age <- as.integer(age)
    
    grade <- readline("Enter grade: ")
    
    if (data_validation(age, grade)) {
      
      age_list <- append(age_list, age)
      
    } else {
    
      i <- i - 1
    }
  }
  
  if (length(age_list) == stud_num) {
    cat(avg_age(age_list), "\n")
  }
  
}

get_user_input()


