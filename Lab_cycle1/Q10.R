get_input_list <- function() {
  input_string <- readline(prompt = "Enter the elements of the list separated by commas: ")

  elements <- unlist(strsplit(input_string, split = ",\\s*"))
  
  element_list <- lapply(elements, function(x) {
    if (!is.na(as.numeric(x))) {
      as.numeric(x)
    } else if (x == "TRUE" || x == "FALSE") {
      as.logical(x)
    } else {
      x
    }
  })
  
  return(element_list)
}

reverse_list <- function(x, reversed = list()){
  if (length(x)==0){
    return(reversed)
  }
  
  reverse_list(x[-1], c(list(x[[1]]),reversed))
}

user_list <- get_input_list()

print("Original list:")
print(user_list)

reversed_list <- reverse_list(user_list)

print("Reversed list:")
print(reversed_list)
